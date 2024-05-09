CREATE DATABASE cinepax;

\c cinepax

CREATE TABLE utilisateur(
    id SERIAL PRIMARY KEY,
    mail VARCHAR(250) NOT NULL UNIQUE,
    mdp VARCHAR(250) NOT NULL,
    role INT NOT NULL -- 10 admin / 20 normal
);

CREATE TABLE salle(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150) NOT NULL
);

CREATE TABLE film(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(250) NOT NULL
);

CREATE TABLE details_salle(
    id SERIAL PRIMARY KEY,
    id_salle INT NOT NULL, 
    range VARCHAR(150) NOT NULL,
    numero VARCHAR(150) NOT NULL,

    FOREIGN KEY(id_salle) REFERENCES salle(id)
);

CREATE TABLE seance(
    id SERIAL PRIMARY KEY,
    id_salle INT NOT NULL,
    id_film INT NOT NULL,
    date_diffusion DATE NOT NULL,
    heure TIME NOT NULL,

    FOREIGN KEY(id_salle) REFERENCES salle(id),
    FOREIGN KEY(id_film) REFERENCES film(id)
);

CREATE TABLE billet(
    id SERIAL PRIMARY KEY,
    id_seance INT NOT NULL,
    date_jour DATE NOT NULL,
    prix DOUBLE PRECISION NOT NULL,
    range VARCHAR(150) NOT NULL,
    numero VARCHAR(150) NOT NULL,
    etat INT NOT NULL, -- 10 vendu / 20 en vente

    FOREIGN KEY(id_seance) REFERENCES seance(id)
);

CREATE TABLE vente(
    id SERIAL PRIMARY KEY,
    id_utilisateur INT,
    id_billet INT,
    date_vente DATE,

    FOREIGN KEY(id_utilisateur) REFERENCES utilisateur(id),
    FOREIGN KEY(id_billet) REFERENCES billet(id)
);


CREATE OR REPLACE VIEW V_details_seance AS
SELECT seance.id, s.nom AS salle, f.nom AS film, seance.date_diffusion, seance.heure
FROM seance 
JOIN salle AS s ON seance.id_salle = s.id
JOIN film AS f ON seance.id_film = f.id
ORDER BY date_diffusion, heure;

SELECT b.id, b.id_seance, b.date_jour, b.prix, b.range, b.numero, b.etat FROM billet b
    JOIN seance ON b.id_seance = seance.id
WHERE seance.id = 2 AND b.date_jour >= NOW() ORDER BY b.id, b.date_jour;


-- donnees

INSERT INTO utilisateur VALUES(default, 'steph@gmail.com', '0ec5f7c0abe435d22cca61c6d4ed58226e83f9cecef7dcbfda3b48c449c77b35', 10); -- mdp: steph
INSERT INTO utilisateur VALUES(default, 'rabe@gmail.com', '45e29f5d203280b858f89406f0a46ed8a6ca8976aa2aed6d9a6639a0cf5d3deb', 20); -- mdp: rabe


INSERT INTO salle VALUES(default, 'Salle 1');
INSERT INTO salle VALUES(default, 'Salle 2');
INSERT INTO salle VALUES(default, 'Salle 3');


INSERT INTO film VALUES(default, 'Interstellar');
INSERT INTO film VALUES(default, 'Le Loup de Wall Street');
INSERT INTO film VALUES(default, 'Fast and Furious 10');
INSERT INTO film VALUES(default, 'Barbie');
INSERT INTO film VALUES(default, 'Kung Fu Panda 4');
INSERT INTO film VALUES(default, 'Incéption');

INSERT INTO details_salle VALUES(default, 1, 'A', '1');
INSERT INTO details_salle VALUES(default, 1, 'A', '2');
INSERT INTO details_salle VALUES(default, 1, 'A', '3');
INSERT INTO details_salle VALUES(default, 1, 'A', '4');
INSERT INTO details_salle VALUES(default, 1, 'A', '5');
INSERT INTO details_salle VALUES(default, 1, 'B', '1');
INSERT INTO details_salle VALUES(default, 1, 'B', '2');
INSERT INTO details_salle VALUES(default, 1, 'B', '3');
INSERT INTO details_salle VALUES(default, 1, 'B', '4');
INSERT INTO details_salle VALUES(default, 1, 'B', '5');
INSERT INTO details_salle VALUES(default, 1, 'C', '1');
INSERT INTO details_salle VALUES(default, 1, 'C', '2');
INSERT INTO details_salle VALUES(default, 1, 'C', '3');
INSERT INTO details_salle VALUES(default, 1, 'C', '4');
INSERT INTO details_salle VALUES(default, 1, 'C', '5');

