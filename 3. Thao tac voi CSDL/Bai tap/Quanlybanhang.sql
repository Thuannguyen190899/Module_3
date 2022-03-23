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
    cDate DATE,
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
    odQTY INT
);
