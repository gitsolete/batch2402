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
}