INSERT INTO details_salle VALUES(default, 2, 'A', '1');
INSERT INTO details_salle VALUES(default, 2, 'A', '2');
INSERT INTO details_salle VALUES(default, 2, 'A', '3');
INSERT INTO details_salle VALUES(default, 2, 'A', '4');
INSERT INTO details_salle VALUES(default, 2, 'A', '5');
INSERT INTO details_salle VALUES(default, 2, 'B', '1');
INSERT INTO details_salle VALUES(default, 2, 'B', '2');
INSERT INTO details_salle VALUES(default, 2, 'B', '3');
INSERT INTO details_salle VALUES(default, 2, 'B', '4');
INSERT INTO details_salle VALUES(default, 2, 'B', '5');
INSERT INTO details_salle VALUES(default, 2, 'C', '1');
INSERT INTO details_salle VALUES(default, 2, 'C', '2');
INSERT INTO details_salle VALUES(default, 2, 'C', '3');
INSERT INTO details_salle VALUES(default, 2, 'C', '4');
INSERT INTO details_salle VALUES(default, 2, 'C', '5');

INSERT INTO details_salle VALUES(default, 3, 'A', '1');
INSERT INTO details_salle VALUES(default, 3, 'A', '2');
INSERT INTO details_salle VALUES(default, 3, 'A', '3');
INSERT INTO details_salle VALUES(default, 3, 'A', '4');
INSERT INTO details_salle VALUES(default, 3, 'A', '5');
INSERT INTO details_salle VALUES(default, 3, 'B', '1');
INSERT INTO details_salle VALUES(default, 3, 'B', '2');
INSERT INTO details_salle VALUES(default, 3, 'B', '3');
INSERT INTO details_salle VALUES(default, 3, 'B', '4');
INSERT INTO details_salle VALUES(default, 3, 'B', '5');
INSERT INTO details_salle VALUES(default, 3, 'C', '1');
INSERT INTO details_salle VALUES(default, 3, 'C', '2');
INSERT INTO details_salle VALUES(default, 3, 'C', '3');
INSERT INTO details_salle VALUES(default, 3, 'C', '4');
INSERT INTO details_salle VALUES(default, 3, 'C', '5');


INSERT INTO seance VALUES(default, 1, 1, '2024-05-10', '10:30');
INSERT INTO seance VALUES(default, 1, 3, '2024-05-10', '12:30');
INSERT INTO seance VALUES(default, 1, 4, '2024-05-10', '16:00');
INSERT INTO seance VALUES(default, 2, 1, '2024-05-10', '10:30');
INSERT INTO seance VALUES(default, 2, 2, '2024-05-10', '16:30');
INSERT INTO seance VALUES(default, 2, 6, '2024-05-11', '09:00');
INSERT INTO seance VALUES(default, 3, 5, '2024-05-10', '09:00');
INSERT INTO seance VALUES(default, 3, 6, '2024-05-10', '12:00');
INSERT INTO seance VALUES(default, 3, 1, '2024-05-11', '15:00');


INSERT INTO billet VALUES(default, 1, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 1, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 2, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 2, '2024-05-10', 10000, 'C', '5', 10);


INSERT INTO billet VALUES(default, 3, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 3, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 4, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 4, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 5, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 5, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 6, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 6, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 7, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 7, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 8, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 8, '2024-05-10', 10000, 'C', '5', 10);

INSERT INTO billet VALUES(default, 9, '2024-05-10', 20000, 'A', '1', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 20000, 'A', '2', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 20000, 'A', '3', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 20000, 'A', '4', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 20000, 'A', '5', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 15000, 'B', '1', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 15000, 'B', '2', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 15000, 'B', '3', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 15000, 'B', '4', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 15000, 'B', '5', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 10000, 'C', '1', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 10000, 'C', '2', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 10000, 'C', '3', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 10000, 'C', '4', 10);
INSERT INTO billet VALUES(default, 9, '2024-05-10', 10000, 'C', '5', 10);