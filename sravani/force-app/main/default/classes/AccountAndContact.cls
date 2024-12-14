public class AccountAndContact {
    
    
    public Account accobj;
    public Contact con;
    
    public void createaccount(){
        accobj=new Account();
        accobj.name='microsoft';
        accobj.phone='1111111';
        accobj.fax='111111111';
        accobj.Active__c='yes';
        if(accobj!=null){            
            insert accobj;
            system.debug('account created::'+accobj);
            if(accobj.id!=null){
                createcontact();
            }
        }     
       
    }
    
    public void createcontact(){
            con=new contact();
            con.lastname='microsoftcon1';
            con.phone='989898';
            con.accountid=accobj.id;
            if(con!=null){
                insert con;
                system.debug('contact record::'+con);
            }
        }
    
    
}