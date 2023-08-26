#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include"arbre_binaire.h"

void test_creer_arbre_simple(){
  printf("Test fonction creer_arbre\n");
  arbre_binaire_t a = creer_arbre('a');
  assert(a->valeur == 'a');
  assert(a->gauche == NULL && a->droit == NULL);
  arbre_binaire_t b = creer_arbre('4');
  assert(b->valeur == '4');
  assert(b->gauche == NULL && b->droit == NULL);
  printf(" ok\n");
}

void test_inserer_racine(){
  printf("Test fonction inserer_racine\n");
  arbre_binaire_t gauche = creer_arbre('3');
  arbre_binaire_t droit = creer_arbre('5');
  arbre_binaire_t a = inserer_racine('1', gauche, droit);
  assert(a->valeur == '1');
  assert(a->gauche == gauche);
  assert(a->droit == droit);
  printf(" ok\n");
}

arbre_binaire_t mon_gros_arbre(){
  arbre_binaire_t a = inserer_racine('1', inserer_racine('2', creer_arbre('3'), creer_arbre('4')),
				     inserer_racine('5', creer_arbre('6'), creer_arbre('7')));
  arbre_binaire_t b = inserer_racine('8', creer_arbre('9'), NULL);
  return inserer_racine('0', a, b);
}

void test_present(){
  printf("Test fonction present\n");
  assert(present(NULL, 'x') == 0);
  arbre_binaire_t gros = mon_gros_arbre();
  assert(present(gros, '1') == 1);
  assert((present(gros->gauche, '1') || present(gros->droit, '1')) == present(gros, '1'));
  assert(present(gros, '6') == 1);
  assert((present(gros->gauche, '6') || present(gros->droit, '6')) == present(gros, '6'));
  assert(present(gros, '9') == 1);
  assert((present(gros->gauche, '9') || present(gros->droit, '9')) == present(gros, '9'));
  assert(present(gros, 'c') == 0);
  assert((present(gros->gauche, 'c') || present(gros->droit, 'c')) == present(gros, 'c'));
  printf(" ok\n");
}

void test_taille(){
  printf("Test fonction taille\n");
  assert(taille(NULL) == 0);
  arbre_binaire_t gros = mon_gros_arbre();
  assert(taille(gros) == 10);
  assert(taille(gros) == (1+taille(gros->gauche)+taille(gros->droit) ));	
  printf(" ok\n");
}

void test_creer_feuille(){
  printf("Test fonction creer_feuille\n");
  expression a = creer_feuille('a');
  assert(a->valeur == 'a');
  assert(a->gauche == NULL && a->droit == NULL);
  expression b = creer_feuille('b');
  assert(b->valeur == 'b');
  assert(b->gauche == NULL && b->droit == NULL);
  printf(" ok\n");
}

void test_inserer_operation(){
  printf("Test fonction inserer_operation\n");
  expression gauche = creer_feuille('a');
  expression droit = creer_feuille('b');
  expression a = inserer_racine('+', gauche, droit);
  assert(a->valeur == '+');
  assert(a->gauche == gauche);
  assert(a->droit == droit);
  printf(" ok\n");
}

expression ma_grosse_expression(){
  expression a = inserer_racine('+', inserer_racine('*', creer_feuille('a'), creer_feuille('b')),
				     inserer_racine('+', creer_feuille('c'), creer_feuille('b')));
  expression b = inserer_racine('*', creer_feuille('c'), creer_feuille('d'));
  return inserer_racine('+', a, b);
  printf(" ok\n");
}


void test_taille_expression(){
  printf("Test fonction taille_expression\n");
  assert(taille_expression(creer_feuille('c')) == 1);
  expression grosse = ma_grosse_expression();
  assert(taille_expression(grosse) == 11);
  assert(taille(grosse) == (1+taille(grosse->gauche)+taille(grosse->droit) ));	
  printf(" ok\n");
}

void test_inserer_feuille(){
  printf("Test fonction inserer_feuille\n");
  arbre_binaire_t a = inserer_feuille(NULL, 'c', 5);
  assert( a->valeur == 'c');
  assert( a->gauche == NULL && a->droit == NULL);
  arbre_binaire_t b = inserer_feuille(a, '4', GAUCHE);
  assert( b->gauche->valeur == '4');
  arbre_binaire_t c = inserer_feuille(a, 'x', DROITE);
  assert( c->droit->valeur == 'x');
  printf(" ok\n");
}


int main(){
  test_creer_arbre_simple();
  test_inserer_racine();
  test_present();
  test_taille();
  test_creer_feuille();
  test_inserer_operation();
  test_taille_expression();
  test_inserer_feuille();
  return EXIT_SUCCESS;
}
