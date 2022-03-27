USE QuanLyHSSV;
SELECT * FROM Subject WHERE Credit >= All (SELECT Credit FROM Subject);
SELECT sub.SubName, max(M.Mark) 'Max Mark' FROM Subject Sub JOIN Mark M ON Sub.SubID = M.SubID;
SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY M.Mark DESC;