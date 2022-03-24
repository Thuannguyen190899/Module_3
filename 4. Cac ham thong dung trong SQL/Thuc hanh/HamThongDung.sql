Use QuanLyHSSV;
INSERT INTO  Student (StudentID, StudentName, Address, Phone, `Status`, ClassId)
 VALUES
	(4, 'Huong', 'Ha Noi', '091222213', 1, 1),
	(5, 'Thuy', 'Hai phong', '0872113113', 0, 3),
	(6, 'Diem', 'Ha Noi', '0352113113', 1, 2);		-- Thêm dữ liệu vào DB để kết quả rõ ràng hơn
SELECT  COUNT(StudentID), Address  AS 'Danh sách sinh viên'
FROM Student
GROUP BY Address;
SELECT*FROM Mark;
-- SELECT S.StudentID, S.StudentName, M.Mark FROM Student S 
--  JOIN Mark M ON S.StudentID = M.StudentID;
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 15;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL(SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);
