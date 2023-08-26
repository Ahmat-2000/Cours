public class AutomateABtableDeTransition extends Automate
{
    /* pour ab
    protected int _tableTransitions[][] = { {1,3},{3,2},{3,3},{3,3} };
    // pour ab*
    protected int _tableTransitions[][] = {{1,3},{3,2},{1,3},{3,3}};
    // pour a*b*
    protected int _tableTransitions[][] = {{0,1},{2,1},{2,2}};
    // pour (ab)*b*
    */
    protected int _tableTransitions[][] = {{1,3},{4,2},{1,3},{4,3},{4,4}};
    public AutomateABtableDeTransition()
    {
        super();
    }

    /** Positionne l'automate dans son état initial */
    @Override
    protected void etatInitial()
    {
        etat = 0;
    }
    /** L'état courant est-il acceptant ? */
    @Override
    protected boolean etatCourantEstAcceptant()
    {
        /*
        //pour ab 
        return etat == 2;
        // pour ab* 
        return etat == 2;
        // pour a*b*
        return etat == 1 || etat == 0;
        // pour (ab)*b*
        */
        return etat == 3 || etat == 2 || etat == 0;
    }
    /** Étant donné un caractère (donné par son code unicode), déclencher la transition */
    @Override
    protected void etatSuivant(int c)
    {
        etat = _tableTransitions[etat][c-'a'];
    }
}