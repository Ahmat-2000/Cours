

-- Question 1 de la partie 2 du TP 1 :
-- exprimez chacune des requêtes de l'exercice 2 par une instruction MySQL

-- 1. Villes où habite au moins un client.

+-----------+
| Ville     |
+-----------+
| Namur     |
| Poitiers  |
| Geneve    |
| Toulouse  |
| Toulouse  |
| Poitiers  |
| Toulouse  |
| Poitiers  |
| Toulouse  |
| Bruxelles |
| Lille     |
| Toulouse  |
| Namur     |
| Namur     |
| Paris     |
+-----------+


-- 2. Noms des clients qui habitent Toulouse.

+----------+
| NomC     |
+----------+
| GILLET   |
| AVRON    |
| MERCIER  |
| PONCELET |
| NEUMAN   |
+----------+


-- 3. Références et types des produits dont le prix est compris entre 100 et 180 euros

+-------+----------+
| RefP  | TypeP    |
+-------+----------+
| CH264 | Cheville |
| CL45  | Clou     |
+-------+----------+


-- 4. Types et prix des produits de la commande de référence 4.

+----------+--------+
| TypeP    | Prix   |
+----------+--------+
| Cheville | 220.00 |
| Clou     | 105.00 |
+----------+--------+


-- 5. Références des commandes qui comportent au moins un produit commandé
-- à la fois pour une quantité supérieure à 50 unités et de prix (prix unitaire)
-- inférieur à 100 euros.

+--------+
| RefCom |
+--------+
|      2 |
|      7 |
+--------+


-- 6. Références des clients qui ont commandé des clous.

+------+
| RefC |
+------+
|    9 |
|   14 |
|    9 |
|   12 |
|    9 |
|    7 |
|    7 |
+------+


-- 7. Villes où habite au moins un client qui a commandé un produit à 220 euros

+----------+
| Ville    |
+----------+
| Namur    |
| Toulouse |
| Toulouse |
+----------+


-- Question 2 de la partie 2 du TP 1 :
-- exprimez chacune des requêtes de l'exercice 2 par une instruction MySQL


-- a. Noms des villes, classés par ordre alphabétique, où habite au
-- moins un client dont le nom commence par la lettre 'G'.

+----------+
| Ville    |
+----------+
| Namur    |
| Paris    |
| Toulouse |
+----------+


-- b. Noms des clients qui habitent Toulouse et dont la référence 
-- est inférieure à 6 ou comprise entre 11 et 15. 

+--------+
| NomC   |
+--------+
| GILLET |
| AVRON  |
| NEUMAN |
+--------+


-- c. Noms des clients qui ont commandé des clous en 2005.
 
+----------+
| NomC     |
+----------+
| PONCELET |
| VANDERKA |
+----------+
