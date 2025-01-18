public class LeadHandler {
    
    public static void setleadstatus(list<Lead> leadlist){
        
        //list<Lead> leadstoupdate=new list<Lead>();
        for(Lead ld:Leadlist){
            if(ld.Rating=='Hot'){
                ld.status='Closed - Converted';
               // leadstoupdate.add(ld);
            }
        }
        
        //update leadstoupdate;
    }

}