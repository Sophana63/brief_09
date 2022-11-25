CREATE DATABASE S6_MVC_BTP;
USE S6_MVC_BTP;


-- Création des tables
--

CREATE TABLE IF NOT EXISTS fournisseur (  
  id INT(5) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  age INT(5) NOT NULL,
  ville VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS client (
  id INT(5) NOT NULL AUTO_INCREMENT,
  nom VARCHAR(255) NOT NULL,
  anneeNaiss INT(4),  
  ville VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS produit (  
  label VARCHAR(64) NOT NULL,
  prix FLOAT(11) NOT NULL,
  idF INT(5) NOT NULL,
  FOREIGN KEY (idF) REFERENCES fournisseur(id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS commande (  
  num INT(11) NOT NULL,
  quantite INT(11) NOT NULL,
  idC INT(5) NOT NULL,
  labelP VARCHAR(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Ajout données fournisseur
--

INSERT INTO fournisseur(nom, age, ville) VALUES
('Abounayan', 52, '92190 Meudon'),
('Cima', 37, '44150 Nantes'),
('Preblocs', 48, '92230 Gennevilliers'),
('Samaco', 61, '75018 Paris'),
('Damasco', 29, '49100 Angers');


-- Ajout données client 
--

INSERT INTO client (nom, anneeNaiss, ville) VALUES
('Jean', 1965, '75006 Paris'),
('Paul', 1958, '75006 Paris'),
('Vincent', 1954, '94200 Evry'),
('Pierre', 1950, '92400 Coubevoie'),
('Daniel', 1963, '44000 Nantes');

-- Ajout données produit
--

INSERT INTO produit (label, idF, prix) VALUES
('sable', 1, 300.0),
('briques', 1, 1500.0),
('parpaing', 1, 1150.0),
('sable', 2, 350.0),
('tuiles', 3, 1200.0),
('sable', 3, 1300.0),
('sable', 4, 1500.0),
('sable', 4, 1300.0),
('sable', 4, 1450.0),
('sable', 5, 1450.0),
('sable', 5, 1150.0);

-- Ajout données commande
--

INSERT INTO commande (num, idC, labelP, quantite) VALUES
(1, 1, 'briques', 5),
(1, 1, 'ciment', 10),
(2, 2, 'briques', 12),
(2, 2, 'sable', 9),
(2, 2, 'parpaing', 15),
(3, 3, 'sable', 17),
(4, 4, 'briques', 8),
(4, 4, 'tuiles', 17),
(5, 5, 'parpaing', 10),
(5, 5, 'ciment', 14),
(6, 5, 'briques', 21),
(7, 2, 'ciment', 12),
(8, 4, 'parpaing', 8),
(9, 1, 'tuiles', 15);

COMMIT;