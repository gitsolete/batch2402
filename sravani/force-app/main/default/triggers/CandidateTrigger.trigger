trigger CandidateTrigger on Candidate__c (before insert,before update) {

    if(Trigger.isbefore){
        if(Trigger.isinsert || Trigger.isupdate){
            for(Candidate__c c:Trigger.new){
                //fetch the candidate record with eamil 
                integer reccount=[Select count() from Candidate__c where email__C=:c.email__c];
                if(reccount>0){
                    c.adderror('this email already in use');
                }
            }
        }
    }
}