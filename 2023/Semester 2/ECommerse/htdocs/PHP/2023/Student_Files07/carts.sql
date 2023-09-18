CREATE DATABASE if not EXISTS cartdb;
use cartdb;
CREATE TABLE if not exists customers(
    first_name VARCHAR(20) not null,
    last_name VARCHAR(20) not null,
    phone VARCHAR(10) not null,
    password VARCHAR(64) not null,
    email VARCHAR(40) not null,
    PRIMARY KEY(email)
);
CREATE TABLE if not exists products(
    product_id VARCHAR(8) not null,
    product_name VARCHAR(30) not null,
    unit_price double(6,2) not null,
    qty int(11),
    PRIMARY KEY(product_id)
);
INSERT INTO products (product_id, product_name, unit_price, qty)
VALUES
    ('1001', 'Widget A', 10.99, 100),
    ('1002', 'Widget B', 12.49, 75),
    ('1003', 'Gadget X', 24.99, 50),
    ('1004', 'Gadget Y', 19.99, 60),
    ('1005', 'Tool Z', 8.75, 120);