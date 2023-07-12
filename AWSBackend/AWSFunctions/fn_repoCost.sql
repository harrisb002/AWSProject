USE bharris_AWS;

DELIMITER //
CREATE OR REPLACE FUNCTION fn_repoCost
(
	RepoName VARCHAR(75)
)
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE repoFee DECIMAL(10,2);

	SELECT fileSize * .5
	INTO repoFee 
	FROM GitRepos AS gs
	WHERE RepoName = gs.RepoName;
	
RETURN repoFee;

END //
DELIMITER ;






