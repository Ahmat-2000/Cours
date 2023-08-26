
-- Résultats des requêtes du TP 5 de L2 Bases de données 

-- Dans ce qui suit, les tables COMMANDE et DETAIL ont été modifiées
-- (cf. TP 4).

MariaDB []> SELECT * FROM COMMANDE ;
+--------+------+------------+
| RefCom | RefC | DateCom    |
+--------+------+------------+
|      1 |   14 | 2005-12-21 |
|      2 |    9 | 2005-12-22 |
|      3 |   14 | 2005-12-23 |
|      4 |    9 | 2005-12-23 |
|      5 |   12 | 2006-01-02 |
|      6 |    9 | 2006-01-02 |
|      7 |    7 | 2006-01-03 |
|      8 |   13 | 2006-02-08 |
|      9 |    1 | 2006-03-11 |
+--------+------+------------+

MariaDB []> SELECT * FROM DETAIL ;
+--------+-------+----------+
| RefCOM | RefP  | Quantite |
+--------+-------+----------+
|      1 | CH464 |       25 |
|      2 | CH262 |       60 |
|      2 | CL60  |       20 |
|      3 | CL60  |       30 |
|      4 | CH464 |      120 |
|      4 | CL45  |       20 |
|      5 | CH264 |      100 |
|      5 | CH464 |      260 |
|      5 | CL60  |       15 |
|      5 | PL224 |      600 |
|      6 | CL45  |        3 |
|      7 | CH264 |      180 |
|      7 | CL45  |       22 |
|      7 | CL60  |       70 |
|      7 | PL224 |       92 |
|      8 | CL60  |       95 |
|      9 | CL45  |      120 |
+--------+-------+----------+
17 rows in set (0,01 sec)


-- Exercice 1

-- 1- création de la table LOCALITE



-- 2- remplissage de la table LOCALITE 

MariaDB []> SELECT * FROM LOCALITE ;
+-----------+-----------------+-------------+
| Ville     | Pays            | Departement |
+-----------+-----------------+-------------+
| Bruxelles | Belgique        |          99 |
| Caen      | France          |          14 |
| Geneve    | Suisse          |          99 |
| Lille     | France          |          59 |
| Londres   | Grande-Bretagne |          99 |
| Lyon      | France          |          69 |
| Namur     | Belgique        |          99 |
| Paris     | France          |          75 |
| Poitiers  | France          |          86 |
| Rome      | Italie          |          99 |
| Toulouse  | France          |          31 |
+-----------+-----------------+-------------+
11 rows in set (0.00 sec)


-- Exercice 2

-- 1- Villes situées hors de France, classées par ordre alphabétique,
-- et pays où elles se trouvent.

-- canevas : requête sur une seule table avec WHERE (et ici avec
-- ORDER)

+-----------+-----------------+
| Ville     | Pays            |
+-----------+-----------------+
| Bruxelles | Belgique        |
| Geneve    | Suisse          |
| Londres   | Grande-Bretagne |
| Namur     | Belgique        |
| Rome      | Italie          |
+-----------+-----------------+


-- 2- Pour chaque nom de client habitant la Belgique ou l'Italie, les
-- références de ses commandes.

-- canevas : requête simple sur 3 tables avec WHERE

+----------+--------+
| NomC     | RefCom |
+----------+--------+
| VANDERKA |      1 |
| VANDERKA |      3 |
| FRANCK   |      8 |
| GOFFIN   |      9 |
+----------+--------+
4 rows in set (0.00 sec)


