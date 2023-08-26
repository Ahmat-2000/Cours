public class Main 
{
    public static void main(String[] args) {
        Panel p1 = new Panel("panneau 1");
        p1.ajoutComposant(new Bouton("b1"));
        Panel p2 = new Panel("panneau 2");
        p2.ajoutComposant(new Bouton("b2"));
        p2.ajoutComposant(new Label("l1"));
        p1.ajoutComposant(p2);
        Panel p3 = new Panel("panneau 3");
        p3.ajoutComposant(new Label("l2"));
        p3.ajoutComposant(new Label("l3"));
        p3.ajoutComposant(new Panel("panneau 4"));
        p2.ajoutComposant(p3);
        p1.display(0);
        System.out.println();
        new Bouton("bouton seul").display(0);
    }
}