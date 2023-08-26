--  *************************************************************
--  Résultats des requêtes des TD 3 et 4 et TP 2 
--  *************************************************************


-- 1. Références et prix des produits de type cheville.

+-------+--------+
| RefP  | Prix   |
+-------+--------+
| CH262 |  75.00 |
| CH264 | 120.00 |
| CH464 | 220.00 |
+-------+--------+


-- 2. Références et prix des produits dont le prix est compris entre
-- 100 et 150 euros et qui apparaissent dans la commande de référence 3.

Empty set (0.00 sec)


-- 3. Pour chaque type de produit, les noms des clients de Toulouse qui ont
-- commandé un produit de ce type. Le résultat doit être présenté suivant
-- l'ordre alphabétique des types des produits, et pour chaque type de produit,
-- suivant l'ordre alphabétique des noms des clients. La table résultat
-- ne doit pas contenir deux fois la même ligne.

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
8 rows in set (0,00 sec)


-- 4. Pour chaque référence de commande, les types des produits à moins
-- de 100 euros qu'elle comporte. Le résultat doit être présenté suivant
-- l'ordre croissant des références des commandes. La table résultat
-- ne doit pas contenir deux fois la même ligne.

+--------+----------+
| RefCom | TypeP    |
+--------+----------+
|      2 | Cheville |
|      2 | Clou     |
|      3 | Clou     |
|      5 | Clou     |
|      7 | Clou     |
|      8 | Clou     |
+--------+----------+
6 rows in set (0.00 sec)


-- 5. Noms des clients qui ont passé au moins une commande en 2005
-- ou en 2006.

+----------+
| NomC     |
+----------+
| VANDERKA |
| PONCELET |
| NEUMAN   |
| MERCIER  |
+----------+


-- 6. Noms des clients qui ont passé au moins une commande en 2005
-- et au moins une commande en 2006.

+----------+
| NomC     |
+----------+
| PONCELET |
+----------+


-- 7. Pour chaque ville dont le nom contient la lettre 'e' ou la lettre 'i', 
-- les références des clients qui y habitent. Le résultat doit être ordonné 
-- suivant l'ordre croissant des noms de villes, et pour chaque ville, 
-- suivant l'ordre décroissant des références des clients. Donnez
-- deux solutions : une avec LIKE, une avec REGEXP.

+-----------+------+
| Ville     | RefC |
+-----------+------+
| Bruxelles |   10 |
| Geneve    |    3 |
| Lille     |   11 |
| Paris     |   15 |
| Poitiers  |    8 |
| Poitiers  |    6 |
| Poitiers  |    2 |
| Toulouse  |   12 |
| Toulouse  |    9 |
| Toulouse  |    7 |
| Toulouse  |    5 |
| Toulouse  |    4 |
+-----------+------+
12 rows in set (0,00 sec)


-- 8. Nombre de produits à 2 euros.

+----------+
| COUNT(*) |
+----------+
|        0 |
+----------+


-- 9. La plus grande des références des clients de Toulouse.

+-----------+
| MAX(RefC) |
+-----------+
|        12 |
+-----------+


-- 10. Pour chaque produit ayant été commandé au moins une fois, 
-- le nombre de commandes où il apparaît. 

+-------+---------------+
| RefP  | COUNT(RefCom) |
+-------+---------------+
| CH262 |             1 |
| CH264 |             1 |
| CH464 |             3 |
| CL45  |             3 |
| CL60  |             4 |
| PL224 |             2 |
+-------+---------------+


-- 11. Pour chaque type de produit, le prix moyen des produits de ce type.

+----------+------------+
| TypeP    | AVG(Prix)  |
+----------+------------+
| Cheville | 138.333333 |
| Clou     | 100.000000 |
| Planche  | 207.500000 |
+----------+------------+


-- 12. Pour chaque type de produit commandé au moins une fois, 
-- le nombre de client ayant commandé un produit de ce type.

+----------+--------------------------+
| TypeP    | COUNT(DISTINCT COM.RefC) |
+----------+--------------------------+
| Cheville |                        4 |
| Clou     |                        4 |
| Planche  |                        2 |
+----------+--------------------------+


-- 13. Noms des villes où habitent au moins deux clients.

+----------+
| Ville    |
+----------+
| Namur    |
| Poitiers |
| Toulouse |
+----------+


