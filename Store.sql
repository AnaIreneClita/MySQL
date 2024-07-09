CREATE DATABASE Store;
USE Store;

CREATE TABLE clients (
    clientId INT NOT NULL,
    clientName VARCHAR(25) NOT NULL, 
    address VARCHAR(30) NOT NULL,
    city VARCHAR(25),
    country VARCHAR(25)
);

CREATE TABLE products (
    productId INT NOT NULL,
    productName VARCHAR(25) NOT NULL,
    productPrice INT NOT NULL,
    entryData DATE NOT NULL,
    PRIMARY KEY (productId)
);

ALTER TABLE clients
ADD COLUMN phoneNumber INT NOT NULL;

ALTER TABLE clients
DROP COLUMN phoneNumber;

ALTER TABLE clients
RENAME COLUMN city TO town;

ALTER TABLE clients
ADD CONSTRAINT pk_idClient PRIMARY KEY(clientId, clientName);

ALTER TABLE products MODIFY productId INT AUTO_INCREMENT;

CREATE TABLE orders (
    orderId INT NOT NULL,
    clientId INT NOT NULL,
    orderDate DATE NOT NULL,
    PRIMARY KEY (orderId),
    FOREIGN KEY (clientId) REFERENCES clients(clientId)
);

ALTER TABLE orders
MODIFY COLUMN orderDate CHAR(30) NOT NULL;

CREATE TABLE sales (
    totalSales INT NOT NULL,
    storeLocation VARCHAR(20) NOT NULL,
    productsStock INT NOT NULL
);

INSERT INTO clients (clientId, clientName, address, town, country) VALUES
(1, 'Andrew', 'Str.1 May, Nr.11', 'Bucharest', 'Romania');

INSERT INTO orders (orderId, clientId, orderDate)
VALUES (100, 1, '2024-12-17');