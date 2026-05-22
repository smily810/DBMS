--Creation of Tables: 

CREATE TABLE N_RollCall ( 
student_id INT, 
rollcall_date DATE, 
status VARCHAR(10), 
PRIMARY KEY (student_id, rollcall_date) 
); 
CREATE TABLE O_RollCall ( 
student_id INT, 
rollcall_date DATE, 
status VARCHAR(10), 
PRIMARY KEY (student_id, rollcall_date) 
);

-- Insert sample data into N_RollCall 
INSERT INTO N_RollCall (student_id, rollcall_date, status) VALUES 
(1, '2024-06-25', 'Present'), 
(2, '2024-06-25', 'Absent'), 
(3, '2024-06-25', 'Present'); -- Insert sample data into O_RollCall 
INSERT INTO O_RollCall (student_id, rollcall_date, status) VALUES 
(1, '2024-06-25', 'Present'); 


Creation of Procedure 
DELIMITER $$ 
CREATE PROCEDURE merge_rollcall() 
BEGIN 
DECLARE done INT DEFAULT 0; 
DECLARE v_student_id INT; 
DECLARE v_rollcall_date DATE; 
DECLARE v_status VARCHAR(10); -- Declare a cursor to select data from N_RollCall 
DECLARE cur_n_rollcall CURSOR FOR 
SELECT student_id, rollcall_date, status FROM N_RollCall; -- Declare a continue handler for cursor 
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1; -- Open the cursor 
OPEN cur_n_rollcall; -- Loop through each row in N_RollCall 
read_loop: LOOP 
FETCH cur_n_rollcall INTO v_student_id, v_rollcall_date, v_status; 
IF done THEN 
LEAVE read_loop; 
END IF; -- Check if the record already exists in O_RollCall 
IF NOT EXISTS ( 
SELECT 1 FROM O_RollCall  
WHERE student_id = v_student_id  
AND rollcall_date = v_rollcall_date 
) THEN 
-- Insert the record into O_RollCall 
INSERT INTO O_RollCall (student_id, rollcall_date, status) 
VALUES (v_student_id, v_rollcall_date, v_status); 
END IF; 
END LOOP; -- Close the cursor 
CLOSE cur_n_rollcall; 
END$$ 
DELIMITER ;
