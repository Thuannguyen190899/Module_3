DELIMITER //
drop procedure if exists getStudentId;
CREATE PROCEDURE getStudentId

(IN cusNum INT(11))

BEGIN

  SELECT * FROM Student WHERE StudentName = 'Hung';

END //

DELIMITER ;
call getStudentId(2);


DELIMITER //

CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;

