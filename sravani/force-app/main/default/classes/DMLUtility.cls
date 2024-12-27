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
}