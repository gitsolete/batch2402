public with sharing class AccountsQueueable implements Queueable{
    public AccountsQueueable() {

    }


    public void execute(QueueableContext context){
        // we will execute here
        Account acc=new Account();
        acc.name='queueable test';
        acc.Phone='234234234';
        acc.fax='234234';
        acc.Type='prospect';
        acc.Industry='finance';
        insert acc;

        if(acc.id!=null){
            //chaining the job creating contact
            Id jobid=system.enqueueJob(new ContactsQueueable(acc));
        }
    }

}