-- 3- Quantité totale de clous commandés en France (c'est-à-dire,
-- commandés par l'ensemble des clients habitant la France).

-- canevas : requête sur plusieurs tables avec 1 fonction agrégat et
-- sans GROUP BY.

+---------------+
| SUM(Quantite) |
+---------------+
|           150 |
+---------------+


-- 4- Pour chaque département français où habite au moins un client,
-- le nombre de clients qui y habitent.

-- canevas : requête sur plusieurs tables avec 1 fonction agrégat et
-- avec GROUP BY.

+-------------+-------------+
| Departement | COUNT(RefC) |
+-------------+-------------+
|          31 |           5 |
|          59 |           1 |
|          75 |           1 |
|          86 |           3 |
+-------------+-------------+
4 rows in set (0.00 sec)


-- 5- Noms des clients qui habitent la France et qui ont commandé
-- chacun au moins deux types différents de produits.

-- canevas : requête sur plusieurs tables avec fonction agrégat, GROUP
-- BY et un HAVING simple

+----------+-----------------------+
| NomC     | COUNT(DISTINCT TypeP) |
+----------+-----------------------+
| MERCIER  |                     3 |
| NEUMAN   |                     3 |
| PONCELET |                     2 |
+----------+-----------------------+


-- 6- Noms des pays où aucun client n'a fait de commande.

-- canevas : requête simple avec soustraction (i.e. NOT IN) entre deux
-- tables à 1 colonne. 

+-----------------+
| Pays            |
+-----------------+
| Suisse          |
| Grande-Bretagne |
| Italie          |
+-----------------+


-- 7- Noms des clients qui habitent la Belgique et qui ont fait un
-- plus grand nombre de commandes que Goffin.

-- canevas : requête sur plusieurs tables avec fonction agrégat, GROUP
-- BY et HAVING avec comparaison avec une valeur calculée par une
-- requête imbriquée.

+----------+---------------+
| NomC     | COUNT(RefCom) |
+----------+---------------+
| VANDERKA |             2 |
+----------+---------------+


-- 8- Pour chaque pays, les références des produits qui n'ont jamais
-- été commandés dans ce pays (c'est-à-dire, qui n'ont été commandés
-- par aucun client de ce pays).

-- canevas : requête de soustraction (NOT IN) d'un produit cartésien
-- avec une table à 2 colonnes (on calcule en quelque sorte le
-- "contraire" de la requête imbriquée).

+-----------------+-------+
| Pays            | RefP  |
+-----------------+-------+
| Belgique        | CH262 |
| Belgique        | CH264 |
| Belgique        | PL222 |
| Belgique        | PL224 |
| France          | PL222 |
| Suisse          | CH262 |
| Suisse          | CH264 |
| Suisse          | CH464 |
| Suisse          | CL45  |
| Suisse          | CL60  |
| Suisse          | PL222 |
| Suisse          | PL224 |
| Grande-Bretagne | CH262 |
| Grande-Bretagne | CH264 |
| Grande-Bretagne | CH464 |
| Grande-Bretagne | CL45  |
| Grande-Bretagne | CL60  |
| Grande-Bretagne | PL222 |
| Grande-Bretagne | PL224 |
| Italie          | CH262 |
| Italie          | CH264 |
| Italie          | CH464 |
| Italie          | CL45  |
| Italie          | CL60  |
| Italie          | PL222 |
| Italie          | PL224 |
+-----------------+-------+
26 rows in set (0.00 sec)


-- 9- Pays où chaque produit de type cheville a été commandé au moins
-- une fois. On donnera deux solutions: une solution avec une double
-- négation (double "NOT IN") ; une solution avec comptage
-- (i.e. "COUNT").

-- canevas : division de l'algèbre relationnelle

+--------+
| Pays   |
+--------+
| France |
+--------+


-- 10- Pays avec le plus grand nombre de clients distincts en considérant
-- uniquement les clients ayant fait au moins une commande.

-- canevas : cas typique de l'utilisation de la comparaison >=
-- ALL(SELECT...) dans un HAVING pour obtenir une valeur maximale :
-- on compare avec un résultat qui est une table avec plusieurs lignes
-- où chaque ligne est est la valeur résultante d'une fonction agrégat (ici
-- COUNT(DISTINCT RefC)

+----------+----------------------+
| Pays     | COUNT(DISTINCT RefC) |
+----------+----------------------+
| Belgique |                    3 |
| France   |                    3 |
+----------+----------------------+


-- 11- Pour chaque référence de produit, le nombre de clients qui
-- l'ont commandé au moins deux fois. 

-- canevas : on calcule dans le FROM une table intermédiaire avec
-- GROUP BY et HAVING dont la signification est donnée dans
-- l'indication et on calcule la requête demandée à partir de la table
-- du FROM avec un GROUP BY. 

-- Solution où on ne mentionne pas les produits commandés par moins de
-- 2 clients.

+------+-------------+
| RefP | COUNT(RefC) |
+------+-------------+
| CL45 |           1 |
+------+-------------+

--  Solution qui intègre tous les produits en complétant avec la
--  valeur 0 pour chaque produit commandé par moins de 2 clients.

+-------+-------------+
| RefP  | COUNT(RefC) |
+-------+-------------+
| CL45  |           1 |
| CH262 |           0 |
| CH264 |           0 |
| CH464 |           0 |
| CL45  |           0 |
| CL60  |           0 |
| PL224 |           0 |
+-------+-------------+
7 rows in set (0.00 sec)


-- Questions :
-- 1- Pourquoi CL45 apparaît 2 fois dans le résultat ?
-- 2- Pourquoi PL222 n'apparaît pas dans le résultat ?
