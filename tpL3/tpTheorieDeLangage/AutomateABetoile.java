public class AutomateABetoile extends Automate
{
    public AutomateABetoile()
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
        return etat == 1;
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
                etat = 2;
            break;
        case 1:
            if (c == 'b') 
                etat = 1;
            else
                etat = 2;
            break;
        case 2:
            etat = 2;
            break;
        }
    }
}