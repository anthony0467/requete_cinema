 /*Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur */

SELECT titre, annee_sortie_film, TIME_FORMAT(SEC_TO_TIME((duree_minute * 60)), "%H:%i") AS duree_film, prenom, nom
FROM film f
INNER JOIN realisateur r ON r.id_realisateur = f.id_realisateur
INNER JOIN personne p ON r.id_personne = p.id_personne

/*  Liste des films dont la durée excède 2h15 classés par durée (du plus long au plus court */

SELECT titre, TIME_FORMAT(SEC_TO_TIME((duree_minute * 60)), "%H:%i") AS duree_film
FROM film f
WHERE duree_minute > 135
ORDER BY duree_minute DESC