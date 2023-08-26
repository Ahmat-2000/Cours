---------------------------------------------------------------------
--   TD5 - TD6              Exercice 2
---------------------------------------------------------------------

-- Partie 1. Écrivez l'instruction qui permet de créer la table REDUCTION.

-- Partie 2.

-- 1. Quantité totale de chevilles commandées par des clients
-- de Toulouse  (c’est-à-dire, la somme des quantités de chevilles
-- commandées par l’ensemble des clients de Toulouse).

+---------------+
| SUM(Quantite) |
+---------------+
|           620 |
+---------------+

 
-- 2. Pour chaque produit commandé, nombre de commandes où ce produit
-- a été commandé avec une réduction non nulle. 

+-------+-----------------+
| RefP  | COUNT(D.RefCom) |
+-------+-----------------+
| CH464 |               2 |
| CL60  |               4 |
| PL224 |               1 |
+-------+-----------------+

-- ce qui est faux :

+-------+-----------------+
| RefP  | COUNT(D.RefCom) |
+-------+-----------------+
| CH464 |               1 |
+-------+-----------------+
 

-- 3. Que retourne la requête : 

SELECT *
FROM REDUCTION NATURAL JOIN DETAIL ;

---------------------------------------------------------------------
-- TD5 - TD6                    Exercice 3
---------------------------------------------------------------------

-- 1. Pour chaque type de produit, les noms des clients de Toulouse
-- qui ont commandé un produit de ce type. Le résultat doit être présenté
-- suivant l'ordre alphabétique des types des produits, et pour chaque
-- type de produit, suivant l'ordre alphabétique des noms des clients.
-- La table résultat ne doit pas contenir deux fois la même ligne.

+----------+----------+
| TypeP    | NomC     |
+----------+----------+
| Cheville | MERCIER  |
| Cheville | NEUMAN   |
| Cheville | PONCELET |
| Clou     | MERCIER  |
| Clou     | NEUMAN   |
| Clou     | PONCELET |
| Planche  | MERCIER  |
| Planche  | NEUMAN   |
+----------+----------+
8 rows in set (0.00 sec)


