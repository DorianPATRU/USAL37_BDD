use tp_freelancer;

INSERT INTO customers_cats
(cat_id, cat_name)
VALUES
(1, 'Particulier'),
(2, 'Secteur public'),
(3, 'Entreprise privé');

INSERT INTO customers
(customer_name, customer_email, cat_id)
VALUES
('Mike', 'm@test.fr', 1),
('Jon', 'j@test.fr', 1),
('FISC', 'fisc@test.fr', 2),
('Plombier Machin', 'plombier@test.fr', 3);

INSERT INTO jobs
(job_state, job_title, customer_id)
VALUES
('En cours', 'Site wordpress pour Mike', 1),
('Terminé', 'Site Prestashop pour Mike', 1),
('En cours', 'Site Drupal pour Jon', 2);



