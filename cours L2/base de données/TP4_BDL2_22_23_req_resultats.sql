
-- Résultats des requêtes du TP 4 de L2 Bases de données

-- Exercice 1. 

-- Insérez les lignes (8,13,2006-02-08) et (9,1,2006-03-11)
-- dans la table COMMANDE et insérer les lignes (5,CH264,100),
-- (8,CL60,95) et (9,CL45,120) dans la table DETAIL.



-- Exercice 2

-- 1.  Références et noms des clients qui ont chacun commandé au total 
-- (c'est-à-dire, en considérant toutes les commandes) un nombre de
-- chevilles plus grand que le nombre total de clous commandés par
-- l'ensemble des clients.

-- Avec les INSERT du TP 4 :

Empty set (0.00 sec)


-- 2. Produits de type "cheville" les plus commandés en quantité et cette quantité

-- Avec les INSERT du TP 4 :

+-------+---------------+
| RefP  | SUM(Quantite) |
+-------+---------------+
| CH464 |           405 |
+-------+---------------+


-- 3. Pour chaque client ayant effectué au moins une commande,
-- nom du client et pourcentage de produits qu'il a acheté sur l'ensemble
-- de ses commandes par rapport au nombre total de produits.
-- On affichera le résultat par ordre décroissant du pourcentage.

-- Avec les INSERT du TP 4 :

+----------+-------------+
| NomC     | Pourcentage |
+----------+-------------+
| MERCIER  |     57.1429 |
| NEUMAN   |     57.1429 |
| PONCELET |     57.1429 |
| VANDERKA |     28.5714 |
| FRANCK   |     14.2857 |
| GOFFIN   |     14.2857 |
+----------+-------------+


-- 4. Références des clients qui ont commandé au moins une fois chaque
-- type de produit. On donnera deux solutions (l'une avec COUNT,
-- l'autre avec un double NOT IN).

-- Avec les INSERT du TP 4 :

-- Première solution avec comptage :

+------+
| RefC |
+------+
|    7 |
|   12 |
+------+

-- Seconde solution : clients qui ne sont pas parmi les clients
-- qui n'ont pas commandé au moins un type de produit

+------+
| RefC |
+------+
|    7 |
|   12 |
+------+


-- 5. Références des commandes qui ne comportent que des produits
-- de types différents.

-- Avec les INSERT du TP 4

+--------+----------------------------------------+
| RefCom | Nombre de Types ou de Ref de Produits  |
+--------+----------------------------------------+
|      1 |                                      1 |
|      2 |                                      2 |
|      3 |                                      1 |
|      4 |                                      2 |
|      6 |                                      1 |
|      8 |                                      1 |
|      9 |                                      1 |
+--------+----------------------------------------+


-- 6.  Villes où au moins un client n'a passé aucune commande 
-- ni en 2005, ni en 2006.

-- Avec les INSERT du TP 4 : ajout des commandes 8 et 9 qui sont des
-- clients de Namur et des 3 n-uplets de DETIAL, tous les clients de
-- Namur (i.e., clients 1, 13 et 14) ont alors passé des commandes en
-- 2005 ou 2006.  Aussi, toutes les villes sont affichées sauf Namur.

+-----------+
| Ville     |
+-----------+
| Poitiers  |
| Geneve    |
| Toulouse  |
| Bruxelles |
| Lille     |
| Paris     |
+-----------+
6 rows in set (0.00 sec)


-- 7. Villes où chaque client a passé au moins une commande en 2005 ou
-- 2006.

-- On soustrait à l'ensemble des villes l'ensemble des villes où au
-- moins un client n'a passé aucune commande ni en 2005, ni en 2006
-- (c'est-à-dire la table de la question précédente).

-- avec les INSERT du TP 4 : ajout des commandes 8 et 9 qui sont des
-- clients de Namur.

+-------+
| Ville |
+-------+
| Namur |
+-------+


-- 8. Paires de produits qui sont toujours commandés ensemble. 

-- Solution AVEC VARIABLES CORRELEES DANS REQUETES IMBRIQUEES : paires
-- de produits p1 et p2 telles que le nombre de commandes comportant à
-- la fois p1 et p2 est égal au nombre de commandes comportant p1 et
-- est égal aussi au nombre de commandes comportant p2


-- Avec les INSERT du TP 4 :

+-------+-------+-----------+
| RefP  | RefP  | NombreCom |
+-------+-------+-----------+
| CH264 | PL224 |         2 |
+-------+-------+-----------+


-- 9. Noms des clients qui ont commandé exactement les mêmes 
-- types de produits que Vanderka.

/* 
Ce sont les clients pour lesquels on a à la fois les deux conditions 
suivantes:
- il n'existe pas de type de produit commandé par Vanderka qu'ils 
n'ont pas commandé.
- il n'existe pas de type de produit qu'ils ont commandé et qui 
n'a pas été commandé par Vanderka. */

-- Avec les INSERT du TP 4 :
    
+----------+
| NomC     |
+----------+
| PONCELET |
| VANDERKA |
+----------+

