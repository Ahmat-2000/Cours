/*******************************
* Fichier arbre_binaire.h
******************************/
#ifndef __ARBRE_BINAIRE_H__
#define __ARBRE_BINAIRE_H__

struct arbre_binaire_s{
  char valeur;
  struct arbre_binaire_s * gauche;
  struct arbre_binaire_s * droit;
};


typedef struct arbre_binaire_s * arbre_binaire_t;
typedef struct arbre_binaire_s * expression; 

#define GAUCHE 0
#define DROITE 1

/**
   Cette fonction renvoie un arbre binaire initialisé à la valeur val.
   @param val est la valeur que l'on souhaite donner au nouveau noeud.
   @ensures resultat->valeur == val
   @ensures resultat->gauche==NULL && resultat->droit==NULL
   @return un arbre binaire initialisé à la valeur val.
*/
arbre_binaire_t creer_arbre(char val);

/**
   Crée un arbre binaire dont la racine est étiquetée par 'val'
   et dont les sous arbres sont 'gauche' et 'droit'.
   @param val est la valeur à insérer dans l'arbre.
   @param gauche est le sous-arbre gauche
   @param droit est le sous-arbre droit
   @ensures resultat->valeur == val
   @ensures resultat->gauche == gauche
   @ensures resultat->droit == droit
   @return un arbre binaire result=(val, gauche, droit)
*/
arbre_binaire_t inserer_racine(char val, arbre_binaire_t  gauche, arbre_binaire_t  droit);


/**
   Cette fonction renvoie 1 si la valeur 'val' est stockée dans l'arbre et 0 sinon.
   @param a est un arbre binaire
   @param val est une valeur à rechercher
   @ensures si a==NULL, resultat == 0
   @ensures si a->valeur == val, resultat == 1
   @ensures si a->valeur!= NULL, resultat == (present(a->gauche) || present(a->droit)), 
   @return 1 si val apparaît dans a, 0 sinon 
*/
int present(arbre_binaire_t a, char val);

  
/**
   Cette fonction renvoie le nombre de noeud de l'arbre.
   @param a est un arbre binaire
   @ensures a == NULL => resultat == 0
   @ensures a != NULL => resultat == 1 + taille(a->gauche) + taille(a->droit)
   @return le nombre de noeud de l'arbre.
*/
int taille(arbre_binaire_t a);

/**
   Cette fonction prend en entrée un arbre et libère l'espace mémoire de tous les noeuds 
   qu'il contient.
   @param a est un arbre binaire
   @requires 'a' a été initialisé avec creer_arbre ou inserer_racine
   @ensures le nombre d'appel à free est égal à taille(a)   
*/  
void detruire_arbre(arbre_binaire_t a);

/**
   Crée un arbre localement complet dont la racine est étiquetée par 'miniuscule',
   un caractère écrit en minuscule.
   @param miniscule est un caractère
   @requires minuscule>='a' && minuscule <='z'
   @ensures resultat->valeur == minuscule
   @ensures resultat->gauche == NULL && resultat->droit == NULL
   @return un arbre localement complet étiqueté par le caractère 'minuscule'
*/
expression creer_feuille(char minuscule);

/**
   Crée un arbre localement complet dont la racine est étiquetée par 'op'
   et dont les sous arbres sont 'gauche' et 'droit'.
   @param op est l'opération que l'on souhaite insérer
   @param gauche est le sous arbre gauche
   @param droit est le sous arbre droit
   @requires op=='+' || op=='*' 
   @ensures resultat->valeur == op && valeur->gauche == gauche && valeur->droit == droit
   @return une expression result=(op, gauche, droit)
*/
expression inserer_operation(char op, expression gauche, expression droit);

/**
   Crée un arbre localement complet dont la racine est étiquetée par 'op'
   et dont les sous arbres sont 'gauche' et 'droit'.
   @param op est l'opération que l'on souhaite insérer
   @param gauche est le sous arbre gauche
   @param droit est le sous arbre droit
   @ensures op=='+' ou op=='*' => resultat->valeur == op et 
                                  resultat->gauche == gauche et resultat->droit == droit
   @ensures op!='+' et op!='*' => resultat == NULL
   @return une expression result=(op, gauche, droit)
*/
expression inserer_operation_autre(char op, expression gauche, expression droit);

/**
   Cette fonction renvoie le nombre de noeud de l'expression
   @param a est un arbre binaire localement complet
   @requires a != NULL 
   @requires 'a' a été initialisé avec creer_feuille ou inserer_operation
   @ensures a -> valeur est un caractère => resultat == 1
   @ensures a == '+' ou a == '*' => result = 1+taille_expression(a->gauche) + taille_expression(a->droit)
   @return le nombre de noeud de l'expression
*/
int taille_expression(expression a);



/**
   Cette fonction insère un noeud de valeur 'val' dans l'arbre binaire a.
   On suppose que l'arbre est soit vide, soit une feuille.
   Si l'arbre est vide, on renvoie une nouvelle racine
   Si l'arbre est une feuille on ajoute une nouvelle feuille du cote 'cote'.
   @param a est l'arbre dans lequel on ajoute la feuille
   @param val est la valeur que le nouveau noeud va prendre
   @param côté indique si l'on insère à gauche ou à droite.
   @requires a == NULL ou (cote == GAUCHE ou cote == DROIT)
   @requires a == NULL ou (cote == GAUCHE et a->gauche == NULL) ou (cote == DROIT et a->droit == NULL)
   @ensures a == NULL => result->valeur == val et result->gauche == NULL et result->droit == NULL
   @ensures a != NULL et cote == GAUCHE => resultat->gauche->valeur == val 
   @ensures a != NULL et cote == DROIT => resultat->droit->valeur == val
   @ensures taille(result) == taille (a) + 1
   @return un arbre dans lequel un noeud d'étiquette val est inséré du côté 'cote'.
*/
arbre_binaire_t inserer_feuille(arbre_binaire_t a, char val, int cote);



#endif
