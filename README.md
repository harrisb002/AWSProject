##AWS Databse

The Purpose of this Database is to provide an example of a smallscale implementation for Amazon Web Services. The database will track each Clients username, card info, email, service costs and unique ID. The database will also track repositories made by cliental. Each client may create zero or more Git-Repositories; however, a repository must be created by a client. Repositories may be created by multiple clients and are not required have unique names and therefore must be tied to the client(s) that create it. The database will track the repositories name, date of creation and the size of the file. Every client must pay for one or more services while every service does not need to be tied to every client. The database will track the types of services paid for as Iaas, Paas, and Saas. The clients purchase will be tracked using a unique serviceID. The database will also track the date in which the person or corporation became a client as customerSince. The database will track the storage power and computing power paid for by the client. Storage power and computing power must be paid for as part of one of the types of services: Iaas, Paas, and Saas. The client may purchase zero or more types of storage or computing power services. The database will use a StorageID and CloudComputingID to track each of the services paid for by the client for storage power and computing power separately.
 storage power and computing power separately. 
