DROP FUNCTION IF EXISTS converter_seconds;
DELIMITER //
CREATE FUNCTION converter_seconds(seconds BIGINT)
RETURNS char(50)
DETERMINISTIC
BEGIN
	DECLARE day_in_seconds INT; 
	DECLARE amount_of_days INT;
    DECLARE number_of_hours INT;
    DECLARE number_of_minutes INT;
    DECLARE number_of_seconds INT;
    DECLARE result CHAR(50);
    SET amount_of_days =  FLOOR(seconds/86400);
    SET number_of_hours  = floor(seconds mod 86400)/3600;
    SET number_of_minutes = floor(((seconds mod 86400)mod 3600)/60);
	SET number_of_seconds = floor(((seconds mod 86400)mod 3600) mod 60);
	SET result = concat(amount_of_days,' ' 'days' ' ',number_of_hours,' ' 'hours' ' ',number_of_minutes,' ' 'minutes' ' ',number_of_seconds,' ' 'seconds'' ');
RETURN result;
END//
DELIMITER ;

SELECT converter_seconds(36987452);