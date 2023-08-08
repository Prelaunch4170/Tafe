INSERT INTO supplier
VALUES (1, 'Garden Grower', 'business@gardensupplier.com.au', '08-27732420');

INSERT INTO supplier
VALUES (2, 'Home Improvement', 'office@homeimprovement.com.au', '08-82544665');


INSERT INTO supplier_address
VALUES (1, 'Business', '1 King Street', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO supplier_address
VALUES (2, 'Postal', 'Box 100 Grote Street Mail Center', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO supplier_address
VALUES (3, 'Business', '2 Queen Street', 'Melbourne', '3000', 'VIC', 'Australia', 2);

INSERT INTO supplier_address
VALUES (4, 'Postal', 'Box 200 Bourke Street Post Office', 'Melbourne', '3000', 'VIC', 'Australia', 2);


INSERT INTO item
VALUES (1, 'Slow release fertiliser 20kg', 40.00, 10, 1);

INSERT INTO item
VALUES (2, 'Organic fertiliser 20kg', 50.00, 20, 1);

INSERT INTO item
VALUES (3, 'METHOD wall cabinet', 400.00, 30, 2);

INSERT INTO item
VALUES (4, 'Applaro outdoor sofa set', 1500.00, 40,  2);


INSERT INTO customer
VALUES (1, 'John', 'Brown', 'jbrown100@yahoo.com', 100.00);

INSERT INTO customer
VALUES (2, 'Jack', 'White', 'jwhite200@yahoo.com', 200.00);

INSERT INTO customer
VALUES (3, 'Jill', 'Black', 'jblack300@yahoo.com', 300.00); 


INSERT INTO phone
VALUES (1, '0427788128', 'Personal', 1);

INSERT INTO phone
VALUES (2, '0414237921', 'Personal', 2);

INSERT INTO phone
VALUES (3, '08-81091122', 'Business', 2);

INSERT INTO phone
VALUES (4, '08-85678888', 'Business', 3);


INSERT INTO customer_address
VALUES (1, 'Business', '1st Street', 'Adelaide', '5000', 'SA', 'Australia', 1);

INSERT INTO customer_address
VALUES (2, 'Personal', '2nd Street', 'Melbourne', '3001', 'VIC', 'Australia', 2);  

INSERT INTO customer_address
VALUES (3, 'Postal', 'Box 300 Richmond Post Office', 'Richmond', '3121', 'VIC', 'Australia', 2);  

INSERT INTO customer_address
VALUES (4, 'Business', '10 Main Street', 'Blackwood', '5051', 'SA', 'Australia', 3);  

INSERT INTO customer_address
VALUES (5, 'Postal', 'Box 400 Blackwood Post Office', 'Blackwood', '5051', 'SA', 'Australia', 3);

INSERT INTO customer_address
VALUES (6, 'Personal', '5 High street', 'Belair', '5052', 'SA', 'Australia', 3);


INSERT INTO interest
VALUES (1, 'Furniture', 1);

INSERT INTO interest
VALUES (2, 'Electrical', 1);

INSERT INTO interest
VALUES (3, 'Gardening', 2);

INSERT INTO interest
VALUES (4, 'Electronic', 2);

INSERT INTO interest
VALUES (5, 'Furniture', 2);


INSERT INTO cart
VALUES (1 , '2022-02-20 12:00:00', 'Deliver to business address', 1, '2022-02-22', 5, 1);

Insert INTO cart
VALUES (2 , '2022-02-20 14:30:00', 'Deliver to personal address', 1, '2022-02-23', 4, 2);

Insert INTO cart
VALUES (3 , '2022-02-22 16:00:00', null, 0, null, null, 2);

Insert INTO cart
VALUES (4 , '2022-02-23 09:30:00', 'Deliver to delivery address', 0, null, null, 3);


INSERT INTO cart_item
VALUES (1, 1, 2);

INSERT INTO cart_item
VALUES (1, 2, 3);

INSERT INTO cart_item
VALUES (2, 3, 1);

INSERT INTO cart_item
VALUES (2, 4, 1);

INSERT INTO cart_item
VALUES (2, 1, 3);

INSERT INTO cart_item
VALUES (3, 1, 4);

INSERT INTO cart_item
VALUES (4, 2, 2);
