-- Drop the PETRESCUE table in case it exists
drop table PETRESCUE;
-- Create the PETRESCUE table 
create table PETRESCUE (
	ID INTEGER PRIMARY KEY NOT NULL,
	ANIMAL VARCHAR(20),
	QUANTITY INTEGER,
	COST DECIMAL(6,2),
	RESCUEDATE DATE
	);
-- Insert sample data into PETRESCUE table
insert into PETRESCUE values 
	(1,'Cat',9,450.09,'2018-05-29'),
	(2,'Dog',3,666.66,'2018-06-01'),
	(3,'Dog',1,100.00,'2018-06-04'),
	(4,'Parrot',2,50.00,'2018-06-04'),
	(5,'Dog',1,75.75,'2018-06-10'),
	(6,'Hamster',6,60.60,'2018-06-11'),
	(7,'Cat',1,44.44,'2018-06-11'),
	(8,'Goldfish',24,48.48,'2018-06-14'),
	(9,'Dog',2,222.22,'2018-06-15')
	
;

--Query A1: Enter a function that calculates the total cost of all animal rescues in the PETRESCUE table.

SELECT SUM(COST) from PETRESCUE
;

--Query A2: Enter a function that displays the total cost of all animal rescues in the PETRESCUE table in a column called SUM_OF_COST.

SELECT SUM(COST) as SUM_OF_COST from PETRESCUE
;

--Query A3: Enter a function that displays the maximum quantity of animals rescued.

SELECT MAX(QUANTITY) from PETRESCUE
;

--Query A4: Enter a function that displays the average cost of animals rescued.

SELECT AVG(COST) from PETRESCUE
;

--Query A5: Enter a function that displays the average cost of rescuing a dog.

SELECT AVG(COST/QUANTITY) from PETRESCUE
where ANIMAL = 'Dog'
;

--Query C1: Enter a function that displays the day of the month when cats have been rescued.

SELECT DAY(RESCUEDATE) from PETRESCUE
where ANIMAL='Cat'
;
--Query C2: Enter a function that displays the number of rescues on the 5th day of the month.

SELECT COUNT(*) from PETRESCUE
where DAY(RESCUEDATE)='05'
;

--Query C3: Animals rescued should see the vet within three days of arrivals. Enter a function that displays the third day from each rescue.

SELECT (RESCUEDATE + 3 DAYS) from PETRESCUE
;
--Query C4: Enter a function that displays the length of time the animals have been rescued; the difference between today’s date and the rescue date.

SELECT (CURRENT_DATE - RESCUEDATE) from PETRESCUE
