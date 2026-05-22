CREATE TABLE CUSTOMERS ( 
ID INT PRIMARY KEY, 
NAME VARCHAR(50), 
AGE INT, 
ADDRESS VARCHAR(100), 
SALARY DECIMAL(10, 2) 
);

CREATE TABLE customers_audit ( 
id INT AUTO_INCREMENT PRIMARY KEY, 
operation VARCHAR(10), 
customer_id INT, 
old_salary DECIMAL(10,2), 
new_salary DECIMAL(10,2), 
salary_difference DECIMAL(10,2), 
operation_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

DELIMITER // 
CREATE TRIGGER trg_customers_insert 
AFTER INSERT ON CUSTOMERS 
FOR EACH ROW 
BEGIN 
INSERT INTO customers_audit (operation, customer_id, new_salary) 
VALUES ('INSERT', NEW.ID, NEW.SALARY); 
END// 
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_customers_update 
AFTER UPDATE ON CUSTOMERS 
FOR EACH ROW 
BEGIN 
DECLARE v_salary_diff DECIMAL(10,2); 
SET v_salary_diff = NEW.SALARY - OLD.SALARY; 
INSERT INTO customers_audit (operation, customer_id, old_salary, new_salary, 
salary_difference) 
VALUES ('UPDATE', NEW.ID, OLD.SALARY, NEW.SALARY, v_salary_diff); 
END// 
DELIMITER ;

DELIMITER // 
CREATE TRIGGER trg_customers_delete 
AFTER DELETE ON CUSTOMERS 
FOR EACH ROW 
BEGIN 
INSERT INTO customers_audit (operation, customer_id, old_salary) 
VALUES ('DELETE', OLD.ID, OLD.SALARY); 
END// 
DELIMITER ;

insert into CUSTOMERS (ID,NAME,AGE,ADDRESS,SALARY) values (1,’Peter’,35, ‘2nd cross 
vijaynagar’, 100000), (2,’Jhew’,42, ‘Dollars Colony’, 92000), (3,’Pinto’,26, ‘RR Nagar’, 45000);

3 rows inserted 
SELECT * FROM `customers`;

Checking the trigger on insert operation, created by displaying the customers_audit table 
SELECT * FROM customers_audit 

Updating the salary of an employee with id 2  
update customers set salary = 150000 where id = 2; 
SELECT * FROM customers;


Checking the trigger on update operation, created by displaying the customers_audit table 
SELECT * FROM customers_audit;

Delete a row with id 1 
delete from customers where id=1 
Output: 
1 row deleted. (Query took 0.1224 seconds.) 
Checking the trigger on delete operation, created by displaying the customers_audit table 
SELECT * FROM `customers_audit` 
