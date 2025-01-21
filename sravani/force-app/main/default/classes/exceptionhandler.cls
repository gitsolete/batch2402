public class exceptionhandler {
    
    public static void insertaccount(){
        
        Account acc;
        
        try{
            acc=new account();
            insert acc;
        }
        catch(DMLexception ex){
            throw new AccountException('exception occured upon inserting account record');
        }
        finally{
            acc=null;
        }
    }

}