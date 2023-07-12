USE bharris_AWS;

CREATE OR REPLACE VIEW Display_Repositories AS
SELECT 
name AS 'Client Name', 
COUNT(c.RepoName) AS 'Number of Repositories',
SUM(fileSize)AS 'Storage Alloted for Repositories (gb)' 
FROM Client_Repos AS cr 
JOIN GitRepos AS c 
ON c.RepoName = cr.RepoName
JOIN Client AS cl
ON cl.ClientID = cr. ClientID
GROUP BY name;





