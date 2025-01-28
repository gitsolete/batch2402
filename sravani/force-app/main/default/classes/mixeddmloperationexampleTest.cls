@istest
public class mixeddmloperationexampleTest {
    
    
    static testmethod void testfuturemethod(){
        
        
        //you can run the test logic on specific username
        //fetch the user 
        user userrecord=[select id, profile.id from user where username='batch2402@awco.in' limit 1];
        
        system.runas(userrecord){
            
            Profile p=[select id from profile where name='testsystemadmin' limit 1];
            
            User u=new user(Alias='testuser', Email='sfdcshares@gmail.com',lastname='testusermix',
                           username='testusermix@awco.com',emailencodingkey='UTF-8',
                           LANGUagelocalekey='en_US',localesidkey='en_Us',
                           profileid=p.id,timezonesidkey='America/Los_Angeles');
            insert u;
            
            mixeddmloperationexample.dodmloperation();
            
        }
        
        
    }

}