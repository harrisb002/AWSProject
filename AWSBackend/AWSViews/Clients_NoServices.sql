USE bharris_AWS;
CREATE OR REPLACE VIEW Clients_NoServices AS

SELECT
cs.ClientID AS 'ClientID',
cs.ServiceID AS 'ServiceID' 
FROM Client_Service AS cs
GROUP BY cs.ClientID
HAVING fn_compCost(ServiceID) + fn_storageCost(ServiceID)  <= 0;
