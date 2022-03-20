CREATE database QuanLyBanHang;
USE QuanLyBanHang;
Create table Customer (
	cID int primary key,
	cName varchar (20) NOT NULL,
	cAge int 
	);
Create table `Order` (
	oID int primary key,
	cID int,
	foreign key (cID) references Customer (cID),
    oDate date ,
    oTotalPrice double 
    );
Create table Product (
	pID int primary key,
    pName nvarchar (30),
    pPrice double
    );
 Create table OrderDetail ( 
	oID int,
    pID int,
    foreign key (oID) references `Order` (oID),
    foreign key (pID) references Product (pID),
    primary key (oID, pID),
    odQTY varchar (25)
    ); 