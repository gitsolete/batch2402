@isTest
public class DatabaseUtilityTest {
    
    
    public static testmethod void dbtest(){
        DatabaseUtility dbuobj=new DatabaseUtility();
        
         DataForTest.createleads();
        
        DatabaseUtility.getallleads();
        DatabaseUtility.accountwithcase();
        DatabaseUtility.getaccountbychar('test');
        
        DataForTest.createaccount();
        databaseutility.getcontactsbyindustry('energy');
        
        DataForTest.createpositions();
        databaseutility.getpositionsfromlocation('Hyd');
        databaseutility.getallpositions();
        databaseutility.getlimitcontacts();
        databaseutility.getallaccounts();
        databaseutility.getrecordbylimit(3,6);
        
        
       // databaseutility.getcandidatebylocation('');
        
    }

}