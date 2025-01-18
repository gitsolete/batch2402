public with sharing class ContactHelper {
    public ContactHelper() {

    }

    public void createcontactsbulk(integer num){
        list<contact> conlist=new list<contact>();
        for(integer i=1;i<=num;i++){
            contact con=new contact();
            con.firstname='contact'+i;
            con.lastname='lastname';
            conlist.add(con);
        }
        if(!conlist.isempty())
            insert conlist;
        system.debug('contact inserted'+conlist);
        
    }

    public static void sendemailnotification(){
        //get all candidates who are not having accoutn details and email field not null
         //[Select id,lastname,firstname,accountid,email from contact where accountid=null and email!=null limit 10];
         Map<id,contact> contactmap=new Map<id,contact>([Select id,lastname,firstname,accountid,email 
                                                        from contact 
                                                        where accountid=null and email!=null and 
                                                        email in ('sfdcshares@gmail.com','venkata.of@gmail.com')]);
        List<ID> conids=new list<id>();
        if(!contactmap.isEmpty()){
           conids.addall(contactmap.keySet());
        }

        If(!conids.isEmpty()){
            //get email template
            EmailTemplate template=[select id,name,isactive from EmailTemplate where name='Contact Notification'];
            if(template.id!=null && template.isactive==true){
                Messaging.MassEmailMessage massemail=new Messaging.MassEmailMessage();
                massemail.setTargetObjectIds(conids);
                massemail.setTemplateId(template.id);
                Messaging.sendemail(new Messaging.MassEmailMessage[]{massemail});
            }           
        }
    }
    
    public static void setphonefax(List<Account> acclist){
        
        List<Contact> contactlisttoupdate=new list<Contact>();
        For(Account acc:acclist){
            if(!acc.contacts.isempty()){
                for(Contact con:acc.contacts){
                    con.phone=acc.phone;
                    con.fax=acc.fax;
                    contactlisttoupdate.add(con);
                }
            }
        }
        if(!contactlisttoupdate.isempty()){
            update contactlisttoupdate;
        }
    }
}