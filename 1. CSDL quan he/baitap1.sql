CREATE DATABASE my_database;
CREATE TABLE class (
id int primary key,
nameclass varchar (30));
Create table teacher (
idT int primary key, 
nameT varchar (20) key,
age int (3),
country varchar (30),
FOREIGN KEY (idT) REFERENCES class (id));
