global with sharing class totalannualrevschedulejob implements system.schedulable{
    public totalannualrevschedulejob() {

    }

    global void execute(System.schedulablecontext sc){
            system.debug('this is schedule job');

            calculateTotalRevenueBatch obj=new calculateTotalRevenueBatch();
            Database.executeBatch(obj,10);
    }

}