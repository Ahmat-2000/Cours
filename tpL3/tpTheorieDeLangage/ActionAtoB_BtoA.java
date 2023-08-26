public class ActionAtoB_BtoA implements Action{
    private int codePoint;
    private char courant ;
    public ActionAtoB_BtoA(int codePoint)
    {
        this.codePoint = codePoint;
    }
    public void setCodePoint(int c)
    {
        codePoint = c;
    }
    @Override
    public void run() {
       if(String.format("%c", codePoint).equals("a"))
       {
            courant = 'b';
       }
       else
       {
            courant = 'a';
       }
    }
    
}
