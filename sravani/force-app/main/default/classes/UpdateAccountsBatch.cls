Global with sharing class UpdateAccountsBatch implements Database.Batchable<sObject> {
    public UpdateAccountsBatch() {

    }

   Global Database.QueryLocator start(Database.BatchableContext bcontext){
    String accountquery='select id, name,phone,fax,industry,website from account';
    return Database.getQueryLocator(accountquery);
   } 

   Global void execute(Database.BatchableContext bcontext ,List<Account> acctlist){
    system.debug('acct-->'+acctlist);
    system.debug('bcontext-->'+bcontext);
       for(Account acc:acctlist){
           acc.website='www.google.com';
           acc.phone='55554545454';
           acc.fax='1111111111111';
           acc.industry='Insurance';
       }
       update acctlist;
   }

   global void finish(database.BatchableContext bc){
    	system.debug('batch execution completed');
       system.debug('batch job id::'+bc.getjobid());
         // send email notification
         //email programming

         AsyncApexjob jobdetails=[Select id,status,Totaljobitems,Jobitemsprocessed,
         numberoferrors,createddate,CompletedDate,createdby.email from AsyncApexjob where id=:bc.getjobid()];

         MessagingUtility.sendbatchemail(jobdetails, 'Update accounts batch');
   }   
}