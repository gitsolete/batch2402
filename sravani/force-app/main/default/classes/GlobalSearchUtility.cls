public with sharing class GlobalSearchUtility {
    public GlobalSearchUtility() {

    }

    public static void serachrecords(){
        List<List<Sobject>> searchresults=[FIND 'bulk*' IN ALL FIELDS RETURNING 
                                            Account(id,name,industry,phone),
                                            Contact(id,Lastname,phone,email),
                                            Lead(id,Lastname,firstname,email,company),
                                            Position__c(id,name__c,location__C),
                                            HiringManager__c(id,name__c,phone__c)];

        if(!searchresults.isempty()){
            List<Account> acclist=(List<Account>)searchresults.get(0);
             List<Contact> conlist=(List<Contact>)searchresults.get(1);
             List<Lead> leadlist=(List<Lead>)searchresults.get(2);
             List<Position__c> poslist=(List<Position__c>)searchresults.get(3);
             List<HiringManager__c> hmgrlist=(List<hiringmanager__C>)searchresults.get(4);
            for(List<Sobject> listobj:searchresults){
                system.debug(listobj);
            }
            for(Account accobj:acclist){
                system.debug(accobj);
            }
            for(Contact conobj:conlist){
                system.debug(conobj);
            }
            system.debug('hiring amanger');
            for(hiringmanager__C  hmgr:hmgrlist){
                system.debug(hmgr);
            }
            
        }
    }


    public static void dynamicsearch(String serachstring){
        String searchquery='FIND \''+serachstring+ '*\' IN ALL FIELDS RETURNING '+
                            'Account(id,name,industry,phone),'+
                            'Contact(id,name,phone,email),'+
                            'Lead(id,name,firstname,email,company),'+
                            'Position__c(id,name__c,location__C),'+
                            'HiringManager__c(id,name__c,phone__c)';
        
        
        List<List<Sobject>> searchresults=search.query(searchquery);

        if(!searchresults.isempty()){
            List<Account> acclist=(List<Account>)searchresults.get(0);
             List<Contact> conlist=(List<Contact>)searchresults.get(1);
             List<Lead> leadlist=(List<Lead>)searchresults.get(2);
             List<Position__c> poslist=(List<Position__c>)searchresults.get(3);
             List<HiringManager__c> hmgrlist=(List<hiringmanager__C>)searchresults.get(4);


            for(List<Sobject> listobj:searchresults){
                system.debug(listobj);
            }

            for(Account accobj:acclist){
                system.debug(accobj);
            }

             for(Contact conobj:conlist){
                 system.debug(conobj);
             }
             for(Lead leadobj:leadlist){
                 system.debug(leadobj);
             }

              for(Position__c posobj:poslist){
                  system.debug(posobj);
              }

              for(HiringManager__c hmgr:hmgrlist){
                  system.debug(hmgr);
              }
              
        }       

    }
}