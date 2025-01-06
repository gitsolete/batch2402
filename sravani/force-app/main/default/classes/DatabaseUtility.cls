public with sharing class DatabaseUtility {
    public DatabaseUtility() {
        
    }
    
    
    public static void getallleads(){
        List<Lead>  leadlist=[select id,lastname,firstname,phone,email,company from lead];
        system.debug(leadlist);
        
        for(Lead leadobj:leadlist){            
            system.debug(leadobj.id +'--'+leadobj.lastname+'--'+leadobj.firstname+'--'+leadobj.phone);
        }
    }
    
    
    //wap to fetch all the position records and store in the map 
    public static void getallpositions(){
        List<Position__c>  poslist=[select id,name,name__C from Position__c];
        system.debug(poslist);  
        Map<Id,Position__c> posmap=new Map<id,Position__c>();
        //prepare position map here
        for(Position__c psrec :poslist){
            posmap.put(psrec.id,psrec);
        }
        system.debug(posmap);
        
        for(Id psid:posmap.keyset()){
            system.debug('position id::'+psid+'--'+posmap.get(psid));
        }
    }
    
    
    //wap to gecth the 5 reocrds from cotnact and sotre in map<conid,contactrecord>
    public static void getlimitcontacts(){
        List<contact> conlist=[select id,name from contact limit 5];
        system.debug(conlist);
        Map<Id,Contact> conmap=new map<id,contact>();
        for(contact con:conlist){
            conmap.put(con.id,con);
        }
        system.debug(conmap);
        
        for(Id cid:conmap.keyset()){
            system.debug('conetence id ::'+cid+'--'+conmap.get(cid));
        }
    }
    
    //example for allrows clause
    public static void getallaccounts(){
        List<account> acclist=[select id,name from account ALL ROWS];
        system.debug(acclist.size());
        
        List<account> acclist2=[select id,name from account];
        system.debug('without all rows clause::'+acclist2.size());
    }
    
    //example fro offset
    
    public static void getrecordbylimit(integer lim,integer off){
        List<account> acclist=[select id,name from account limit:lim offset:off];
        system.debug(acclist.size());
    }
    
    
    //wap to find all the accounts for which at least a contact is present
    public static void accountwithcase(){
        List<Account> acclist=[select id,name from Account where id 
                               IN(select accountId from Contact)];
        system.debug(acclist);
    }
    
    //wap to get positions based on specified location
    public static void getpositionsfromlocation(string location){
        List<Position__c> poslist=[select id,name,name__c from Position__c where   Location__c=:location];
        system.debug(poslist);
        if(!poslist.isempty()){
            //logix
            for(Position__c posrec:poslist){
                system.debug(posrec);
            }
        }
    }
    
    //wap to get the account reocrds based on specified name ends with kumar
    public static void getaccountbychar(string inputstr){
        if(inputstr!=null && inputstr!=''){
            //fetch the acccount  records name ends  with inputstr
            //'%kumar'
            inputstr='%'+inputstr; 
            system.debug(inputstr);  //%kumar
            List<Account> acclist=[select id,name from account where name like :inputstr];
            if(!acclist.isempty()){
                system.debug(acclist);
            }
        }
        
    }
    
    //wap to get contacts which are associated with banking industry accounts 
    public static void getcontactsbyindustry(String indname){
        if(indname!=null && indname!=''){
            Map<id,Account> accountmap=new Map<id,account>(
                [select id,name,industry from account where industry=:indname]);
            system.debug(accountmap);
            
            //map.keyset()
            if(!accountmap.keyset().isempty()){
                List<Contact> conlist= [select id,lastname,email,accountId from contact where accountid IN : accountmap.keyset()];
                
                if(!conlist.isempty()){
                    system.debug(conlist);
                    for(contact con:conlist){
                        system.debug('contact name::'+con.LastName+'  '+'contact email::'+con.Email);                    
                    }
                }       
                
            }
        }
    }
    
    
    //wap to candidate records specified locaiton
    public static void getcandidatebylocation(string candidatelocation){
        if(candidatelocation!=null && candidatelocation!=''){
            
            String candidatequery='SELECT ID,lastname__c,phone__c,email__c from candidate__c ';
            candidatequery+='where Location__c=:candidatelocation';
            
            system.debug(candidatequery);
            
            List<Candidate__c> candidatelist=Database.query(candidatequery);
            system.debug('candidatelist size:::'+candidatelist.size());
            if(!candidatelist.isempty()){
                system.debug(candidatelist);
                for(Candidate__c can:candidatelist){
                    system.debug('candidate name::'+can.lastname__C+'   '+'candidate phone::'+can.phone__c);
                    system.debug('candidate email::'+can.email__C);
                    system.debug('================================================================================');
                }}
        }
    }
    
    
    //wap to get lead records base on input value
    // if i supply normal string get the lead record based on lastname match
    // if i supply emailid get the lead based on eamil match 
    public static void getleadrecords(STring inputstring){
        if(inputstring!=null && inputstring!=''){
            String leadquery='select id,lastname,email,phone from lead where ';
            if(pattern.matches('[a-zA-Z0-9+_-]+@[a-zA-Z]+.[a-zA-Z]{2,4}',inputstring)){
                //1. if input string is lastname
                leadquery+='email=:inputstring';
                
            }else{
                leadquery+='lastname=:inputstring';
            }
            system.debug(leadquery);
            
            list<Lead> leadlist=database.query(leadquery);
            
            if(!leadlist.isempty()){
                system.debug(leadlist);
                for(lead l:leadlist){
                    system.debug('lead name::'+l.lastname+'   '+'lead phone::'+l.phone);
                }
            }
        }
    }
    
    
    //wap to get the total noof records in account object
    public static void getaccountreccount(){
        Integer reccount=[select count() from account];
        system.debug('total account records::'+reccount);
        
        
        //dynamic query 
        string accquery='select count() from Account';
        Integer count=Database.countquery(accquery);
        system.debug('dynamic count::'+count);
    }
    
    
    //wap to get the list of all industries and no.of accounts associatedwith each industry
    //
    public static void getaccountindustrywithcount(){
        
        AggregateResult[] results=[select industry, count(id) recordscount from account group by industry];
        
        for(AggregateResult result:results){
            system.debug('Industry NAme:'+result.get('industry')+'--Count::'+result.get('recordscount'));
        }
        
    }
    
    
    //wap to display the industry names, no.of records each industry which are hving minimum 2 records inside the group
    //
    public static void getaccountindustrywithcount1(){
        AggregateResult[] results=[select industry, count(id) recordscount 
                                   from account 
                                   group by industry 
                                   having count(id)>2
                                  ];
        
        for(AggregateResult result:results){
            system.debug('Industry NAme:'+result.get('industry')+'--Count::'+result.get('recordscount'));
        }
    }
    
    //wap to get all the duplicate account records based on the account name 
    //
    public static void getduplicateaccount(){
        Aggregateresult[] results=[select name , count(id) recordscount from account
                                   group by name
                                   having count(id)>1];
        system.debug('duplicate count size...'+results.size());
        for(Aggregateresult result:results){
            system.debug('account name:::'+result.get('name')+'----count::'+result.get('recordscount'));
        }
    }
    
    //wap to get account records based on specified name and fetch all the associated contacts, oppor, cases 
    public static void getparentandchildrecords(string accountname){
        if(accountname!=null && accountname!=''){
            List<Account>  accountlist=  [select id, name,phone,
                                          (select id,lastname from contacts),
                                          (select id,name,amount from opportunities),
                                          (select id,casenumber from cases)
                                          from account 
                                          where name=:accountname];
            if(!accountlist.isempty()){
                for(Account acc : accountlist){
                    system.debug('---------------------Account------------------------------');
                    system.debug(acc);
                    system.debug('=======================contacts============================');
                    //get related contacts
                    for(contact con:acc.contacts){
                        system.debug(con);
                    }
                    system.debug('====================opps==============================');
                    for(Opportunity opp:acc.opportunities){
                        system.debug(opp);  //opp.name
                    }
                    system.debug('====================cases=============================='); 
                    for(case cs:acc.cases){
                        system.debug(cs);
                    }                   
                }
            }
        }
    }
    
    
    //wap case record and associated contact details and releated account and owner detials 
    //along with owners profile infomration
    
    public static void getcaseandrelatedparentdetails(string csnumber){
        if(csnumber!=null && csnumber!=''){
            List<Case> caselist=[select id,casenumber,subject,priority,status,
                                 Contact.lastname,contact.email,
                                 contact.Account.name,contact.Account.industry,
                                 contact.Account.Owner.Email,
                                 contact.Account.owner.profile.name
                                from case 
                                where casenumber=:csnumber];
            system.debug(caselist);
            if(!caselist.isempty()){
                for(case cs:caselist){
                    system.debug(cs);
                    system.debug(cs.contact.email);
                    system.debug(cs.contact.account.name);
                    system.debug(cs.contact.account.owner.email);
                    system.debug(cs.contact.account.owner.profile.name);
                    //cs.casenumsber,cs.contact.lastname,cs.contact.account.name,
                }
            }
        }
    }
    
    
    //wap tog et hiring manager and associated position records 
    //
    public static  void gethmgrwithpositions(){
        List<hiringmanager__C> hmgrlist=[Select id,name__c,phone__c,
                                         (select id,name__c,location__C from positions__r)
                                        from hiringmanager__C];
        system.debug(hmgrlist);
        
        for(hiringmanager__C hmgr:hmgrlist){
            system.debug(hmgr);
            system.debug(hmgr.positions__r.size());
            for(position__C ps:hmgr.positions__r){
                system.debug(ps);
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}