USE bharris_AWS;
DELIMITER //
CREATE OR REPLACE FUNCTION fn_compCost 
(
	ServiceID INT
)
RETURNS DECIMAL (10,2) UNSIGNED
BEGIN
	DECLARE compCost DECIMAL (10,2) UNSIGNED;
	
	SELECT SUM(cc.cost)
        INTO compCost
        FROM CloudComputing AS cc
        WHERE cc.ServiceID = ServiceID;
        IF compCost IS NULL THEN
                SET compCost = 0;
        END IF;

RETURN compCost;
END //
DELIMITER ;

