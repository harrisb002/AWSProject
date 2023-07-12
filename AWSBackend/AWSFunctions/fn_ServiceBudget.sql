USE bharris_cs355fa21;

DELIMITER //
CREATE OR REPLACE FUNCTION fn_ServiceBudget 
(
   ClientID INT,
   ServiceID INT
)

RETURNS DECIMAL (10,2) UNSIGNED
BEGIN
    DECLARE totalDue DECIMAL (10,2) UNSIGNED;
    DECLARE serviceCost DECIMAL (10,2) UNSIGNED;
    DECLARE repoName VARCHAR (75);
    DECLARE repoCost DECIMAL (5,2) UNSIGNED;
    
	SELECT fn_compCost(ServiceID) + fn_storageCost(ServiceID) 
	INTO serviceCost;	
	IF serviceCost IS NULL THEN
            	SET serviceCost = 0;
	END IF;

	SELECT SUM(fn_repoCost(gr.RepoName))
	INTO repoCost
       	FROM Client AS c 
	JOIN Client_Repos as cr 
	ON  c.ClientID = cr.ClientID 
	JOIN GitRepos AS gr 
	ON gr.RepoName = cr.RepoName	
	WHERE c.ClientID = ClientID;

	IF repoCost IS NULL THEN
                SET repoCost = 0;
	END IF;

	SET totalDue = serviceCost + repoCost;

	RETURN totalDue;
END //
DELIMITER ;















