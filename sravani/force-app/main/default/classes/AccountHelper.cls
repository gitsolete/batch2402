public class AccountHelper {
    
    public void createaccount(){
        
        Account acc=new Account();
        acc.name='vscode';
        acc.Phone='234234';
        acc.Fax='234234234';
        acc.Active__c='yes';
        acc.website__c='www.vscode.com';
        insert acc;
        if(acc!=null && acc.Id!=null){
            createcase(acc.id);
        }
    }
    
    public void createcase(id accountid){
        Case cs=new Case();
        cs.Subject='product quality not good';
        cs.Description='product not good';
        cs.Priority='high';
        cs.Status='new';
        cs.Origin='Phone';
        cs.AccountId=accountid;
        insert cs;
    }

}