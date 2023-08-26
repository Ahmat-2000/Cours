public abstract class Automate {
    
    public Automate() {}
    /** État interne de l'automate */
    protected int etat;
    /** Positionne l'automate dans son état initial */
    abstract protected void etatInitial();
    /** L'état courant est-il acceptant ? */
    abstract protected boolean etatCourantEstAcceptant();
    /** Étant donné un caractère (donné par son code unicode), déclencher la transition */
    abstract protected void etatSuivant(int charCode);

    /** Méthode générale : le mot est-il reconnu par l'automate ? */
    public boolean reconnait(String mot) {
        etatInitial();
        CodePointIterator it = new CodePointIterator(mot);
        while (it.hasNext()) {
            int c = it.next();
            System.out.println("État : "+ etat + " entrée " + String.format("%c", c));
            etatSuivant(c);
        }
        System.out.println("État : "+ etat); 
        return  etatCourantEstAcceptant();
    } 
}

/** 
 * Pour itérer sur les codePoint Unicode d'une chaîne.
 * Si le codePoint correspond à 2 char, il faut avancer l'index 2 fois.
 */
final class CodePointIterator {
  private final String sequence;
  private int index = 0;

  public CodePointIterator(String sequence) {
    this.sequence = sequence;
  }

  public boolean hasNext() {
    return index < sequence.length();
  }

  public int next() {
    int codePoint = sequence.codePointAt(index++);
    if (Character.charCount(codePoint) == 2) {
      index++;
    }
    return codePoint;
  }
}