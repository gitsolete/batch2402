@isTest
public class LeadTriggerTest {
    
    static testmethod void leadtest(){
        
        //insert 
        //create lead 
        List<Lead> leadlist=new list<Lead>();
        
        for(integer i=0;i<=10;i++){
            Lead ld=new Lead();
            ld.FirstName='test';
            ld.LastName='triggerlead'+i;
            ld.Company='testtrigger'+i;
            ld.Email='testtriggerlead'+i+'@gmail.com';
            ld.Title='Manager';
            ld.Industry='Banking';
            ld.Phone='1234567891';
            ld.Fax='9874563210';
            ld.Status='Open - Not contacted';
            leadlist.add(ld);
        }
        insert leadlist;
        
        //update
        for(lead l:leadlist){
            l.status='Closed - converted';
        }
        update leadlist;
        
    }

}