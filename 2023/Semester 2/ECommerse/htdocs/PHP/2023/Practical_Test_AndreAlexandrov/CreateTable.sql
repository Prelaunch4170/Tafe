CREATE TABLE product (
	product_id int(11) NOT NULL AUTO_INCREMENT,
	product_name varchar(30) NOT NULL,
    sock_amount int(11) NOT NULL,
	product_price decimal(6,2) NOT NULL,
    category varchar(30) NOT NULL,
	PRIMARY KEY (product_id)
);
INSERT INTO product (product_name, sock_amount, product_price, category)
VALUES 
    ('Product1', 100, 19.99, 'Electronics'),
    ('Product2', 50, 29.99, 'Clothing'),
    ('Product3', 75, 9.99, 'Home and Garden'),
    ('Product4', 200, 49.99, 'Electronics'),
    ('Product5', 30, 79.99, 'Sports');
