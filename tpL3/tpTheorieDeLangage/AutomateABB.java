public class AutomateABB extends Automate
{
    public AutomateABB()
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
        return etat == 3;
    }
    /** Étant donné un caractère (donné par son code unicode), déclencher la transition */
    @Override
    protected void etatSuivant(int c)
    {
        switch (etat) {
        case 0: 
            if (c == 'a') 
                etat = 1;
            else 
                etat = 4;
            break;
        case 1:
            if (c == 'b') 
                etat = 2;
            else
                etat = 4;
            break;
        case 2:
            if (c == 'b') 
                etat = 3;
            else
                etat = 4;
            break;
        case 3:
            etat = 4;
            break;
        }
    }
}