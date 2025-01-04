global with sharing class calculateTotalRevenueBatch implements database.Batchable<sobject>,Database.stateful {
    public calculateTotalRevenueBatch() {

    }

    Global Decimal totalamount=0;

    global database.QueryLocator start(Database.BatchableContext bContext) {
    String accountquery='select id, annualrevenue from account where annualrevenue!=null';
    return Database.getQueryLocator(accountquery);
    }

    global void execute(Database.BatchableContext bc,list<sobject> acclist){
        for(Sobject acc:acclist){
            Account account=(Account)acc;
            totalamount+=account.AnnualRevenue;
        }
    }

    global void finish(Database.BatchableContext bc){
        System.debug('total revenue is:=='+totalamount);
        //send email notification
        AsyncApexjob jobdetails=[Select id,status,Totaljobitems,Jobitemsprocessed,
        numberoferrors,createddate,CompletedDate,createdby.email from AsyncApexjob where id=:bc.getjobid()];
        MessagingUtility.sendtotalrevenueemail(jobdetails,'Calculate total revenue',totalamount);
    }

}