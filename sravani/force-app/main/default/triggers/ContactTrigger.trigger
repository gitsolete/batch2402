trigger ContactTrigger on Contact (before insert, before update) {

    
    if(Trigger.isbefore){
        
        if(Trigger.isinsert || Trigger.isupdate){
            
            for(contact con:Trigger.New){
                if(con.Accountid==null){
                   // con.adderror('please make theis contact should be associated with an account');
                }
            }
        }
    }
}