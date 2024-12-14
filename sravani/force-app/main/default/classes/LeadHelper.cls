public with sharing class LeadHelper {
    public LeadHelper() {

    }

    public void createleads(){

        for(integer i=1;i<=10;i++){
            Lead led=new Lead();
            led.FirstName='Lead'+i;
            led.LastName='mishra'+i;
            led.Company='TCS';
            led.phone='123456'+i;
            led.email=led.LastName+'@gmail.com'; //mishra1@gmail.com
            insert led;
        }
    }
}

