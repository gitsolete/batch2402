public with sharing class producthelper {

    public string prdname;
    public integer prdid;
    public decimal unitprice;

    public producthelper() {
        system.debug('non param construcor');
    }

    public producthelper(String pname,integer pid,decimal punitprice){
        prdname=pname;
        prdid=pid;
         unitprice=punitprice;
    }


    public void showvalues(){
        system.debug('product name is'+prdname);
        system.debug('product id is'+prdid);
        system.debug('product unitprice is'+unitprice);
    }

    public integer showvalues(string name){
        return 5;

    }
}