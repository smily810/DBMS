CREATE TABLE Employee ( 
E_id INT PRIMARY KEY, 
E_name VARCHAR(255), 
Age INT, 
Salary DECIMAL(10, 2) 
);

INSERT INTO Employee (E_id, E_name, Age, Salary) 
VALUES (1, 'Alice', 30, 50000),(2, 'Bob', 28, 48000), (3, 'Charlie', 25, 45000); 

DELIMITER // 
CREATE PROCEDURE your_procedure_name() 
BEGIN 
SELECT * FROM your_table_name; 
END // 
DELIMITER ; 


BEGIN -- Declare variables to hold employee data 
DECLARE v_E_id INT; 
DECLARE v_E_name VARCHAR(100); 
DECLARE v_Age INT; 
DECLARE v_Salary DECIMAL(10,2); -- Variable to control cursor loop 
DECLARE done INT DEFAULT 0; -- Declare a cursor for the Employee table 
DECLARE employee_cursor CURSOR FOR 
SELECT E_id, E_name, Age, Salary FROM Employee; -- Declare a handler to handle the end of the cursor 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; -- Open the cursor 
OPEN employee_cursor; -- Fetch the data from the cursor 
read_loop: LOOP 
FETCH employee_cursor INTO v_E_id, v_E_name, v_Age, v_Salary; 
IF done THEN 
LEAVE read_loop; 
END IF;
-- Do something with the fetched data -- Here we will just select it to display 
SELECT v_E_id, v_E_name, v_Age, v_Salary; 
END LOOP read_loop; -- Close the cursor 
CLOSE employee_cursor; 
END 
Call the stored procedure: 
CALL ExtractEmployeeData();
