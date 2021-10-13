/*
Create a database called CityZoo on your SQL Server. 
1. The database will have 2 data files for data storage called CityZoo_Data and 
CityZoo_Data2 and 1 transaction log file called CityZoo_Log. 
1. The first data file should have an initial size of 10 megabytes, grow to a maximum 
size of 50 gigabytes and grow by 25% each time it is required. 
2. The second data file should have an initial size of 5 megabytes, have an unlimited 
maximum size and grow by 25MB each time it is required 
3. The log file should have an initial size of 12 megabytes, grow to a maximum size of 
25 megabytes and grow by 10% each time it is required.
*/ 

USE MASTER
GO

CREATE DATABASE CityZoo
ON
	( NAME = CityZoo_data, 
		FILENAME = 'E:\Certificate in Database Administration\ICT687 Microsoft SQL Server Development Level 1\Lab 1\CityZoo_data.mdf', 
		SIZE = 10MB,
		MAXSIZE = 50GB,
		FILEGROWTH = 25% 
	),
	( NAME = CityZoo_data2,
		FILENAME = 'E:\Certificate in Database Administration\ICT687 Microsoft SQL Server Development Level 1\Lab 1\CityZoo_data2.ndf', 
        SIZE = 5MB,
		MAXSIZE = UNLIMITED,
		FILEGROWTH = 25MB 
	)	
	LOG ON 
	( NAME = CityZoo_log,
		FILENAME = 'E:\Certificate in Database Administration\ICT687 Microsoft SQL Server Development Level 1\Lab 1\CityZoo_log.ldf',
		SIZE = 12MB,
		MAXSIZE = 25MB,
		FILEGROWTH = 10%
	);

--Execute the query to create the database.
sp_helpdb 'CityZoo'
--Add a third data file to the database with a name of CityZoo_Data3 which has a 2 megabyte initial size, a maximum size of 100 megabytes and grow by 5MB each time it is required. 

ALTER DATABASE CityZoo
	ADD FILE ( NAME = CityZoo_data3, 
		FILENAME = 'E:\Certificate in Database Administration\ICT687 Microsoft SQL Server Development Level 1\Lab 1\CityZoo_Data3.ndf',
		SIZE = 2MB,
		MAXSIZE = 100MB,
		FILEGROWTH = 5MB
   );
sp_helpdb 'CityZoo'
--Alter the transaction log file created in step 1.a.iii to have a maximum size of 50 megabytes instead. 

ALTER DATABASE CityZoo
  MODIFY FILE ( NAME = CityZoo_log, MAXSIZE  = 50MB);

sp_helpdb 'CityZoo'

--Delete the data file you created in step 3 from the database. 
ALTER DATABASE CityZoo
  REMOVE FILE CityZoo_data3;
  
sp_helpdb 'CityZoo'

-- Add a second transaction log file to the database with a name of CityZoo_Log2 which has a 14 megabyte initial size, a maximum size of 350 megabytes and grows by 30% each time it is required. 
ALTER DATABASE CityZoo
ADD LOG FILE ( NAME = CityZoo_log2, FILENAME = 'E:\Certificate in Database Administration\ICT687 Microsoft SQL Server Development Level 1\Lab 1\CityZoo_log2.ldf',
  SIZE = 14MB,
  MAXSIZE = 350MB,
  FILEGROWTH = 30%);

sp_helpdb 'CityZoo'

--Change the recovery model of the database to the Simple recovery mode

ALTER DATABASE CityZoo
SET RECOVERY SIMPLE 

sp_helpdb 'CityZoo'