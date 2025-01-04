public with sharing class MessagingUtility {
    public MessagingUtility() {

    }

    public static void sendbatchemail(AsyncApexjob jobdetails,string jobname){

        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();

        String[] toaddrss=new String[]{jobdetails.createdby.email};
        email.setToAddresses(toaddrss);

        String emailsubject='Batch job '+jobname+' is over' + jobdetails.status;
        email.setSubject(emailsubject);

        string htmlbody='Dear customer,<br/>'+
        'The batch job name::'+jobname+'<br/>'+
        'Batch job status:'+jobdetails.status +'<br/>'+
        'Batch job total items:'+jobdetails.TotalJobItems+'<br/>'+
        'Batch job items processed:'+jobdetails.JobItemsProcessed+'<br/>'+
        'Batch job errors: '+jobdetails.NumberOfErrors+'<br/>'+
        'Batch start time:'+jobdetails.createddate+'<br/>'+
        'Batch end time:'+jobdetails.CompletedDate+'<br/>'+
        '</b>Thanks<br/> Sales Team';
        email.setHtmlBody(htmlbody);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});

    }

    public static void sendtotalrevenueemail(AsyncApexjob jobdetails,string jobname,Decimal totalrevenue){
        Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();

        String[] toaddrss=new String[]{jobdetails.createdby.email};
        email.setToAddresses(toaddrss);

        String emailsubject='Batch job '+jobname+' is over' + jobdetails.status;
        email.setSubject(emailsubject);

        string htmlbody='Dear customer,<br/>'+
        'The batch job name::'+jobname+'<br/>'+
        'Total reveneue::'+totalrevenue+'<br/><br/>'+
        'Batch job status:'+jobdetails.status +'<br/>'+
        'Batch job total items:'+jobdetails.TotalJobItems+'<br/>'+
        'Batch job items processed:'+jobdetails.JobItemsProcessed+'<br/>'+
        'Batch job errors: '+jobdetails.NumberOfErrors+'<br/>'+
        'Batch start time:'+jobdetails.createddate+'<br/>'+
        'Batch end time:'+jobdetails.CompletedDate+'<br/>'+

        '</b>Thanks<br/> Sales Team';
        email.setHtmlBody(htmlbody);

        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{email});

    }
}