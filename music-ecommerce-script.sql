START TRANSACTION;

DROP TABLE IF EXISTS products, customers, transactions;

CREATE TABLE customers (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(50) NOT NULL,
 email VARCHAR(100) NULL DEFAULT 'N/A',
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
 product_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 product_name VARCHAR(100) NOT NULL,
 product_cost DECIMAL(10, 2) NOT NULL,
 product_description TEXT NOT NULL,
 product_category VARCHAR(30) NOT NULL
);

CREATE TABLE transactions (
transaction_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
customer_id INT NOT NULL REFERENCES customers(id),
total_cost DECIMAL(10, 2) NOT NULL
);

INSERT INTO customers (username, email) VALUES ('alice', 'alice@test.com');
INSERT INTO customers (username, email) VALUES ('bob', 'bob@test.com');
INSERT INTO customers (username, email) VALUES ('charlie', 'charlie@test.com');

INSERT INTO products (product_name, product_cost, product_description, product_category) VALUES ('Electric Guitar', 500.00, 'Black Fender Stratocaster', 'Guitar');
INSERT INTO products (product_name, product_cost, product_description, product_category) VALUES ('Acoustic Guitar', 1500.00, 'Taylor 214ce', 'Guitar');
INSERT INTO products (product_name, product_cost, product_description, product_category) VALUES ('Guitar Strings', 12.99, 'Ernie Ball Regular Slinky', 'Accessories');
INSERT INTO products (product_name, product_cost, product_description, product_category) VALUES ('Guitar Tuner', 25.00, 'Clip-on digital tuner', 'Accessories');

INSERT INTO transactions (customer_id, total_cost) VALUES (1, 512.99);
INSERT INTO transactions (customer_id, total_cost) VALUES (2, 1500.00);
INSERT INTO transactions (customer_id, total_cost) VALUES (1, 25.00);

COMMIT;