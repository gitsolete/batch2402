trigger hmgrtrigger on HiringManager__c (after insert,before insert,before delete,after delete,
                                         before update,after update,after undelete) {
    
   /* if(hiringmangerHelper.flag){
        hiringmangerHelper.flag=false;
        hiringmangerHelper.afterinsert();
    }*/
                                             
   if(Trigger.isbefore){
       system.debug('Trigger.New data-------'+Trigger.New);
       system.debug('Trigger.Newmap data----'+Trigger.newmap);
       system.debug('Trigger.Old data-------'+Trigger.old);
       system.debug('Trigger.oldmap data----'+Trigger.oldmap);
   }
   if(Trigger.isafter){
       system.debug('Trigger.New data-------'+Trigger.New);
       system.debug('Trigger.Newmap data----'+Trigger.newmap);
       system.debug('Trigger.Old data-------'+Trigger.old);
       system.debug('Trigger.oldmap data----'+Trigger.oldmap);
   }
    	

}