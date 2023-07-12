USE bharris_AWS;

CREATE OR REPLACE VIEW Cliental_Portfolio AS

SELECT
cs.ClientID,
fn_compCost(ServiceID) AS 'Computing Cost',
fn_storageCost(ServiceID) AS 'Storage Cost',
SUM(fn_repoCost(RepoName)) AS 'Repository Storage Cost',
fn_serviceBudget(cs.ClientID, ServiceID) AS 'Total Due'
FROM Client_Service AS cs
LEFT JOIN Client_Repos AS cr
ON cs.ClientID = cr.ClientID
GROUP BY cs.ClientID;

