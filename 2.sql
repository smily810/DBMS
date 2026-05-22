CREATE TABLE Employee ( 
EMPNO INT, 
ENAME VARCHAR(50), 
JOB VARCHAR(50), 
MGR INT, 
SAL DECIMAL(10,2) 
); 
desc Employee 

ALTER TABLE Employee 
ADD COMMISSION DECIMAL(10,2);

INSERT INTO Employee (EMPNO, ENAME, JOB, MGR, SAL) VALUES (101, 'John Doe',   
'Manager', NULL, 5000.00), (102, 'Jane Smith', 'Assistant', 101, 3000.00), (103, 'Michael 
Johnson', 'Clerk', 102, 2000.00), (104, 'Emily Brown', 'Manager', NULL, 5500.00), (105, 'Alex 
Clark', 'Assistant', 104, 3200.00);

UPDATE Employee 
SET JOB = 'Supervisor' 
WHERE EMPNO = 105; 

ALTER TABLE Employee 
CHANGE COLUMN Empno Empno2 VARCHAR(50);

DELETE FROM Employee 
WHERE EMPNO2 = 105; 
Select * from Employee
