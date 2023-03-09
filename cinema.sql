 /* a Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur */

SELECT titre, annee_sortie_film, TIME_FORMAT(SEC_TO_TIME((duree_minute * 60)), "%H:%i") AS duree_film, prenom, nom
FROM film f
INNER JOIN realisateur r ON r.id_realisateur = f.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne

/* b Liste des films dont la durée excède 2h15 classés par durée (du plus long au plus court */

SELECT titre, TIME_FORMAT(SEC_TO_TIME((duree_minute * 60)), "%H:%i") AS duree_film
FROM film f
WHERE duree_minute > 135
ORDER BY duree_minute DESC

/* c Liste des films d’un réalisateur (en précisant l’année de sortie)  */

SELECT titre, annee_sortie_film, prenom, nom 
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
WHERE r.id_realisateur = 1

/* d  Nombre de films par genre (classés dans l’ordre décroissant) */


SELECT nom_genre, COUNT(f.id_film) AS nbFilm
FROM film f
INNER JOIN categoriser c ON f.id_film = c.id_film
INNER JOIN genre g ON c.id_genre = g.id_genre
GROUP BY nom_genre
ORDER BY nbFilm DESC 

/* e  Nombre de films par réalisateur (classés dans l’ordre décroissant) */

SELECT prenom, nom, COUNT(f.id_film) AS nbFilm
FROM film f
INNER JOIN realisateur r ON f.id_realisateur = r.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne
GROUP BY r.id_realisateur
ORDER BY nbFilm DESC 

/* f  Casting d’un film en particulier (id_film) : nom, prénom des acteurs + sexe */

SELECT prenom, nom, sexe
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
INNER JOIN casting c ON a.id_acteur = c.id_acteur
WHERE c.id_film = 1


/* g Films tournés par un acteur en particulier (id_acteur) avec leur rôle et l’année de sortie 
(du film le plus récent au plus ancien) */


SELECT titre, prenom, nom, nom_role, annee_sortie_film
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
INNER JOIN casting c ON a.id_acteur = c.id_acteur
INNER JOIN film f ON c.id_film = f.id_film
INNER JOIN role r ON c.id_role = r.id_role
WHERE a.id_acteur = 2
ORDER BY annee_sortie_film DESC

/* h  Listes des personnes qui sont à la fois acteurs et réalisateurs */

SELECT prenom, nom
FROM acteur p
INNER JOIN personne a ON a.id_personne = p.id_personne
INNER JOIN realisateur r ON p.id_personne = r.id_personne
WHERE p.id_personne IN (
SELECT r.id_personne FROM realisateur )


/* i Liste des films qui ont moins de 5 ans (classés du plus récent au plus ancien) */

SELECT titre, annee_sortie_film
FROM film
WHERE YEAR(DATE( NOW() )) - annee_sortie_film < 5
ORDER BY annee_sortie_film DESC



/* j  Nombre d’hommes et de femmes parmi les acteurs */

SELECT sexe, COUNT(id_acteur) AS nbActeur
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
GROUP BY sexe


/* k  Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu) */

SELECT prenom, nom, YEAR(DATE( NOW() )) - YEAR(date_naissance) AS diffDate
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
HAVING diffDate > 50
ORDER BY diffDate DESC 


/* l Acteurs ayant joué dans 3 films ou plus */


SELECT prenom, nom, COUNT(c.id_acteur) AS nbFilm
FROM acteur a
INNER JOIN personne p ON a.id_personne = p.id_personne
INNER JOIN casting c ON c.id_acteur = a.id_acteur
GROUP BY c.id_acteur 
HAVING COUNT(c.id_acteur) >= 3