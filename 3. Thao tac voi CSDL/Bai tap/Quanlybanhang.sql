CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;
CREATE TABLE Customer (
	cID INT PRIMARY KEY,
    cName VARCHAR (25),
    cAge INT
);
CREATE TABLE `Order` (
	oID INT PRIMARY KEY,
    cID INT,
    FOREIGN KEY (cID) REFERENCES Customer (cID),
    oDate DATE,
    oTotalPrice INT
);
CREATE TABLE Product (
	pID INT PRIMARY KEY,
    pName VARCHAR (25),
    pPrice INT
);
CREATE TABLE OrderDetail (
	oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES `Order` (oID),
    FOREIGN KEY (pID) REFERENCES Product (pID)
);
INSERT INTO Customer VALUES
	(1, 'Minh Quan', 10),
    (2, 'Ngoc Oanh', 20),
    (3, 'Hong Ha', 50);
INSERT INTO `Order` (oID, cID, oDate) VALUES
	(1, 1, '2006-3-21'),
    (2, 2, '2006-3-23'),
    (3, 1, '2006-3-16');
INSERT INTO Product VALUES
	(1, 'May Giat', 3),
    (2, 'Tu Lanh', 5),
    (3, 'Dieu Hoa', 7),
    (4, 'Quat', 1),
    (5, 'Bep Dien', 2);
 INSERT INTO OrderDetail VALUES
	(1, 1, 3),
    (1, 3, 7),
    (1, 4, 2),
    (2, 1, 1),  
    (3, 1, 8), 
    (2, 5, 4),  
    (2, 3, 3);
SELECT  O.oID, O.oDate, P.pPrice FROM `Order` O JOIN OrderDetail Ord ON O.oID = Ord.oID
	JOIN Product P ON Ord.pID = P.pID;
    
SELECT C.cName, P.pName, P.pPrice, Ord.odQTY 

FROM Product P JOIN OrderDetail Ord ON P.pID = Ord.pID
	JOIN `Order` O ON O.oID = Ord.oID
	JOIN Customer C ON O.cID = C.cID;
    
SELECT C.cName FROM Customer C LEFT JOIN `Order` O ON  C.cID = O.cID WHERE O.cID is Null ; -- cach 1

select c.cName from customer c where c.cId not in (select cId from `order`); -- cach 2

SELECT O.oID, O.oDate, Ord.odQTY*P.pPrice
	FROM OrderDetail Ord JOIN Product P ON Ord.pID = P.pID 
    JOIN `Order` O  ON O.oID = Ord.oID;