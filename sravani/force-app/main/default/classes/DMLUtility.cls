public with sharing class DMLUtility {
    public DMLUtility() {

    }

    //dml Insert statment 
    public static void insertbulkcases(Integer noofcases){

        if(noofcases>0){
            List<Case> caselist=new List<case>();

            for(integer i=1;i<=noofcases;i++){
                Case cs=new CASe();
                cs.Subject='bulk case failed'+i;
                cs.Description='hulk cases failed'+i;
                cs.Priority='high';
                if(i/5==0){
                    cs.Priority='low';
                }
                cs.Status='new';
                if(i!=7){
                    cs.Origin='phone';
                }               
                caselist.add(cs);
            }
           
            if(!caselist.isEmpty()){
                insert caselist;
            }
        }
    }

    public static void insertbulkcontacts(integer maxrecords){

        if(maxrecords>0){
            List<Contact> contactlist=new List<Contact>();
            for(integer i=1;i<=maxrecords;i++){
                Contact con=new Contact();
                con.firstname='bulk contact'+i;
                if(i!=8){  
                    con.lastname='failed'+i;    
                }                
                con.phone='345678'+i;
                con.email=con.lastname+'@gmail.com';
                contactlist.add(con);
            }

            if(!contactlist.isEmpty()){
                Database.SaveResult[] results=Database.insert(contactlist,false);
                for(database.SaveResult result :results){
                    if(result.isSuccess()){
                        system.debug('record is been inserted successfully'+result.id);
                    }
                    else{
                        for(Database.Error err:result.getErrors()){
                            system.debug('error code:'+err.getStatusCode());
                            system.debug('error message:'+err.getMessage());
                            system.debug('effected fields::'+err.getFields());
                        }
                    }

                }
            }
        }
    }

    //dlete contact record
    public static void deletecontactbystartingchar(string stringchar){
        if(stringchar!=null && stringchar!=''){
            string query='select id,lastname,firstname from contact where lastname like'+'\''+stringchar+'%'+'\'';
            stringchar='%'+stringchar+'%';  
            
        }

        List<Contact> conlisttoremove=[select id,lastname from contact 
                                        where lastname like :stringchar];
        
        if(!conlisttoremove.isempty()){
            //delete conlisttoremove;
            Database.deleteresult[] results=Database.delete(conlisttoremove,false);
            for(database.deleteresult result:results){
                if(result.issuccess()){
                    system.debug('record id:'+result.id);
                }else{
                    for(Database.Error err:result.getErrors()){
                        system.debug('error code:'+err.getStatusCode());
                        system.debug('error message:'+err.getMessage());
                        system.debug('effected fields::'+err.getFields());
                    }
                }
        
            }                                
        //delete[select id,lastname from contact where lastname like :stringchar];
        }
    }


    //undelete 
    public static void undeletecontact(){
        List<Contact> conlist= [select id,lastname,email,phone from contact where isdeleted=true all rows];
        system.debug(conlist);

        Database.undeleteresult[] results=database.undelete(conlist,false);
        for(database.UndeleteResult result :results){
            if(result.isSuccess()){
                system.debug('record is been restored successfully'+result.id);
            }
            else{
                for(Database.Error err:result.getErrors()){
                    system.debug('error code:'+err.getStatusCode());
                    system.debug('error message:'+err.getMessage());
                    system.debug('effected fields::'+err.getFields());
                }
            }
        }
    }


    //update
    public static void updateaccount(){

    }

    //update case status to closed which are in new status 
    public static void updatecasestatus(){
        list<case> caselisttoupdate=[select id,status from case where status='New' 
                                        and createddate<Last_N_Days:10 and isclosed=false];
        
        for(case cs:caselisttoupdate){
            cs.status='Closed';
        }

        Database.saveresult[] results=database.update(caselisttoupdate,false);
        for(database.SaveResult result :results){
            if(result.isSuccess()){
                system.debug('record is been updated successfully'+result.id);
            }
            else{
                for(Database.Error err:result.getErrors()){
                    system.debug('error code:'+err.getStatusCode());
                    system.debug('error message:'+err.getMessage());
                    system.debug('effected fields::'+err.getFields());
                }
            }

        }
    }

    //Deactivate the user - 
    public static void deactivateuser(){
        User usertodeactivate=[select id, username, isactive from user where username='sapintegrationuser' limit 1];
        if(usertodeactivate!=null){
            usertodeactivate.isActive=false;
            update usertodeactivate;
        }
    }
    
    //upsert 
    // cases which are in new status update priority is high and create new case record  
    public static void upsertcase(){
        

        Case newcase=new case();
        newcase.Subject='upsert case';
        newcase.Description='upsert case';
        newcase.Priority='hight';
        newcase.Origin='phone';
        newcase.Reason='Installation';
        
        list<case> casetoupdate=[select id,status,priority from case where status='new'];
        for(case cs:casetoupdate){
            cs.Priority='high';
        }

        casetoupdate.add(newcase);
        Database.UpsertResult[] results=Database.upsert(casetoupdate,false);
        for(database.UpsertResult result:results){
            if(result.isSuccess()){
                if(result.iscreated()){
                    system.debug('created  record id:'+result.id);
                }else{
                    system.debug('record is been updated id:'+result.id);
                }
            }
            else{
                    for(Database.Error err:result.getErrors()){
                            system.debug('error code:'+err.getStatusCode());
                            system.debug('error message:'+err.getMessage());
                            system.debug('effected fields::'+err.getFields());
                    }
                }
        }
    }  
}