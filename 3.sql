CREATE TABLE Employee ( 
E_id INT, 
E_name VARCHAR(50), 
Age INT, 
Salary DECIMAL(10,2) 
);

insert into Employee(E_id, E_name, Age, Salary) values (1, 'John',35,40000),  (2,'Alice',32,35700), 
(3,'Bob',28,28000), (4,'Charles',30,32000);

SELECT COUNT(E_name) AS total_employees 
FROM Employee;

SELECT MAX(Age) AS max_age 
FROM Employee;

SELECT MIN(Age) AS min_age 
FROM Employee;

SELECT Salary 
FROM Employee 
ORDER BY Salary ASC;

insert into Employee values (6, 'Peter',38,40000);

SELECT Salary, COUNT(*) AS num_employees 
FROM Employee 
GROUP BY Salary;
