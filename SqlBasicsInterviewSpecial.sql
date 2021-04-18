CREATE TABLE Worker (
	WORKER_ID INT NOT NULL IDENTITY    PRIMARY KEY,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

INSERT INTO Worker 
	( FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		('Monika', 'Arora', 100000, '20120618 10:34:09 AM', 'HR'),
		('Niharika', 'Verma', 80000, '20110618 10:34:09 AM', 'Admin'),
		('Vishal', 'Singhal', 300000, '20150318 10:34:09 AM', 'HR'),
		('Amitabh', 'Singh', 500000, '20160615 10:34:09 AM', 'Admin'),
		('Vivek', 'Bhati', 500000, '20140614 10:34:09 AM', 'Admin'),
		('Vipul', 'Diwan', 200000, '20120618 09:34:09 PM', 'Account'),
		('Satish', 'Kumar', 75000, '20130618 10:34:09 AM', 'Account'),
		('Geetika', 'Chauhan', 90000, '20120618 05:34:09 AM', 'Admin');

		commit;

		select * from dbo.Worker;

		CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(3, 5000, '20200216 10:34:09 AM'),
		(4, 3000, '20110616 10:34:09 AM'),
		(5, 4000, '20200216 10:34:09 AM'),
		(10, 4500, '20200216 10:34:09 AM'),
		(9, 3500, '20110616 10:34:09 AM');


		CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);


INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (3, 'Manager', '20200216 10:34:09 AM'),
 (4, 'Executive', '20110616 10:34:09 AM'),
 (8, 'Executive', '20110616 10:34:09 AM'),
 (5, 'Manager', '20110616 10:34:09 AM'),
 (4, 'Asst. Manager', '20110616 10:34:09 AM'),
 (7, 'Executive', '20110616 10:34:09 AM'),
 (6, 'Lead', '20110616 10:34:09 AM'),
 (9, 'Lead', '20110616 10:34:09 AM');

 Select First_name as worker_name from Worker;

 --nth highest salary 

 select * from worker order by salary desc;

 --1st Solution
 Select * from worker m where 2 = (Select count( distinct a.SALARY) from worker a where a.SALARY>=m.SALARY);

 --2nd Solution
 Select distinct(Salary) , FIRST_NAME from worker a order by salary desc  OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY; 

 --3rd Solotuin DENSE_RANK() AND ROW_NUMBER()

 Select * from
 (Select a.*, DENSE_RANk() OVER(order by salary desc) AS rownum from worker a ) As A where A.rownum = 2;