CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE Class (
	ClassID INT PRIMARY KEY AUTO_INCREMENT,
	ClassName VARCHAR (60) NOT NULL,
	StartDay DATETIME NOT NULL,
	`Status` bit
	);
CREATE TABLE Student (
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentName VARCHAR (30) NOT NULL,
    Address VARCHAR (50),
    Phone VARCHAR (20),
    `Status` bit,
    ClassID INT NOT NULL,
    FOREIGN KEY (ClassID) REFERENCES Class (ClassID)
    );
CREATE TABLE `Subject` (
	SubID INT primary KEY auto_increment,
    SubName varchar (30) not null,
    Credit Tinyint Not null Default 1 Check (Credit>=1),
    `Status` Bit Default 1
    );
CREATE TABLE Mark (
	MarkID INT primary key auto_increment,
    SubID INT NOT NULL,
    StudentID  INT NOT NULL,
    Mark FLOAT default 0 check (0<Mark<100),
    ExamTimes Tinyint default 1,
    unique (SubID, StudentID),
    foreign key (SubID) references `Subject` (SubID),
    foreign key (StudentID) references Student (StudentID)
    );