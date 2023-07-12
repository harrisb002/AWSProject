USE bharris_AWS;

CREATE OR REPLACE VIEW Display_Services AS
(SELECT DISTINCT services 
FROM CloudComputing) 
UNION 
(SELECT DISTINCT services
FROM Storage);

