-- SQL
-- DDL (CREATE DROP ALTER)
-- DML (INSERT UPDATE DELETE)
-- DQL (SELECT)

DROP DATABASE IF EXISTS usal37_agence;

CREATE DATABASE usal37_agence DEFAULT CHARACTER SET 'utf8';

USE usal37_agence;


CREATE TABLE countries 
(
	country_code CHAR(2) PRIMARY KEY,
    country_name VARCHAR(128) NOT NULL
);

CREATE TABLE cities
(
	city_code INT AUTO_INCREMENT,
    city_name VARCHAR(128) NOT NULL,
    country_code CHAR(2) NOT NULL,
    PRIMARY KEY (city_code)
);

-- contraintes de clés étrangères
-- 2 syntaxes possibles
/*
ALTER TABLE cities 
ADD	COLUMN country_code CHAR(2) NOT NULL;
    
ALTER TABLE cities 
MODIFY COLUMN city_name VARCHAR(80) NOT NULL;

ALTER TABLE cities 
DROP COLUMN city_name;
*/
/*
ALTER TABLE cities 
ADD 
FOREIGN KEY (country_code) REFERENCES countries(country_code);
*/

ALTER TABLE cities 
ADD CONSTRAINT fk_cities_countries
FOREIGN KEY (country_code) REFERENCES countries(country_code);






INSERT INTO countries
(country_code, country_name) 
VALUES 
('FR', 'France'), 
('DE', 'Allemagne'),
('IT', 'Italie'),
('MA', 'Maroc');

INSERT INTO cities
(city_name, country_code) 
VALUES 
('Paris', 'FR'),
('Berlin', 'DE'),
('Milan', 'IT'),
('Rome', 'IT');



SELECT * FROM cities; 

SELECT city_name, cities.country_code country_name FROM cities,countries;


SELECT city_code, city_name, cities.country_code, country_name 
FROM cities 
JOIN countries ON cities.country_code = countries.country_code;


SELECT city_name, countries.country_code, country_name 
FROM countries 
LEFT JOIN cities ON cities.country_code = countries.country_code;



