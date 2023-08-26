public class Automate1 {
    
    public Automate1() {}
    /** État interne de l'automate */
    protected int etat;
    /** Positionne l'automate dans son état initial */
    protected void etatInitial() { etat = 0; }
    /** L'état courant est-il acceptant ? */
    protected boolean etatCourantEstAcceptant() { return etat == 2; }

    /** Étant donné un caractère déclencher la transition */
    protected void etatSuivant(int c) {
        switch (etat) {
        case 0: 
            if (c == 'a') 
                etat = 1;
            else 
                etat = 3;
            break;
        case 1:
            if (c == 'b') 
                etat = 2;
            else
                etat = 3;
            break;
        case 2:
            etat = 3;
            break;
        }
    }
  
    /** Le mot est-il reconnu par l'automate ? */
    public boolean reconnait(String mot) {
        etatInitial();
        for (int i = 0; i < mot.length(); i++) {
            char c = mot.charAt(i);
            System.err.println("État : "+ etat + " entrée " + c);
            etatSuivant(c);
        }
        System.err.println(" -> état : "+ etat);
        return  etatCourantEstAcceptant();
    } 

    /** Main : les mots en arguments sont-ils reconnus ? */
    public static void main(String args[]) {
        Automate1 automate = new Automate1();
        for (String arg : args) {
            boolean r = automate.reconnait(arg);
            System.out.println("\n\"" + arg + "\"" + (r ? " est" : " n'est pas") + " reconnu "); 
        }
    }
}