/*******************************
* Fichier arbre_binaire.c
*******************************/
#include"arbre_binaire.h"
#include<stdio.h>
#include<stdlib.h>


arbre_binaire_t creer_arbre(char val){
  arbre_binaire_t a = malloc(sizeof(struct arbre_binaire_s));
  a->valeur = val;
  a->gauche = NULL;
  a->droit = NULL;
  return a;
}

arbre_binaire_t inserer_racine(char val, arbre_binaire_t  gauche, arbre_binaire_t droit){
  arbre_binaire_t a = creer_arbre(val);
  a->gauche = gauche;
  a->droit = droit;
  return a;
}

int present(arbre_binaire_t a, char val){
  if(a == NULL)
    return 0;
  if(a->valeur == val)
    return 1;
  return present(a->gauche, val) || present(a->droit, val);
}

arbre_binaire_t inserer_feuille(arbre_binaire_t a, char val, int cote){
  if(a == NULL)
    return creer_arbre(val);
  if( cote == GAUCHE )
    a->gauche = creer_arbre(val);
  else
    a->droit = creer_arbre(val);
  return a;
}


int taille(arbre_binaire_t a){
  if(a == NULL)
    return 0;
  return 1 + taille(a->gauche) + taille(a->droit);
}

void detruire_arbre(arbre_binaire_t a){
  if(a != NULL){
    detruire_arbre(a->gauche);
    detruire_arbre(a->droit);
    free(a);
  }
}

expression creer_feuille(char minuscule){
  return creer_arbre(minuscule);
}

expression inserer_operation(char op, expression gauche, expression droit){
  return inserer_racine(op, gauche, droit);
}

int est_operation(char val){
  return val == '+' || val == '*';
}

int taille_expression(expression a){
  if(est_operation(a->valeur))
    return 1 + taille_expression(a->gauche) + taille_expression(a->droit);
  return 1;
}
