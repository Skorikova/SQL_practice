CREATE TEMPORARY TABLE numbers(value BIGINT);

DROP PROCEDURE IF EXISTS divisibility_of_numbers;
DELIMITER //
CREATE PROCEDURE divisibility_of_numbers()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i < 1000 DO
	IF(i % 15 = 0 OR i % 33 = 0) THEN
		INSERT INTO numbers VALUES(i);
		END IF;
	SET i = i + 1;
  END WHILE;
 END //
DELIMITER ;

-- Вызов процедуры:
CALL divisibility_of_numbers();

SELECT * FROM numbers;