@isTest
public class UpdateAccountsBatchTest {
    
    public static testmethod void batchtest(){
        
        List<Account> accountlist=new list<Account>();
        
        for(integer i=1;i<10;i++){
            Account acc=new Account();
            acc.Name='testbatchaccount'+i;
            acc.Phone='123456789';
            acc.BillingCity='kadapa';
            acc.Active__c='Yes';
            accountlist.add(acc);
        }
        insert accountlist;
        
        
        //to bypass the governor limits
        Test.startTest();
        UpdateAccountsBatch myobj=new UpdateAccountsBatch();
        Database.executebatch(myobj);
        TEst.stoptest();
        
        
        Test.startTest();
        // other operations
        TEst.stoptest();
        
        
    }

}