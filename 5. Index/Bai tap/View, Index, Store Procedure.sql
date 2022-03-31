CREATE DATABASE Product;
USE Product;
CREATE TABLE Products (
	Id INT PRIMARY KEY,
	productCode INT,
	productName VARCHAR (45),
	productPrice DOUBLE,
	productAmount INT,
	productDescription VARCHAR (100),
    productStatus VARCHAR (25)
    );
INSERT INTO Products VALUES 
		(1, 111, 'Nuoc tay trang', 100000.00, 10, 'Hang nhap khau', 'Moi ve'),
		(2, 112, 'Bong tay trang', 40000.00, 50, 'Hang noi dia', 'Hang cu'),
		(3, 113, 'Sua rua mat', 50000.00, 45, 'Hang noi dia', 'Moi ve'),
		(4, 114, 'Sua tam', 120000.00, 40, 'Hang noi dia', 'Hang ton'),
		(5, 115, 'Kem duong da', 200000.00, 5, 'Hang nhap khau', 'Hang cu');

-- Chỉ mục

ALTER TABLE Products ADD INDEX idx_productCode (productCode);
ALTER TABLE Products ADD INDEX idx_product (productCode, productPrice);
EXPLAIN SELECT productName FROM Products WHERE productCode = 114;

-- View

CREATE VIEW Products_view AS 
SELECT productCode, productName, productPrice, productStatus
FROM Products;

CREATE OR REPLACE VIEW Products_view AS
SELECT productCode, productName, productPrice
FROM Products;

DROP VIEW Products_view;

-- store procedure

DELIMITER//
drop procedure if exists findAllProducts
CREATE PROCEDURE findAllProducts AS

SELECT * FROM Products

DELIMITER;