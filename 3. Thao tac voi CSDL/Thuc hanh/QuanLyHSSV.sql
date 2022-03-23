CREATE DATABASE QuanLyHSSV;
Use QuanLyHSSV;
CREATE TABLE Class (
	ClassID INT primary key,
    ClassName varchar (20),
    StartDay DATE,
    `Status` int
    );
CREATE TABLE Student (
	StudentID INT primary key,
    StudentName varchar (20),
    Address varchar (50),
    Phone varchar(10),
    `Status` int,
    ClassID INT,
    foreign key (ClassID) references Class (ClassID)
    );
CREATE TABLE Subject (
	SubID INT primary key,
    SubName varchar (30),
    Credit INT,
     `Status` int
     );
CREATE TABLE Mark (
	MarkID INT primary key,
    SubID INT,
    StudentID INT,
    Mark INT,
    ExamTimes INT,
    foreign key (SubID) references Subject (SubID),
    foreign key (StudentID) references Student (StudentID)
    );
INSERT INTO Class
	VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
	VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
	VALUES (3, 'B3', current_date, 0);
INSERT INTO Student (StudentID, StudentName, Address, Phone, `Status`, ClassId)
	VALUES (1, 'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentID, StudentName, Address, `Status`, ClassId)
	VALUES (2, 'Hoa', 'Hai phong', 1, 2);
INSERT INTO Student (StudentID, StudentName, Address, Phone, `Status`, ClassId)
	VALUES (3, 'Manh', 'HCM', '0123123123', 0, 3);
INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO Mark 
VALUES (1, 1,1, 8, 1),
       (2, 2, 2, 10, 2),
       (3, 3, 3, 12, 1);
SELECT * FROM Student;
SELECT * FROM Student WHERE `Status` = true;
SELECT * FROM Subject WHERE Credit < 10;
SELECT S.StudentID, S.StudentName, C.ClassName
	FROM Student S JOIN Class C ON S.ClassID = C.ClassID;
SELECT S.StudentID, S.StudentName, C.ClassName
	FROM Student S JOIN Class C ON S.ClassID = C.ClassID
		where C.ClassName = 'A1';
SELECT S.StudentID, S.StudentName, Sub.SubName, M.Mark
	FROM Student S JOIN Mark M ON S.StudentID = M.StudentID JOIN Subject Sub ON M.SubID = Sub.SubID AND Sub.SubName = 'CF';