/* Suppression de la base de données si elle existe */

DROP DATABASE IF EXISTS usal37_legumos;

/* Création de la base de données si elle n'existe pas avec le set de caractères par défaut UTF-8 */

CREATE DATABASE IF NOT EXISTS usal37_legumos DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

/* Utilisation de la base de données */

USE usal37_legumos;

/* Création des tables */

CREATE TABLE Vegetables(
   Id INT,
   Name VARCHAR(50) NOT NULL UNIQUE,
   Variety VARCHAR(50) NOT NULL,
   PrimaryColor VARCHAR(20) NOT NULL,
   LifeTime INT NOT NULL,
   Fresh INT NOT NULL,
   PRIMARY KEY(Id)
);

CREATE TABLE Sales(
   SaleId INT,
   SaleDate DATE NOT NULL,
   SaleWeight INT NOT NULL,
   SaleUnitPrice DECIMAL(5,2) NOT NULL,
   SaleActive INT NOT NULL,
   Id INT NOT NULL,
   PRIMARY KEY(SaleId),
   FOREIGN KEY(Id) REFERENCES Vegetables(Id)
);

/* Ajout de 20 légumes différents */

INSERT INTO Vegetables
(Id, Name, Variety, PrimaryColor, LifeTime, Fresh) 
VALUES 
(111, "Asperge", "Burgundine", "Blanc", 5, 0),
(121, "Aubergine", "Barbentane", "Violet", 5, 1),
(124, "Betterave", "Crapaudine", "Rouge", 5, 1),
(132, "Brocoli", "Calabrais", "Vert", 5 , 1),
(146, "Courgette", "Diamant", "Vert", 6, 1),
(157, "Echalote", "Jersey", "Rose", 60, 0),
(169, "Epinard", "Butterfly", "Vert", 2, 1),
(178, "Haricot", "Rudy", "Vert", 4, 1),
(183, "Laitue", "Radicchio", "Rouge", 6, 1),
(195, "Lentille", "Corail", "Rouge", 730, 0),
(214, "Mache", "Gala", "Vert", 3, 1),
(226, "Patate", "Bintje", "Jaune", 90, 0),
(238, "Navet", "Montesson", "Violet", 7, 1),
(243, "Oignon", "Sturon", "Jaune", 60, 0),
(259, "Poireau", "Perpetuel", "Vert", 5, 0),
(267, "Potiron", "Aspen", "Orange", 42, 0),
(272, "Poivron", "Nikita", "Blanc", 8, 1),
(281, "Radis", "Bamba", "Rouge", 2, 1),
(295, "Roquette", "Fresca", "Vert", 2, 1),
(310, "Tomate", "Cerise", "Rouge", 4, 0);

/* Ajout de 10 ventes associées à différents légumes */

INSERT INTO Sales
(SaleId, SaleDate, SaleWeight, SaleUnitPrice, SaleActive, Id) 
VALUES 
(9111, "2021-02-17", 3, 5.00, 1, 111), 
(1121, "2021-02-18", 5, 7.40, 1, 183), 
(2124, "2021-02-19", 8, 2.50, 0, 146), 
(3132, "2021-02-20", 4, 3.90, 0, 169), 
(4146, "2021-02-21", 1, 1.80, 1, 195), 
(5157, "2021-02-22", 7, 1.60, 0, 238), 
(6169, "2021-02-23", 2, 1.50, 1, 243), 
(7178, "2021-02-24", 6, 2.40, 1, 267), 
(8183, "2021-02-25", 9, 2.75, 0, 281), 
(9195, "2021-02-26", 4, 4.80, 1, 310);

/* Requête qui affiche toutes les ventes avec le nom du légume associé à la vente */

SELECT Vegetables.Id, Name, SaleId, SaleDate, SaleWeight, SaleUnitPrice, SaleActive
FROM Sales
JOIN Vegetables ON Sales.Id = Vegetables.Id








