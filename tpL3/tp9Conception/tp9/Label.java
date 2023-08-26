class Label implements Composant
{
    public String nom;
    public Label(String nom)
    {
        this.nom = nom;
    }
    @Override
    public void display(int offset)
    {
        String a = "["+this.getClass().getName()+"] "+this.nom;
        System.out.println(Panel.inden(a,offset));
    }
}