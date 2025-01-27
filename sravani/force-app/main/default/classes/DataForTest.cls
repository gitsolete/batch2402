public class DataForTest {
    
    
    public static void createleads(){
        
        List<lead> leadlist=new list<Lead>();
        for(integer i=0;i<=10;i++){
            Lead l=new lead();
            l.LastName='testclasslead'+i;
            l.Phone='1231232';
            l.City='hyd';
            l.Fax='6546987978';
            l.Company='testclasscompany';
            l.Website='www.testclasscompany.com';
            leadlist.add(l);
        }
        insert leadlist;
    }
    
    public static void createaccount(){
        list<Account> accountlist=new list<Account>();
        for(integer i=1;i<=10;i++){
            Account acc=new Account();
            acc.Name='testclassaccount'+i;
            acc.Phone='1234565789';
            acc.BillingCity='hyderabad';
            acc.Industry='energy';
            accountlist.add(acc);
        }
		system.debug(accountlist);
        insert accountlist;
        if(!accountlist.isempty()){
            for(Account acc:accountlist){
                createcontacts(acc.Id);
            }
        }
    }
    
    public static void createcontacts(Id accid){
        list<Contact> conlist=new list<contact>();
        for(integer i=1;i<=5;i++){
            contact con=new contact();
            con.lastname='testclasscontact'+i;
            con.AccountId=accid;
            con.Phone='123445';
            conlist.add(con);
        }
        insert conlist;
    }
    
    public static void createpositions(){
        HiringManager__c hmgr=new HiringManager__c();
        hmgr.name__c='hmgrtestclass';
        hmgr.email__c='hmgrtestclass@gmail.com';
        hmgr.Phone__c='1234567890';
        insert hmgr;
        
        Position__c ps=new Position__c();
        ps.Name__c='testclassposition';
        ps.Location__c='Hyd';
        ps.phone__c='78979879';
        ps.hiringmanger__c=hmgr.Id;
        
        insert ps;
        
    }

}