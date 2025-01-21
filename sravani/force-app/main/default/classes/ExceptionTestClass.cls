public class ExceptionTestClass {
    
    public static void handleexception(){
        
        Account acc;
        try{
            acc=new Account();
            acc.Name='exceptionexample';
            insert acc;
            
            acc=[select id,name from account];
            system.debug('divison result::::'+(12/0));
        }
        Catch(DMLException de){
            system.debug('dml expetion occured');
        }
        catch(QueryException qe){
            system.debug('query error occrured');
            system.debug('Exception type....'+qe.gettypename());
            system.debug('exception message....'+qe.getmessage());
            system.debug('error line number.....'+qe.getlinenumber());
            system.debug('complete flow of exception....'+qe.getstacktracestring());
            system.debug('error reason......'+qe.getcause());
                         
        }
        catch(Nullpointerexception ex){
            system.debug('null ppitr occured');
        }
        catch(mathexception me){
            system.debug('zero divident error');
        }
        finally{
            acc=null;
        }
    }

}