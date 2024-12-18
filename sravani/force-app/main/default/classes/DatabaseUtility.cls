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
}