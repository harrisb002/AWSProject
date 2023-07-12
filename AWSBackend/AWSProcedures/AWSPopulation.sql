USE bharris_AWS;

INSERT INTO  Client (ClientID, name, cardInfo)
VALUES (12345, 'Benjamin Harris', '9846'),
(23456, 'KrustyCrab Enterprises', '7654'),
(34567, 'PlasticsUnited', '5647'),
(45678, 'Sarah Prestley', '1134'),
(56789, 'SonomaState', '4231'),
(11111, 'Costco', '0394'),
(22222, 'Tesla', '2038'),
(33333, 'FarmersUnited', '0429'),
(44444, 'VA Hospital', '1693'),
(55555, 'ChicoState', '3720');

INSERT INTO ServiceType (ServiceID, IaaS, PaaS, SaaS)
VALUES (54321, True, False, False),
(65432, True, True, True),
(76543, True, True, True),
(87654, True, True, False),
(98765, True, False, False),
(14231, True, False, False),
(21424, True, True, False),
(31423, True, True, True),
(42423, True, True, True),
(54234, True, False, False);

INSERT INTO Client_Service (ServiceID, ClientID)
VALUES (98765, 12345),
(87654, 23456),
(76543, 34567),
(65432, 45678),
(54321, 56789),
(14231, 11111),
(21424, 22222),
(31423, 33333),
(42423, 44444),
(54234, 55555);

INSERT INTO Storage (ServiceID, cost, services)
VALUES (98765, 50000, 'Amazon Storage Service'),
(87654, 2000, 'Amazon Glacier'),
(76543, 10000, 'Amazon Elastic File System'),
(42423, 30000, 'Amazon Elastic Block Store'),
(65432, 1500, 'Amazon Storage Gateway'),
(14231, 2000, 'Amazon Glacier'),
(21424, 10000, 'Amazon Elastic File System'),
(31423, 1500, 'Amazon Storage Gateway');

INSERT INTO CloudComputing (ServiceID, cost, services)
VALUES (98765, 40000, 'Amazon EC2 - Virtual Servers'),
(87654, 25000, 'Amazon Lightsail - Manage Servers'),
(65432, 30000, 'Amazon VMware Cloud'),
(54234, 15000, 'AWS Batch'),
(21424, 10000, 'Amazon Lamba'),
(42423, 30000, 'Amazon VMware Cloud'),
(31423, 15000, 'AWS Batch');

INSERT INTO GitRepos (RepoName, fileSize)
VALUES ('Aerospace-Modules', 32),
('Recursive-Modules', 45),
('Menu-Modules', 20),
('Krabby-Patty-Modules', 100),
('Plastics-Tech-Project', 10),
('Budget-Module', 75),
('Aerospace-Tactics', 40),
('Aeronautics-Exploration', 75),
 ('StockerRates', 100),
('MechanicalEng', 250),
('PoatoesMaturity', 423),
('BenifitsLog', 390),
 ('PatientHistorys', 50),
('DiseasesControl', 300);

INSERT INTO Client_Email (ClientID, Email)
VALUES (12345, 'taylorSeries@mheducation.com'),
 (12345, 'harrisb@gmail.com'),
(23456, 'crabsaplenty@AOL.com' ),
(34567,  'PlasticWorld@platics.org'),
(45678, 'sarahp@gmail.com'),
(45678, 'abuelita@yahoo.com'),
(56789, 'Scholarships@sonoma.edu'),
(56789, 'SonomaState@sonoma.edu'),
(11111,  'Feedingeverything@costo.com'),
(22222, 'WonderingExcitment@gmail.com'),
(33333, 'FeedTheWorld@yahoo.com'),
(44444, 'CareForVeterans@health.org'),
(55555, 'Blackboard@chico.edu');

INSERT INTO Client_Repos (ClientID, RepoName)
VALUES (12345, 'Recursive-Modules'),
(12345, 'Aerospace-Tactics'),
(12345, 'Aeronautics-Exploration'),
(23456, 'Krabby-Patty-Modules'),
(56789, 'Budget-Module'),
(23456, 'Menu-Modules'),
(11111, 'StockerRates'),
(22222, 'MechanicalEng'),
(33333, 'PoatoesMaturity'),
(44444, 'BenifitsLog'),
(44444, 'PatientHistorys'),
(44444, 'DiseasesControl');

