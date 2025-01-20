public class hiringmangerHelper {
    
    public static boolean flag=true;
    
    public void createhiringmanger(){
        hiringmanager__c hmgrobj=new hiringmanager__c();
        hmgrobj.name__c='toyotamgr';
        hmgrobj.email__c='toyotamgr@toyota.com';
        hmgrobj.Location__c='hyd';
        hmgrobj.Phone__c='234234';
        if(hmgrobj!=null){
            insert hmgrobj;
            if(hmgrobj.Id!=null){                
                system.debug('hiringmanger record craeted::'+hmgrobj);
                positionHelper psobj=new positionHelper();
                psobj.createposition(hmgrobj.Id);
            }
        }
    }
    
    public void createhmgrtask(){
        
        hiringmanager__c hmgrobj=new hiringmanager__c();
        hmgrobj.name__c='awcomgr';
        hmgrobj.email__c='awcomgr@toyota.com';
        hmgrobj.Location__c='hyd';
        hmgrobj.Phone__c='234234';
        insert hmgrobj;
        Task t=new Task();
        t.Subject='please call account and discuss about the products';
        t.Status='New';
        t.Priority='High';
        t.ActivityDate=system.today();
        t.WhatId=hmgrobj.id;        
        insert t;               
    }
    
    
    public void createhmgrbynumber(Integer noofrecords){
        if(noofrecords>0){
            for(integer i=1;i<=noofrecords;i++){
                hiringmanager__c hmgrobj=new hiringmanager__c();
                hmgrobj.name__c='hmgrbulk'+i;
                hmgrobj.email__c=hmgrobj.name__c+'@toyota.com';
                hmgrobj.Location__c='hyd';
                hmgrobj.Phone__c='234234';
                insert hmgrobj;
            }
        }
    }
    
    public static void afterinsert(){
       
            hiringmanager__c hmgrobj=new hiringmanager__c();
            hmgrobj.name__c='recursivetriggerexmple';
            hmgrobj.email__c='recursivetriggerexmple@toyota.com';
            hmgrobj.Location__c='hyd';
            hmgrobj.Phone__c='234234';
            insert hmgrobj;
           
       
        
    }
    
}