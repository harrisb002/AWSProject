USE bharris_AWS;
DELIMITER //
CREATE OR REPLACE FUNCTION fn_storageCost 
(
    ServiceID INT
)
RETURNS DECIMAL (10,2) UNSIGNED
BEGIN
DECLARE storageCost DECIMAL (10,2) UNSIGNED;

	SELECT SUM(s.cost)
	INTO storageCost
	FROM Storage AS s
	WHERE s.ServiceID = ServiceID;
	IF storageCost IS NULL THEN
	   SET storageCost = 0;
	END IF;

RETURN storageCost;
END //
DELIMITER ;

