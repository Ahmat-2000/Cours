class Noeud: 
    def __init__(self, v, g = None, d = None): 
        self.g = g # type Noeud 
        self.d = d # type Noeud 
        self.v = v

class ArbreBinaire :
    def __init__(self,v,g,d):
        self.valeur = v
        self.gauche = g
        self.droit = d
        
    def estVide(self):
        if self == None:
            return True
        else:
            return False

    def ajouter(self,v):
        if self.valeur < v :
            if self.droit == None:
                self.droit = ArbreBinaire(v,None,None)
            else:
                self.droit.ajouter(v)
        if self.valeur >= v :
            if self.gauche == None:
                self.gauche = ArbreBinaire(v,None,None)
            else:
                self.gauche.ajouter(v)
    
    def hauter(self):
        if self.estVide():
            return 0
        return 1 + self.hauter(self.droit) + self.hauter(self.gauche)

    def ajouterList(self,l):
        for i in l:
            self.ajouter(i)
def affiche(a):
        if a == None:
            return None
        return (a.valeur,affiche(a.droit),affiche(a.gauche))

def recherche(a,x):
    i = 0
    tmp = a
    while tmp != None:
        if tmp.valeur == x :
            i =i+1
        if tmp.valeur >= x :
            tmp = tmp.gauche
        elif tmp.valeur < x:
            tmp = tmp.droit
    return i

if __name__ == "__main__":
    l = [1,2,3,4,5,6,12,7,8,9,10,11,2]
    abr = ArbreBinaire(7,None,None)
    abr.ajouterList(l)
    print(affiche(abr))
    print()
    print(recherche(abr, 2))
