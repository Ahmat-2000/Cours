import java.util.ArrayList;
class Panel implements Composant
{
    public String nom;
    public ArrayList<Composant> components;
    public Panel(String nom)
    {
        this.nom = nom;
        this.components = new ArrayList<Composant>();
    }
    public void ajoutComposant(Composant c){
        this.components.add(c);
    }
    public static String inden(String a,int b)
    {
        if(b<=0)
        {
           return a;
        }
        String c ="";
        for(int i=0;i<b;i++)
        {
            c +=" ";
        }
        return c+a;
    }
    @Override
    public void display(int offset)
    {
        if(this.components.isEmpty())
        {
            String a = "["+this.getClass().getName()+"] "+this.nom+" est vide ";
            System.out.println(inden(a,offset));
        }
        else
        {
            String a = "["+this.getClass().getName()+"] "+this.nom+" contenant : ";
            System.out.println(inden(a,offset));
            for(Composant c : this.components)
            {
                c.display(offset+4);
            }
        }
    }
}