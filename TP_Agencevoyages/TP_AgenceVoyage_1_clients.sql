/*
1) 	Créer la table "sales" (commerciaux) et ajouter 5 commerciaux

2) 	Créer la table "clients" et ajouter 5 clients dans la table
	Chaque client est associé à un commercial différent 
    
3) 	Sélectionnez tous les clients (nom du commercial associé inclus)
*/

use usal37_agence;

CREATE TABLE sales
(
   com_code VARCHAR(5),
   com_name VARCHAR(64) NOT NULL,
   com_password VARCHAR(60) NOT NULL,
   PRIMARY KEY (com_code)
);

INSERT INTO sales
(com_code, com_name, com_password)
VALUES
('1', 'Frank', '******'),
('2', 'Steven', '******'),
('3', 'James', '******'),
('4', 'Alain', '******'),
('5', 'Richard', '******');

CREATE TABLE clients
(
   client_id INT AUTO_INCREMENT,
   client_lastname VARCHAR(32) NOT NULL,
   client_firstname VARCHAR(32) NOT NULL,
   client_email VARCHAR(128) NOT NULL,
   client_phone VARCHAR(16) NOT NULL,
   client_added DATE NOT NULL,
   client_password VARCHAR(60) NOT NULL,
   com_code VARCHAR(5) NOT NULL,
   PRIMARY KEY (client_id),
   FOREIGN KEY (com_code) REFERENCES sales (com_code)
);

INSERT INTO clients
(client_id, client_lastname, client_firstname, client_email, client_phone, client_added, client_password, com_code)
VALUES
('2496', 'DUPOND', 'Martin', 'dupond.martin@hotmail.com', '+336 45418978', '2011-08-20', '*****', '2'),
('1028', 'FISCHER', 'Thierry', 'fischer.thierry@gmail.com', '+336 26119635', '2006-07-11', '*******', '4'),
('9968', 'MEYER', 'Jacques', 'meyer.jacques@orange.fr', '+336 23488936', '2009-10-09', '******', '1'),
('5467', 'NUSSBAUM', 'Eric', 'nussbaum.eric@yahoo.com', '+337 14742369', '2015-05-19', '*****', '5'),
('1489', 'DEMANGES', 'Julien', 'demanges.julien@outlook.fr', '+337 16781598', '2019-01-24', '*******', '3');

SELECT * FROM clients
JOIN sales ON clients.com_code = sales.com_code


