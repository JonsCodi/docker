CREATE SCHEMA records;
SET search_path TO records;

CREATE TABLE customers(
	customer_id SERIAL UNIQUE,
	firstname varchar(50) NOT NULL,
	subname varchar(100) NOT NULL,
	age integer NOT NULL,
	PRIMARY KEY(customer_id)
);

INSERT INTO customers (firstname, subname, age) VALUES ('Jonas', 'Gomes', 25);
INSERT INTO customers (firstname, subname, age) VALUES ('Luisa', 'Garcia', 26);

