public with sharing class CandidateHandler {
    public CandidateHandler() {

    }

    public static void sendemailtocandidates(List<Candidate__c> canlist){
        List<Messaging.SingleEmailMessage> lstemail = new List<Messaging.SingleEmailMessage>();
        if(!canlist.isempty()){
            List<Messaging.SingleEmailMessage> lstemailsend = new List<Messaging.SingleEmailMessage>();
            for(Candidate__c can:canlist){
                if(can.Email__c!=null){
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    //email.setToAddresses(can.email__C);
                    String[] toemailids=new string[]{can.email__c,'sfdcshares@gmail.com'};
                    email.setToAddresses(toemailids);

                    STring[] ccemailids=new string[]{can.email__c,'sfdcshares@gmail.com'};
                    email.setccAddresses(ccemailids);

                    string[] bccemailids=new string[]{can.email__c,'sfdcshares@gmail.com'};
                    email.setBccAddresses(bccemailids);

                    email.setSenderDisplayName('Candidate record creation notificaiton');

                    email.setreplyto('sfdcshares@gmail.com');

                    String emailsubject='Congratulations '+can.Lastname__c+'!!! Your Candidate Record has been created';
                    email.setsubject(emailsubject);

                    String emailhtmlbody='Dear '+can.lastname__c+'<br/>';
                    emailhtmlbody+='<b>Your Record Creation is successfull</b><br/>';
                    emailhtmlbody+='Your lastname: '+can.lastname__c+'<br/>';
                    emailhtmlbody+='Your firstname: '+can.Name+'<br/>';
                    emailhtmlbody+='Your phone: '+can.phone__c+'<br/>';
                    emailhtmlbody+='Your email: '+can.email__c+'<br/>';
                    emailhtmlbody+='Your Location: '+can.location__c+'<br/>';
                    emailhtmlbody+='<p>Thank you!</p><br/>';
                    emailhtmlbody+='Resource management will approach';
                    email.setHtmlBody(emailhtmlbody);

                    lstemailsend.add(email);                   

                }
            }
            if(!lstemailsend.isempty()){
                Messaging.sendEmail(lstemailsend);
            }
        }
    }

    
}

/*List<Candidate__c> canlist=[select id,email__c,lastname__c,name,phone__c,location__c from Candidate__c where email__c in ('sfdcshares@gmail.com','venkata.of@gmail.com')];
CandidateHandler.sendemailtocandidates(canlist);
*/