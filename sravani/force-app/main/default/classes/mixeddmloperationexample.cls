public with sharing class mixeddmloperationexample {
    public mixeddmloperationexample() {

    }


    public static void dodmloperation(){

        // update user detail
            User userrecord=[select id, lastname, username, isactive from user where username='salesadmin2402@awco.in' limit 1];
            if(userrecord!=null)
            {
                userrecord.isactive=False;
                update userrecord;
                system.debug('user record is updated');
            }
       updateaccount();
    }

    @future
    public static void updateaccount(){
         //update account detail 
         Account accountrecord=[select id, name, site, phone from account where name ='Tata motors' limit 1];
         if(accountrecord!=null){
             accountrecord.site='www.tatamotors.com';
             update accountrecord;
             system.debug('account record updated');
         }
    }
}