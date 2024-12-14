public class positionHelper {
    
    
    public void createposition(Id hmgrrecordid){
        
        Position__c psobj=new Position__c();
        psobj.Name__c='salesforce tester';
        psobj.phone__c='4564646';
        psobj.Location__c='hyd';
        psobj.Skillset__c='salesforce,apex';
        psobj.Position_Status__c='new';
        psobj.PositionDescription__c='requied 5+ years exp in sales and service cloud with lwc,integeraiton and apex';
        psobj.Open_Date__c=system.today();
        psobj.MilestoneDate__c=system.today()+30;
        psobj.Maxpay__c=64646464;
        psobj.Minpay__c=131313;
        psobj.Noofpositions__c=30;
        psobj.hiringmanger__c=hmgrrecordid; 
        if(psobj!=null){
            insert psobj;
            if(psobj.id!=null){
                system.debug(psobj);
            }
        }
    }

}