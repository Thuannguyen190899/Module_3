USE QuanLyHSSV;
EXPLAIN SELECT * FROM Student WHERE StudentName = 'Hung';
ALTER TABLE Student ADD INDEX idx_StudentName (StudentName);
ALTER TABLE Student DROP INDEX idx_StudentName;
ALTER TABLE Student ADD INDEX  idx_StudentFile (StudentName, Phone);
EXPLAIN SELECT * FROM Student WHERE StudentName = 'Hung' OR Phone = '0912113113';
ALTER TABLE Student DROP INDEX idx_StudentFile;