USE bharris_AWS;

DROP TABLE IF EXISTS Client_Email;
DROP TABLE IF EXISTS Client_Repos;
DROP TABLE IF EXISTS Client_Service;
DROP TABLE IF EXISTS GitRepos;
DROP TABLE IF EXISTS Storage;
DROP TABLE IF EXISTS CloudComputing;
DROP TABLE IF EXISTS ServiceType;
DROP TABLE IF EXISTS Client;

CREATE TABLE Client
(
	ClientID INT PRIMARY KEY,
	name varchar(50) NOT NULL,
	cardInfo char(4) NOT NULL, 
	customerSince TIMESTAMP
);

CREATE TABLE ServiceType 
(
	ServiceID INT PRIMARY KEY, 
	IaaS BOOL, 
	PaaS BOOL, 
	SaaS BOOL
);

CREATE TABLE CloudComputing 
(
	ComputingID INT AUTO_INCREMENT PRIMARY KEY, 
	ServiceID INT NOT NULL, 
	services varchar(50), 
	cost INT, 
	FOREIGN KEY (ServiceID) REFERENCES ServiceType(ServiceID) 
	ON UPDATE CASCADE
);

CREATE TABLE Storage 
(
	StorageID INT PRIMARY KEY AUTO_INCREMENT, 
	ServiceID INT NOT NULL, 
	services varchar(50), 
	cost INT,
       	FOREIGN KEY (ServiceID) REFERENCES ServiceType(ServiceID) 
	ON UPDATE CASCADE 
);

CREATE TABLE GitRepos 
(
	RepoName varchar(75) PRIMARY KEY, 
	fileSize INT, 
	dateCreated TIMESTAMP
);

CREATE TABLE Client_Service 
(
	ClientID INT, 
	ServiceID INT, 
	PRIMARY KEY (ClientID, ServiceID), FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON UPDATE CASCADE ON DELETE CASCADE, 
	FOREIGN KEY (ServiceID) REFERENCES ServiceType(ServiceID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Client_Repos 
(
	ClientID INT, 
	RepoName varchar(75), 
	PRIMARY KEY (ClientID, RepoName), FOREIGN KEY (ClientID) REFERENCES Client(ClientID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (RepoName) REFERENCES GitRepos (RepoName) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE Client_Email 
(
	ClientID INT, 
	Email varchar(50),
	PRIMARY KEY (Email), FOREIGN KEY (ClientID) 
	REFERENCES Client(ClientID) ON UPDATE CASCADE

);





																																		


