-- 14.  Références des produits de type `clou' commandés en quantité supérieure
-- à 100 (en considérant l'ensemble de toutes les commandes).

+------+
| RefP |
+------+
| CL60 |
+------+


-- 15. Pour chaque ville où on a commandé des clous, le nombre de clients 
-- de cette ville qui ont commandé au moins un clou.

+----------+------------------------+
| Ville    | COUNT(DISTINCT C.RefC) |
+----------+------------------------+
| Namur    |                      1 |
| Toulouse |                      3 |
+----------+------------------------+

 
-- 16. Pour chaque client qui a fait au moins une commande, le montant
-- total de ses commandes.

+------+------------------------+
| RefC | SUM(P.Prix*D.Quantite) |
+------+------------------------+
|    7 |               47580.00 |
|    9 |               35215.00 |
|   12 |              169625.00 |
|   14 |                8350.00 |   --    8350 = 25*220 + 30*95
+------+------------------------+


-- 17. Noms des clients qui n'ont passé aucune commande.

+-----------+
| NomC      |
+-----------+
| GOFFIN    |
| HANSENNE  |
| MONTI     |
| GILLET    |
| AVRON     |
| FERARD    |
| TOUSSAINT |
| JACOB     |
| VANBIST   |
| FRANCK    |
| GUILLAUME |
+-----------+
11 rows in set (0,00 sec)


-- 18. Références des clients qui ont passé strictement plus de commandes
-- que VANDERKA.

+------+
| RefC |
+------+
|    9 |
+------+


-- 19. Références des commandes qui ne comportent aucun produit de type
-- 'clou'
	    
+--------+
| RefCom |
+--------+
|      1 |
+--------+


-- 20. Références des commandes des clients de Toulouse qui ne comportent
-- aucun produit à 220 euros. 
	    
+--------+
| RefCom |
+--------+
|      2 |
|      6 |
|      7 |
+--------+


-- 21. Paires de produits qui apparaissent ensemble au moins 
-- une fois dans une même commande, chaque produit étant représenté 
-- par sa référence (chaque paire ne doit être représentée
-- qu’une seule fois).

+-------+-------+
| RefP  | RefP  |
+-------+-------+
| CH262 | CL60  |
| CH464 | CL45  |
| CH464 | CL60  |
| CH464 | PL224 |
| CL60  | PL224 |
| CH264 | CL45  |
| CH264 | CL60  |
| CH264 | PL224 |
| CL45  | CL60  |
| CL45  | PL224 |
| CL60  | PL224 |
+-------+-------+


-- 22. Paires de produits qui n'ont jamais été commandés ensemble (chaque paire
-- ne doit être représentée qu'une seule fois).

+-------+-------+
| RefP  | RefP  |
+-------+-------+
| CH262 | CH264 |
| CH262 | CH464 |
| CH264 | CH464 |
| CH262 | CL45  |
| CH262 | PL222 |
| CH264 | PL222 |
| CH464 | PL222 |
| CL45  | PL222 |
| CL60  | PL222 |
| CH262 | PL224 |
| PL222 | PL224 |
+-------+-------+
11 rows in set (0.00 sec)



--  *************************************************************
--         TP 2
--  *************************************************************

-- 1. Références et noms des clients qui habitent Namur ou Toulouse

+------+----------+
| RefC | NomC     |
+------+----------+
|    1 | GOFFIN   |
|    4 | GILLET   |
|    5 | AVRON    |
|    7 | MERCIER  |
|    9 | PONCELET |
|   12 | NEUMAN   |
|   13 | FRANCK   |
|   14 | VANDERKA |
+------+----------+

  
-- 2. Quantité totale de chevilles en stock (en considérant tous les 
-- produits de type `cheville').

+-------------+
| SUM(QStock) |
+-------------+
|        3185 |
+-------------+


-- 3.  Pour chaque commande, le prix du produit le plus cher qu'elle comporte.

+--------+-------------+
| RefCom | MAX(P.Prix) |
+--------+-------------+
|      1 |      220.00 |
|      2 |       95.00 |
|      3 |       95.00 |
|      4 |      220.00 |
|      5 |      220.00 |
|      6 |      105.00 |
|      7 |      185.00 |
+--------+-------------+


-- 4. Noms et références des clients qui ont passé plus de deux commandes.

+----------+------+
| NomC     | RefC |
+----------+------+
| PONCELET |    9 |
| VANDERKA |   14 |
+----------+------+


-- 5. Références des commandes qui comportent plus de deux produits
-- de type `clou'.

+--------+
| RefCom |
+--------+
|      7 |
+--------+


-- 6. Villes dont le nombre de clients qui y habitent est supérieur au nombre 
-- de clients qui habitent Toulouse.

+----------+
| Ville    |
+----------+
| Toulouse |
+----------+


-- 7. Noms des clients qui ont passé des commandes ne comportant aucun produit
-- à 220 euros.

+----------+
| NomC     |
+----------+
| PONCELET |
| VANDERKA |
| MERCIER  |
+----------+


-- 8. Noms des clients qui n'ont commandé ni clou, ni planche.

+-----------+
| NomC      |
+-----------+
| GOFFIN    |
| HANSENNE  |
| MONTI     |
| GILLET    |
| AVRON     |
| FERARD    |
| TOUSSAINT |
| JACOB     |
| VANBIST   |
| FRANCK    |
| GUILLAUME |
+-----------+
11 rows in set (0.00 sec)


-- 9. Villes où personne n'a commandé le produit `CL45'.

+-----------+
| Ville     |
+-----------+
| Namur     |
| Poitiers  |
| Geneve    |
| Bruxelles |
| Lille     |
| Paris     |
+-----------+
6 rows in set (0.00 sec)


-- 10. Paires de clients qui habitent dans la même ville (chaque paire 
-- ne doit être représentée qu'une seule fois).

+----------+-----------+
| NomC     | NomC      |
+----------+-----------+
| GILLET   | AVRON     |
| HANSENNE | FERARD    |
| GILLET   | MERCIER   |
| AVRON    | MERCIER   |
| HANSENNE | TOUSSAINT |
| FERARD   | TOUSSAINT |
| GILLET   | PONCELET  |
| AVRON    | PONCELET  |
| MERCIER  | PONCELET  |
| GILLET   | NEUMAN    |
| AVRON    | NEUMAN    |
| MERCIER  | NEUMAN    |
| PONCELET | NEUMAN    |
| GOFFIN   | FRANCK    |
| GOFFIN   | VANDERKA  |
| FRANCK   | VANDERKA  |
+----------+-----------+
16 rows in set (0.00 sec)


-- 11. Paires de produits qui n'ont jamais été commandés ensemble
-- (chaque paire ne doit être représentée qu'une seule fois).

+-------+-------+
| RefP  | RefP  |
+-------+-------+
| CH262 | CH264 |
| CH262 | CH464 |
| CH264 | CH464 |
| CH262 | CL45  |
| CH262 | PL222 |
| CH264 | PL222 |
| CH464 | PL222 |
| CL45  | PL222 |
| CL60  | PL222 |
| CH262 | PL224 |
| PL222 | PL224 |
+-------+-------+
11 rows in set (0.00 sec)

