@isTest
public class mathoperationsTest {

    
    public static testmethod void mathtest(){
        Account acc=new Account();
        acc.name='testaccount';
        insert acc;
        List<Account> acclist=[select id,name from account];
        system.debug(acclist);
        mathoperations mobj=new mathoperations();
        mobj.addition();
        system.debug('addition result::'+mobj.c);
        system.assertequals(10,mobj.c,'Addition logic is not working');
        mobj.substraction(10, 23);
        Integer mresult=mobj.mult();
        system.debug('mulresult::'+mresult);
    }
}