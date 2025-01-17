public with sharing class ContactsQueueable implements Queueable {
    
    public Account accrecord;
    
    public ContactsQueueable(Account acc) {
        accrecord=acc;
    }

    public void execute(QueueableContext context) {
        List<Contact> conlist=new List<Contact>();
        for(integer i=1;i<=100;i++){
            Contact con=new Contact();
            con.firstname='Queueable'+i;
            con.lastname='contact';
            con.AccountId=accrecord.id;
            conlist.add(con);
        }
        insert conlist;
    }
}