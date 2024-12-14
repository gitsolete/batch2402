public class mathoperations {
    
    public integer a=5,b=5,c=0;
    
    
    //addition
    public void  addition(){
        c=a+b;
        system.debug('sum result::'+c);
    }
    //sub
    public void substraction(integer x, integer y){
        c=x-y;
        system.debug('substraction ::'+c);
        //system.debug('substarcation::'+(x-y));
        clear();
    }
    //divi
    //multiplication
    public integer mult(){
        return a*b;
    }
    
    private void clear(){
        a=b=c=0;
    }

}



/*
 * mathoperations mobj=new mathoperations();
system.debug('a value::'+mobj.a);
system.debug('b value::'+mobj.b);
system.debug('c value::'+mobj.c);

integer i;
mobj.addition();

integer h=9,j=6;
mobj.substraction(h,j);

integer mulres=mobj.mult();
system.debug('mul result::'+mulres);





*/