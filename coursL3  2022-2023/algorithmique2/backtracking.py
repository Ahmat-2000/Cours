import random


class Clause:
    def __init__(self):
        pass

    def ajouter_litteral(self,lit,neg=False):
        # la méthode ajouter litteral doit ajouter le littéral lit
        # sous forme négative si neg est à True
        pass

    def evaluer(self,valeurs):
        # evaluer prend en paramêtre un dictionnaire de valeurs et
        # doit renvoyer True si la clause est vraie avec ces valeurs,
        # False si elle ne l'est pas et None s'il manque des valeurs 
        # pour pouvoir évaluer la clause.
        pass

    def litteraux(self):
        # cette méthode doit renvoyer une liste ou un itérateur sur
        # les littéraux contenus dans la clause : si un littéral x, un
        # littéral ¬x et un littéral y sont dans la clause, x et y devront 
        # être énumérés, mais une seule fois chacun.
        pass

    def __str__(self):
        # cette méthode doit renvoyer la clause sous une forme lisible par
        # un être humain
        pass

    def est_tautologie(self):
        # Question Bonus
        pass

class Formule:
    def __init__(self):
        pass

    def ajouter_clause(self,clause):
        pass

    def litteraux(self):
        # cette méthode doit renvoyer une liste ou un itérateur sur
        # les littéraux contenus dans la formule.
        pass

    def evaluer(self,valeurs):
        # evaluer prend en paramêtre un dictionnaire de valeurs et
        # doit renvoyer True si la clause est vraie avec ces valeurs
        # False si ce n'est pas possible et None si avec les valeurs
        # fournies on ne peut pas encore décider.
        pass

    def __str__(self):
        # cette méthode doit renvoyer la formule sous une forme lisible par
        # un être humain
        pass

    def satisfiable(self):
        # à l'aide de backtracking, cette méthode doit renvoyer false si la
        # formule n'est pas satisfiable et un dictionnaire associant littéraux
        # et valeur rendant la formule vraie sinon.
        pass

    @staticmethod
    def random(nb_vars,nb_clauses,clause_maxsize,seed=None):
        # Une méthode statique pour générer des formules aléatoires, la seed vous permettra 
        # de tester avec quelques exemples bien choisis
        if seed is not None:
            random.seed(seed)
        f = Formule()
        for i in range(nb_clauses):
            k = random.randint(1,clause_maxsize)
            c = Clause()
            for j in range(k):
                c.ajouter_litteral("x"+str(random.randint(0,nb_vars)),bool(random.getrandbits(1)))
            f.ajouter_clause(c)
        return f

    def simplifier(self):
        # Question Bonus
        pass


if __name__=="__main__":
    f = Formule.random(10,10,3)
    print(f)
    print(f.satisfiable())
    
