public class AutomateTransducteur extends Automate implements Action {
    private Action[][] _tableActions;
    public AutomateTransducteur()
    {
        super();
    }
    @Override
    public void run()
    {

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
        return etat == 3 || etat == 2 || etat == 0;
    }
    /** Étant donné un caractère (donné par son code unicode), déclencher la transition */
    @Override
    protected void etatSuivant(int c)
    {
      //  etat = _tableTransitions[etat][c-'a'];
    }
}
