INSERT INTO Address (postCode, State, street) VALUES
('2000', 'NSW', 'Sydney Harbour Bridge'),
('3000', 'VIC', 'Melbourne Cricket Ground'),
('4000', 'QLD', 'Brisbane River'),
('5000', 'SA', 'Adelaide Oval'),
('6000', 'WA', 'Perth Stadium');

INSERT INTO Customer (email, password, firstName, lastName, phoneNumber, cardNumber, Address_addressID) VALUES
('john.doe@example.com', 'password123', 'John', 'Doe', '+61412345678', '1234567890123456', 1),
('jane.smith@example.com', 'password456', 'Jane', 'Smith', '+61487654321', '9876543210987654', 2),
('peter.jones@example.com', 'password789', 'Peter', 'Jones', '+61456789012', '4567890123456789', 3),
('mary.williams@example.com', 'password012', 'Mary', 'Williams', '+61432109876', '3210987654321098', 4),
('david.brown@example.com', 'password345', 'David', 'Brown', '+61498765432', '9876543210987654', 5);

INSERT INTO Provider (address, Address_addressID, Customer_customerID) VALUES
('123 Main Street, Sydney, NSW 2000', 1, 1),
('456 Queen Street, Melbourne, VIC 3000', 2, 2),
('789 Brisbane Road, Brisbane, QLD 4000', 3, 3),
('1011 Adelaide Road, Adelaide, SA 5000', 4, 4),
('1213 Perth Street, Perth, WA 6000', 5, 5);

INSERT INTO Product (QTY, name, description, providerID) VALUES
(100, 'iPhone 14', 'The latest and greatest iPhone.', 1),
(50, 'Samsung Galaxy S23', 'The latest and greatest Samsung Galaxy phone.', 2),
(25, 'Google Pixel 7', 'The latest and greatest Google Pixel phone.', 3),
(15, 'MacBook Air M2', 'The latest and greatest MacBook Air.', 4),
(10, 'Dell XPS 13', 'The latest and greatest Dell XPS 13.', 5);
