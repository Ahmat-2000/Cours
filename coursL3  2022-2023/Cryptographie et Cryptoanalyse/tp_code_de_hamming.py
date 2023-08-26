# coding: utf8
# Ecrivez votre programme ci-dessous.
# Bouton Fullscreen pour passer en plein ecran
# Ensuite Save + Run puis Save + Evaluate

import os
import math
import random

################################################    
###                                          ###
### Implémentez ici les fonctions demandées  ###
###                                          ###
################################################    

#
# encode()
#

def encode(m):
    """
    Fonction qui retourne le code de Hamming du message
    de 4 bits m.
    m est un tableau de 4 entiers valant 0 ou 1.
    En retour, x est un tableau de 7 entiers valant 0 ou 1
    """
    return []


#
# canal()
#

def canal(x,p):
    """
    canal(x,p) modélise un canal symétrique binaire. Cette fonction
    prend en entrée un mot binaire x (de longueur quelconque) et
    une probabilité p dans ]0,1[. Elle retourne un vecteur y, de même
    longueur que x, dont chacune des composantes est égale à celle de x
    avec une probabilité 1-p. Autrement dit, une composante de x est
    modifiée avec probabilité p.
    """
    return []


#
# syndrome
#

def syndrome(y):
    """
    fonction qui prend en entrée un mot binaire y =[y1,...,y7]
    et qui retourne son syndrome s=[s0,s1,s2].
    """
    return [-1,-1,-1]


#
# correction
#

def correction(y,s):
    """
    prend en entrée un mot binaire y et son syndrome s et
    retourne le mot binaire corrigé.
    """
    return []

#
# int_to_tab
#

def int_to_tab(n,k):
    """
    Fonction qui prend deux entiers n et k en paramètres avec 0<=n<2**k
    et qui retourne l'écriture binaire de n sur k bits (quitte à
    ajouter des 0 sur les bits de poids fort). L'écriture sera retournée
    sous forme d'un tableau d'entiers (de 0 et de 1).
    """
    return []


#
# dico_hamming
#

def dico_hamming():
    """
    Retourne un dictionnaire dont les clés sont les entiers
    de 0 à 15 et dont les valeurs correspondent aux codages de Hamming
    de la réprésentation binaire sur 4 bits des entiers de 1 à 15.
    """
    dico={}
    return dico

#
# dist_hamming
#

def dist_hamming(x,y):
    """
    Prend en entrée deux vecteurs binaires x et y de
    même longueur et retourne la distance de Hamming
    entre x et y.
    """
    d=-1
    return d

#
# dist_minimale
#

def dist_minimale(dico):
    """
    Prend en entrée un dictionnaire dico dont les valeurs
    sont des tableaux binaires de même taille représentant
    les mots d'un code et qui calcule la distance minimale
    du code.
    """
    dmin=-1
    return dmin

#
# calcule_proba
#

def calcule_proba(n,p,e):
    """
    calcule la probabilité théorique que le décodage soit
    correct avec un canal binaire symétrique de paramètre p
    qui travaille sur des blocs de n bits et un processus de
    codage/décodage capable de corriger e erreurs.
    """
    return 0.
    
#
# calcule_proba
#

def calcule_proba_empirique_hamming(k,p):
    """
    calcule empiriquement la probabilité qu'un décodage soit correct.
    La fonction génère k mots de code aléatoires, fait passer ces k
    mots de code dans la canal binaire symétrique de paramètre p et
    corrige les mots obtenus en sortie du canal. La fonction retourne
    la probabilité empirique de succès du décodage donnée par le
    nombre de corrections réussies divisé par le nombre total de
    tests (ici k).
    """        
    return -1.

################################################    
###                                          ###
### Programme principal                      ###
###                                          ###
################################################   


def test_question1():
    # question 1: test encodage
    print("********* encode ***********")
    print("encode([0,0,0,0])=",encode([0,0,0,0]))
    print("encode([0,0,0,1])=",encode([0,0,0,1]))
    print("encode([0,0,1,0])=",encode([0,0,1,0]))
    print("encode([0,1,0,0])=",encode([0,1,0,0]))
    print("encode([1,0,0,0])=",encode([1,0,0,0]))
    print("encode([1,1,0,0])=",encode([1,1,0,0]))
    
def test_question2():
    #question 2: test du canal
    print("******* test du canal *************")
    y = canal([0]*10000,0.25)
    print(sum(y)/1000, " est proche de ", 0.25)
    
def test_question3():
    #question 3: syndrome
    print("******** syndrome ************")
    y=[0, 1, 1, 1, 1, 0, 0]
    print("y=",y,"\t \t syndrome(y)=",syndrome(y))
    for i in range(7):
        y[i]=(y[i]+1)%2
        print("y=",y,"\t \t syndrome(y)=",syndrome(y))
        y[i]=(y[i]+1)%2  #suppression erreur précédente

    
def test_question4():
    #question 4: correction
    print("********* correction ***********")
    yinit=[0, 1, 1, 1, 1, 0, 0]
    y=[0, 1, 1, 1, 1, 0, 0]
    print("y=",y)
    print("syndrome(y)=",syndrome(y))
    x=correction(y,syndrome(y))
    print("x=",x)
    print("test:",x==yinit)
    
    for i in range(7):
        y[i]=(y[i]+1)%2  #suppression erreur précédente
        print("y=",y)
        print("syndrome(y)=",syndrome(y))
        x=correction(y,syndrome(y))
        print("x=",x)
        print("test:",x==yinit)
        y[i]=(y[i]+1)%2  #suppression erreur précédente
    
def test_question5():
    #question 5: int_to_str et int_to_tab
    print("********* int_to_tab ***********")
    for i in range(16):
        print("int_to_tab(",i,",4)=",int_to_tab(i,4))
    
def test_question6():
    #question 6: dico_hamming
    print("******** dico_haming ************")
    dico = dico_hamming()
    print("dico_hamming()=",dico)
    
    
def test_question7():
    #question 7: distance de Hamming
    print("*********dist_hamming ***********")
    dico = dico_hamming()
    print("x=",dico[1])
    print("y=",dico[2])
    print("dist_hamming(x,y)=", dist_hamming(dico[1],dico[2]))
    
def test_question8():
    #question 8: distance minimale
    print("******** dist_minimale ************")
    dico = dico_hamming()
    print("dist_minimale(dico_hamming())=", dist_minimale(dico))
    
def test_question9():
    #question 9: probabilité d'erreur théorique
    print("********proba d'erreur théorique ************")
    print("proba erreur théorique=",calcule_proba(7,0.25,1))
    
def test_question10():
    #question 10: probabilité d'erreur empirique
    print("*********proba erreur empirique ***********")
    print("proba erreur théorique=",calcule_proba_empirique_hamming(10000,0.25))
    
    
if __name__=="__main__": # NE PAS SUPPRIMER CETTE LIGNE
    # Votre programme principal ne sera pas evalue.
    # Utilisez-le pour tester votre programme en faisant
    # les appels de votre choix.
    # Respectez bien ce niveau d'indentation.
    print("Debut du programme principal")
    test_question1()
    #test_question2()
    #test_question3()
    #test_question4()
    #test_question5()
    #test_question6()
    #test_question7()
    #test_question8()
    #test_question9()
    #test_question10()
 
    
    
    
