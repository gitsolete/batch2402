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
}