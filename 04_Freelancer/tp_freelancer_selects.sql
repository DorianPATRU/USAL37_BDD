use tp_freelancer;

SELECT cat_name FROM customers_cats;

SELECT customer_name, cat_name
FROM customers
JOIN customers_cats ON customers.cat_id = customers_cats.cat_id;


SELECT customer_id, customer_name, customer_email
FROM customers;


-- affiche les titres des missions avec pour chaque mission
-- l'id et le nom du client et le nom de catégorie du client

SELECT 
job_title AS 'Titre de la mission', 
J.customer_id,
customer_name, 
cat_name
FROM jobs AS J
JOIN customers AS C ON jobs.customer_id = C.customer_id
JOIN customers_cats AS CAT ON C.cat_id = CAT.cat_id;