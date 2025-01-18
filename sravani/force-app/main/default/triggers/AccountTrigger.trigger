trigger AccountTrigger on Account (before insert,before update,before Delete,after update) {
    
    if((Trigger.isinsert || Trigger.isUpdate) && Trigger.isbefore){
        
       /*which record have to  rating to hot 
		for(Account acc:Trigger.new){
            if(acc.phone=='' || acc.phone==null){
                acc.phone.adderror('provide phone value from trigger');
            }
			acc.rating='hot';
		}*/
        
        //set annualrevenue
        for(Account acc:Trigger.New){
            if(acc.industry=='Banking')
                acc.annualrevenue=80000000;
            else if(acc.industry=='Finance')
                acc.annualrevenue=70000000;
            else if(acc.industry=='Insurance')
                acc.annualrevenue=60000000;
            else if(acc.industry=='HealthCare')
                acc.annualrevenue=50000000;
            else
                acc.annualrevenue=400000;
        }
	}

    //insert,update,database.insert,database.update
    //
    if(Trigger.isdelete && Trigger.isbefore){
        for(Account acc : Trigger.old){
            if(acc.active__c=='Yes'){
                acc.adderror('active accounts cannot delete');
            }
        }
        
        //remove deleting account relation value from the associated contacts 
        //
        list<contact> conlist=[select id, accountid from contact where accountid in :Trigger.oldmap.keyset() ];
        for(contact con:conlist){
            con.accountid=null;
        }
        update conlist;
    }
    
    
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            //using account fetch associated contacts 
          List<Account> accountlist=[select id,name,phone,fax,(Select id,phone,fax from contacts) from Account
                                    where id in:Trigger.newmap.keyset()];
            ContactHelper.setphonefax(accountlist);
        }
    }
}