-- 2. Produits de type Clou qui n'ont pas été commandés par certains
-- clients (autrement dit, produits de type Clou pour chacun desquels
-- il existe un client qui ne l'a pas commandé).

+------+
| RefP |
+------+
| CL45 |
| CL60 |
+------+

-- 3. Noms des clients qui n'ont commandé aucun des produits commandés 
-- par VANDERKA

+-----------+
| NomC      |
+-----------+
| AVRON     |
| FERARD    |
| FRANCK    |
| GILLET    |
| GOFFIN    |
| GUILLAUME |
| HANSENNE  |
| JACOB     |
| MONTI     |
| TOUSSAINT |
| VANBIST   |
+-----------+
11 rows in set (0.00 sec)


-- 4. Moyenne du montant total d'une commande, en considérant toutes les commandes.
-- La sous-requête dans le FROM calcule la somme de chaque commande

+--------------+
| AVG(Total)   |
+--------------+
| 37252.857143 |
+--------------+

-- 5. Références de la (ou des) commande(s) dont le montant total est
-- maximal parmi toutes les commandes. On donnera aussi ce montant.


+--------+-----------+
| RefCom | Total     |
+--------+-----------+
|      5 | 169625.00 |
+--------+-----------+


---------------------------------------------------------------------
--   TD5 - TD6                 Exercice 6
---------------------------------------------------------------------


-- Villes dont les clients ont commandé tous les types de produits. 

+----------+
| VILLE    |
+----------+
| Toulouse |
+----------+


--  *************************************************************
--         TP 3
--  *************************************************************

-- Exercice 1. Écrivez l'instruction qui permet de créer la table REDUCTION.

-- Partie 2.

-- 1. Quantité totale de chevilles commandées par des clients
-- de Toulouse  (c’est-à-dire, la somme des quantités de chevilles
-- commandées par l’ensemble des clients de Toulouse).

-- NATURAL JOIN est ici possible

+---------------+
| SUM(Quantite) |
+---------------+
|           620 |
+---------------+


-- 2. Code des produits ayant une réduction non nulle avec
-- leur pourcentage de réduction classés par ordre croissant de
-- réduction. 


+-------+-----------+
| Code  | Reduction |
+-------+-----------+
| CL60  |       6.5 |
| CH264 |         7 |
| PL222 |       7.1 |
| PL224 |      7.12 |
| CL45  |       9.5 |
| CH464 |      12.2 |
+-------+-----------+
 

-- 3. Pour chaque produit commandé, nombre de commandes où ce produit
-- a été commandé avec une réduction non nulle. 


+-------+-----------------+
| RefP  | COUNT(D.RefCom) |
+-------+-----------------+
| CH464 |               2 |
| CL60  |               4 |
| PL224 |               1 |
+-------+-----------------+

 

-- 4. Que retourne la requête : 

SELECT *
FROM REDUCTION R NATURAL JOIN DETAIL D ;



-- TP3 - Exercice  2 

-- Dans l'extension de la table CLIENT du TP1, la valeur de l'attribut CAT
-- n'est pas définie pour les clients Mercier et Neuman. On suppose
-- maintenant que Mercier est dans la catégorie C1 et Neuman dans la
-- catégorie C2. Mettez à jour la table CLIENT.

SELECT * FROM CLIENT ;

+------+-----------+-----------+------+
| RefC | NomC      | Ville     | CAT  |
+------+-----------+-----------+------+
|    1 | GOFFIN    | Namur     | B2   |
|    2 | HANSENNE  | Poitiers  | C1   |
|    3 | MONTI     | Geneve    | B2   |
|    4 | GILLET    | Toulouse  | B1   |
|    5 | AVRON     | Toulouse  | B1   |
|    6 | FERARD    | Poitiers  | B2   |
|    7 | MERCIER   | Toulouse  |      |
|    8 | TOUSSAINT | Poitiers  | C1   |
|    9 | PONCELET  | Toulouse  | B2   |
|   10 | JACOB     | Bruxelles | C2   |
|   11 | VANBIST   | Lille     | B1   |
|   12 | NEUMAN    | Toulouse  |      |
|   13 | FRANCK    | Namur     | C1   |
|   14 | VANDERKA  | Namur     | C1   |
|   15 | GUILLAUME | Paris     | B1   |
+------+-----------+-----------+------+
15 rows in set (0.00 sec)


mysql> SELECT * FROM CLIENT ;
+------+-----------+-----------+------+
| RefC | NomC      | Ville     | CAT  |
+------+-----------+-----------+------+
|    1 | GOFFIN    | Namur     | B2   |
|    2 | HANSENNE  | Poitiers  | C1   |
|    3 | MONTI     | Geneve    | B2   |
|    4 | GILLET    | Toulouse  | B1   |
|    5 | AVRON     | Toulouse  | B1   |
|    6 | FERARD    | Poitiers  | B2   |
|    7 | MERCIER   | Toulouse  | C1   |
|    8 | TOUSSAINT | Poitiers  | C1   |
|    9 | PONCELET  | Toulouse  | B2   |
|   10 | JACOB     | Bruxelles | C2   |
|   11 | VANBIST   | Lille     | B1   |
|   12 | NEUMAN    | Toulouse  | C2   |
|   13 | FRANCK    | Namur     | C1   |
|   14 | VANDERKA  | Namur     | C1   |
|   15 | GUILLAUME | Paris     | B1   |
+------+-----------+-----------+------+
15 rows in set (0.00 sec)


-- TP3 - Exercice 3 

-- 1. Références et noms des clients qui ont chacun commandé plus
-- de 50 clous, en considérant toutes les commandes de chaque client.


+------+---------+---------------+
| RefC | NomC    | QuantiteClous |
+------+---------+---------------+
|    7 | MERCIER |            92 |
+------+---------+---------------+


-- avec les INSERT du TP 4, le résultat est : 

+------+---------+---------------+
| RefC | NomC    | QuantiteClous |
+------+---------+---------------+
|    1 | GOFFIN  |           120 |
|    7 | MERCIER |            92 |
|   13 | FRANCK  |            95 |
+------+---------+---------------+


-- 2. Noms des clients qui n'ont commandé aucun des produits commandés 
-- par VANDERKA


+-----------+
| NomC      |
+-----------+
| AVRON     |
| FERARD    |
| FRANCK    |
| GILLET    |
| GOFFIN    |
| GUILLAUME |
| HANSENNE  |
| JACOB     |
| MONTI     |
| TOUSSAINT |
| VANBIST   |
+-----------+
11 rows in set (0.00 sec)


-- 3. Moyenne du montant total d'une commande, en considérant toutes les commandes.

-- La sous-requête dans le FROM calcule la somme de chaque commande


+--------------+
| AVG(Total)   |
+--------------+
| 37252.857143 |
+--------------+


-- 4. Références de la (ou des) commande(s) dont le montant total est
-- maximal parmi toutes les commandes. On donnera aussi ce montant.

+--------+-----------+
| RefCom | Total     |
+--------+-----------+
|      5 | 169625.00 |
+--------+-----------+


-- 5. Noms des clients qui ont commandé le produit CL45 ou le produit CL60, 
-- mais pas les deux. Indication : ces clients n'ont commandé qu'un
-- seul produit.


+----------+
| NomC     |
+----------+
| NEUMAN   |
| VANDERKA |
+----------+

-- Avec les INSERT du TP 4 :

+----------+
| NomC     |
+----------+
| GOFFIN   |
| NEUMAN   |
| FRANCK   |
| VANDERKA |
+----------+


-- 6. Noms des clients qui ont commandé exactement deux des trois produits
-- CL45, CL60 et CH464.


+----------+
| NomC     |
+----------+
| MERCIER  |
| NEUMAN   |
| VANDERKA |
+----------+

-- même résultat avec les INSERT du TP 4


-- 7. Pour chaque client (représenté par sa référence), le nombre total
-- de clous qu'il a commandés (en considérant toutes les commandes).
-- Ne pas oublier les clients qui n'ont commandé aucun clou.

-- Le UNION est nécessaire pour ajouter les clients qui n'ont passé
-- aucune commande de clous.


+------+---------------+
| RefC | QuantiteClous |
+------+---------------+
|    7 |            92 |
|    9 |            43 |
|   12 |            15 |
|   14 |            30 |
|    1 |             0 |
|    2 |             0 |
|    3 |             0 |
|    4 |             0 |
|    5 |             0 |
|    6 |             0 |
|    8 |             0 |
|   10 |             0 |
|   11 |             0 |
|   13 |             0 |
|   15 |             0 |
+------+---------------+


-- Avec les INSERT du TP 4 :

+------+---------------+
| RefC | QuantiteClous |
+------+---------------+
|    1 |           120 |
|    7 |            92 |
|    9 |            43 |
|   12 |            15 |
|   13 |            95 |
|   14 |            30 |
|    2 |             0 |
|    3 |             0 |
|    4 |             0 |
|    5 |             0 |
|    6 |             0 |
|    8 |             0 |
|   10 |             0 |
|   11 |             0 |
|   15 |             0 |
+------+---------------+


-- 8.  Pour chaque ville et chaque catégorie de clients de cette ville, 
-- la somme, en euros, des montants de toutes les commandes des clients 
-- habitant cette ville et appartenant à cette catégorie.
-- Ne pas oublier les couples (ville, catégorie) pour lesquels
-- aucun client n’a fait de commande et pour lesquels le montant total
-- sera donc 0.

-- Principe : A cause du point précédent, on écrira une requête UNION.

+-----------+------+-----------------------------+
| Ville     | CAT  | MONTANT TOTAL DES COMMANDES |
+-----------+------+-----------------------------+
| Namur     | C1   |                        8350 |
| Toulouse  | B2   |                       35215 |
| Toulouse  | C1   |                       47580 |
| Toulouse  | C2   |                      169625 |
| Namur     | B2   |                           0 |
| Poitiers  | B2   |                           0 |
| Geneve    | B2   |                           0 |
| Bruxelles | B2   |                           0 |
| Lille     | B2   |                           0 |
| Paris     | B2   |                           0 |
| Poitiers  | C1   |                           0 |
| Geneve    | C1   |                           0 |
| Bruxelles | C1   |                           0 |
| Lille     | C1   |                           0 |
| Paris     | C1   |                           0 |
| Namur     | B1   |                           0 |
| Poitiers  | B1   |                           0 |
| Geneve    | B1   |                           0 |
| Toulouse  | B1   |                           0 |
| Bruxelles | B1   |                           0 |
| Lille     | B1   |                           0 |
| Paris     | B1   |                           0 |
| Namur     | C2   |                           0 |
| Poitiers  | C2   |                           0 |
| Geneve    | C2   |                           0 |
| Bruxelles | C2   |                           0 |
| Lille     | C2   |                           0 |
| Paris     | C2   |                           0 |
+-----------+------+-----------------------------+
28 rows in set (0.00 sec)


-- Avec les INSERT du TP 4 :

+-----------+------+-----------------------------+
| Ville     | CAT  | MONTANT TOTAL DES COMMANDES |
+-----------+------+-----------------------------+
| Namur     | B2   |                       12600 |
| Namur     | C1   |                       17375 |
| Toulouse  | B2   |                       35215 |
| Toulouse  | C1   |                       47580 |
| Toulouse  | C2   |                      181625 |
| Poitiers  | B2   |                           0 |
| Geneve    | B2   |                           0 |
| Bruxelles | B2   |                           0 |
| Lille     | B2   |                           0 |
| Paris     | B2   |                           0 |
| Poitiers  | C1   |                           0 |
| Geneve    | C1   |                           0 |
| Bruxelles | C1   |                           0 |
| Lille     | C1   |                           0 |
| Paris     | C1   |                           0 |
| Namur     | B1   |                           0 |
| Poitiers  | B1   |                           0 |
| Geneve    | B1   |                           0 |
| Toulouse  | B1   |                           0 |
| Bruxelles | B1   |                           0 |
| Lille     | B1   |                           0 |
| Paris     | B1   |                           0 |
| Namur     | C2   |                           0 |
| Poitiers  | C2   |                           0 |
| Geneve    | C2   |                           0 |
| Bruxelles | C2   |                           0 |
| Lille     | C2   |                           0 |
| Paris     | C2   |                           0 |
+-----------+------+-----------------------------+
28 rows in set (0.00 sec)


-- 9. Villes où on trouve toutes les catégories de clients.

-- Version basée sur le comptage (COUNT): 
-- Donner chaque ville telle que le nombre de catégories de clients
-- de la ville est égal au nombre total de catégories.


+----------+---------------------+
| Ville    | COUNT(DISTINCT CAT) |
+----------+---------------------+
| Toulouse |                   4 |
+----------+---------------------+

-- même résultat avec les INSERT du TP 4


-- Version avec double NOT IN :

+----------+
| Ville    |
+----------+
| Toulouse |
+----------+
