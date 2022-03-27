CREATE VIEW Student_view AS
SELECT StudentName, Address
FROM Student;

SELECT * FROM Student_view;

CREATE OR REPLACE VIEW Student_view AS
SELECT StudentName, Phone
FROM Student WHERE StudentName = 'Manh';

SELECT * FROM Student_view;

DROP VIEW  Student_view;