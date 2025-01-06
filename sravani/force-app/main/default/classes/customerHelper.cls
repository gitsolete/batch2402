public with sharing class customerHelper {
    private integer custid;
    private string custname,address,phone;
    private decimal amount;

    public customerHelper() {
        custid=34;
        custname='ramkrishna';
        address='hyd';
        phone='234234';
        amount=50000;
    }

    public void showvalues(){        
        system.debug('custid..'+custid);
        system.debug('custname..'+custname);
        system.debug('address..'+address);
        system.debug('phone..'+phone);
    }
}