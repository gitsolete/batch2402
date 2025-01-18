trigger LeadTrigger on Lead (After update,before insert,AFter insert) {
    
    if(Trigger.isAfter){
        if(Trigger.isUpdate || Trigger.isInsert){
            //get the record status 
            Leadstatus statusrec=[select id,masterlabel,isconverted from leadstatus 
                                 where isconverted=true 
                                 limit 1];
            
            //list to hold leads to convert
            list<Database.leadconvert> listtoconvert=new list<Database.leadconvert>();
            
            for(lead ld:Trigger.New){
                if(ld.status=='Closed - Converted' && ld.isconverted==false){
                    Database.leadconvert lconvert=new Database.leadconvert();
                    lconvert.setleadid(ld.id);
                    lconvert.setsendnotificationemail(true);
                    lconvert.setdonotcreateopportunity(false);
                    lconvert.setconvertedstatus(statusrec.MasterLabel);
                    
                    listtoconvert.add(lconvert);
                }
            }
            
            if(!listtoconvert.isempty()){
                Database.leadconvertresult[] results=Database.convertlead(listtoconvert);
            }
        }
    }
    
    if(Trigger.isbefore){
         if(Trigger.isInsert){
            Leadhandler.setleadstatus(Trigger.New);
        }
    }

}