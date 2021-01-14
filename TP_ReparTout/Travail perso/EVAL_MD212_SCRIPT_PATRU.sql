DROP DATABASE IF EXISTS eval_md212;

CREATE DATABASE eval_md212 DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE eval_md212;

CREATE TABLE clients(
   client_id INT AUTO_INCREMENT,
   client_lastname VARCHAR(30) NOT NULL,
   client_firstname VARCHAR(30) NOT NULL,
   client_address VARCHAR(150) NOT NULL,
   client_phone INT NOT NULL,
   PRIMARY KEY(client_id),
   UNIQUE(client_phone)
);

CREATE TABLE mechanics(
   mechanic_id INT AUTO_INCREMENT,
   mechanic_lastname VARCHAR(30) NOT NULL,
   mechanic_firstname VARCHAR(30) NOT NULL,
   mechanic_slots DATETIME NOT NULL,
   mechanic_specialty VARCHAR(30) NOT NULL,
   PRIMARY KEY(mechanic_id)
);

CREATE TABLE repairs(
   repair_id INT AUTO_INCREMENT,
   repair_category VARCHAR(30) NOT NULL,
   repair_supported DATETIME NOT NULL,
   repair_duration TIME NOT NULL,
   repair_price INT NOT NULL,
   mechanic_id INT NOT NULL,
   client_id INT NOT NULL,
   PRIMARY KEY(repair_id)
);

ALTER TABLE repairs
ADD 
	CONSTRAINT fk_repairsmechanicid FOREIGN KEY (mechanic_id) REFERENCES mechanics(mechanic_id);

ALTER TABLE repairs
ADD 
	CONSTRAINT fk_repairsclientid FOREIGN KEY (client_id) REFERENCES clients(client_id);





