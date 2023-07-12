USE bharris_AWS;
DROP PROCEDURE IF EXISTS sp_newClient;
DELIMITER //
CREATE PROCEDURE sp_newClient
(
  IN cID INT,
  IN sID INT,
  IN name VARCHAR (50),
  IN servicePurchased VARCHAR(100),
  IN cardInfo CHAR(4),
  IN email VARCHAR(50)
)


BEGIN

  DECLARE CUSTOM_ERROR CONDITION FOR SQLSTATE '45000';
  DECLARE clientFound BOOLEAN DEFAULT FALSE;
  DECLARE emailFound BOOLEAN DEFAULT FALSE;
  DECLARE serviceIDFound BOOLEAN DEFAULT FALSE;
  DECLARE serviceFound BOOLEAN DEFAULT FALSE;
  DECLARE storageCost DECIMAL (10,2);
  DECLARE compCost DECIMAL (10,2);

  -- Check if clientID  exists
  SET clientFound = (SELECT EXISTS(
    SELECT ClientID
    FROM Client_Service
    WHERE ClientID  = cID
  ));

  IF clientFound THEN
--  SET MESSAGE_TEXT = 'ClientID Unavailable';
   SIGNAL CUSTOM_ERROR
    SET MESSAGE_TEXT = 'ClientID is unavailable';
  END IF;

 -- Make sure the service exists
  SET serviceIDFound = (SELECT EXISTS(
    SELECT ServiceID
    FROM Client_Service
    WHERE ServiceID = sID
  ));

  IF serviceIDFound THEN  
    SIGNAL CUSTOM_ERROR
      SET MESSAGE_TEXT = 'ServiceID is unavailable';
  END IF;

  -- Check to see if the email is in use
  SET emailFound = (SELECT EXISTS(
    SELECT Email
    FROM Client_Email
    WHERE ClientID = cID
  ));

  IF serviceIDFound THEN      
   SIGNAL CUSTOM_ERROR
   SET MESSAGE_TEXT = 'Email is unavailable.';
  END IF;

  -- Create new user
  INSERT INTO Client (ClientID, name, cardInfo) VALUES (cID, name, cardInfo);
  INSERT INTO ServiceType VALUES (sID, TRUE, FALSE, FALSE); 
  INSERT INTO Client_Email VALUES (cID, email);
  INSERT INTO Client_Service VALUES (cID, sID);

 -- Insert Storage and cloudcomputing service data
   -- Make sure the storageID  exists in storage
  SET serviceFound = (SELECT EXISTS(
    SELECT services
    FROM Storage
    WHERE services LIKE servicePurchased
  ));

  IF serviceFound THEN
  SELECT DISTINCT cost
  INTO storageCost
  FROM Storage
  WHERE services LIKE servicePurchased;

  INSERT INTO Storage (ServiceID, services, cost) VALUES (sID, servicePurchased, storageCost);
  END IF;

   -- Make sure the computingID  exists in CloudComputing
  SET serviceFound = (SELECT EXISTS(
    SELECT services
    FROM CloudComputing
    WHERE services LIKE servicePurchased
  ));

  IF serviceFound THEN
  SELECT DISTINCT cost 
  INTO compCost
  FROM CloudComputing
  WHERE services LIKE servicePurchased;

  INSERT INTO CloudComputing (ServiceID, services, cost) VALUES (sID, servicePurchased, compCost);
  END IF; 

END //

DELIMITER ;


