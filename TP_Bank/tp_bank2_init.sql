DROP DATABASE IF EXISTS usal37_tp_bank;

CREATE DATABASE IF NOT EXISTS usal37_tp_bank DEFAULT CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_ci';

USE usal37_tp_bank;


CREATE TABLE banks(
   bank_id INT,
   bank_name VARCHAR(100) NOT NULL,
   PRIMARY KEY(bank_id)
);

CREATE TABLE accounts(
   account_id INT,
   account_owner VARCHAR(255) NOT NULL,
   account_balance DECIMAL(10,2) NOT NULL DEFAULT 0,
   account_overdraft INT NOT NULL DEFAULT 0,
   bank_id INT NOT NULL,
   PRIMARY KEY(account_id),
   FOREIGN KEY(bank_id) REFERENCES banks(bank_id)
);

INSERT INTO banks (bank_id, bank_name) VALUES 
(1001, "Crédit Mutuel"),
(1002, "Crédit Agricole"),
(1003, "Caisse d'épargne");

INSERT INTO accounts 
(account_id, account_owner, bank_id) 
VALUES 
(10, "Dev Mike", 1001),
(11, "Doe Jon", 1001),
(20, "Nymous Ano", 1002),
(21, "Neymar Jean", 1002),
(30, "Dupont Marie", 1003),
(31, "Ronaldo Cristiano", 1003);


DELIMITER $

CREATE PROCEDURE transfer
(
IN amount INT,  
IN from_account INT, 
IN to_account INT 
)
BEGIN
	DECLARE current_amount INT;
    SELECT account_balance INTO current_amount FROM accounts WHERE account_id=from_account;
	IF amount > 0 AND current_amount >= amount 
    THEN 
		UPDATE accounts SET account_balance=account_balance - amount 
		WHERE account_id=from_account;
    
		UPDATE accounts SET account_balance=account_balance + amount 
		WHERE account_id=to_account;
	ELSE 
		SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = "Le transfert n'a pas pu être effectué";
    END IF;
	
END $

DELIMITER ;

