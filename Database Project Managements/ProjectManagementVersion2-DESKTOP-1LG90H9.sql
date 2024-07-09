





# Create the database
CREATE DATABASE project_management;


# Create the PROJECT table
USE project_management;
CREATE TABLE project (
    proj_num INT PRIMARY KEY,
    proj_name VARCHAR(75) NOT NULL
);

-- Create the JOB table
USE project_management;
CREATE TABLE job (
    job_class VARCHAR(50) PRIMARY KEY,
    chg_hour DECIMAL(10, 2) NOT NULL
);

# Create the EMPLOYEE table
USE project_management;
CREATE TABLE employee (
    emp_num INT PRIMARY KEY,
    emp_name VARCHAR(75) NOT NULL,
    job_class VARCHAR(50) NOT NULL,
    CONSTRAINT FK_job_class FOREIGN KEY (job_class) REFERENCES job(job_class)
);



-- Create the ASSIGNMENT table
USE project_management;
CREATE TABLE assignment (
    proj_num INT,
    emp_num INT,
    assign_hours DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (proj_num, emp_num),
    FOREIGN KEY (proj_num) REFERENCES project(proj_num),
    FOREIGN KEY (emp_num) REFERENCES employee(emp_num)
);





# Insert into Data to TABLE

USE project_management;
INSERT INTO project (proj_num, proj_name)
VALUES
 (15, 'Evergreen'),
 (18, 'Amber Wave'),
 (22, 'Rolling Tide'),
 (25, 'Starflight');

USE project_management;
INSERT INTO job(job_class, chg_hour)
VALUES
    ('Application Designer',48.10 ),
    ('Clerical Support', 26.87),
    ('database designer', 105.00),
    ('DSS Analyst', 45.95),
    ('Elec.Engineer', 85.50),
    ('General Support', 18.36),
    ('Programmer', 37.75),
    ('System Analyst', 96.75);

USE project_management;
INSERT INTO employee(emp_num, emp_name, job_class)
VALUES
 (101,'John G. News','database designer'),
 (102,'David H. Senior','System Analyst'),
 (103,'June E. Arbough','Elec.Engineer'),
 (104,'Anne K. Ramoras','System Analyst'),
 (105,'Alice K. Johnson','database designer'),
 (106,'William Smithfield','Programmer'),
 (107,'Maria D. Alonzo','Programmer'),
 (108,'Ralph B. Washington','System Analyst'),
 (111,'Geoff B. Wabash','Clerical Support'),
 (112,'Darlene M. Smithson','DSS Analyst'),
 (113,'Delbert K. Joenbrood','Application Designer'),
 (114,'Annelise Jones','Application Designer'),
 (115,'Travis B.Bawangi','System Analyst'),
 (118,'James J. Fromer','General Support');

USE project_management;
INSERT INTO assignment(proj_num, emp_num, assign_hours)
VALUES
(15,101,19),
(15,102,23),
(15,103,23),
(15,105,35),
(15,106,12),
(18,104,32),
(18,112,45),
(18,114,25),
(18,118,45),

(22,104,48),
(22,105,65),
(22,106,12),
(22,111,22),
(22,113,23),
(25,101,56),
(25,107,25),
(25,108,23),
(25,112,41),
(25,114,33),
(25,115,45),
(25,118,30);
/*


*/
# lesson from RUPP========================================================
SELECT * from employee WHERE emp_num= 111; # SELECT employee has emp_num=11
SELECT * from job WHERE job_class = 'System Analyst'; # SELECT job_class = 'System Analyst'
SELECT * from employee WHERE job_class = 'System Analyst';# SELECT employee has position = 'System Analyst'
SELECT * from job WHERE chg_hour >= 30 AND chg_hour <= 50 ; #1 way
SELECT * from job WHERE chg_hour BETWEEN 37.75 AND 48.10; # 2 way
SELECT * from empl0yee WHERE job_class = 'System Analyst'AND job_class = 'Application Designer';
# DROP TABLE ASSIGNMENT;

# SELECT * FROM project_managements.assignment;

# Create foreign key relationship between EMPLOYEE and JOB tables

# ALTER TABLE EMPLOYEE
# ADD CONSTRAINT FK_JOB_CLASS FOREIGN KEY (JOB_CLASS) REFERENCES JOB(JOB_CLASS);




#==============================[ MySQL SELECT Statement ]================================

	--  SELECT column1, column2,  FROM table_name;
	-- Ex:
     select proj_num from project;
     
    -- SELECT * FROM table_name; 
    -- Ex:
    select * from project;
    
 
 /*
  +MySQL WHERE Clause 
	The WHERE clause is used to filter records.
	It is used to extract only those records that 
    fulfill a specified condition.

    1/ WHERE Syntax:
					SELECT column1, column2, ...
					FROM table_name
					WHERE condition;
                    
	   ********Note: The WHERE clause is not only used in SELECT statements,
				     it is also used in UPDATE, DELETE, etc.!
     
 */
		select * from project where proj_num = 25;
        
/*
	2/ WHERE with MySQL AND, OR and NOT Operators
			The WHERE clause can be combined with AND, OR, and NOT operators.
			The AND and OR operators are used to filter records based on more than one condition:
				-The AND operator displays a record if all the conditions separated by AND are TRUE.
				-The OR operator displays a record if any of the conditions separated by OR is TRUE.
			The NOT operator displays a record if the condition(s) is NOT TRUE.
            
            AND Syntax :
						SELECT column1, column2, ...
						FROM table_name
						WHERE condition1 AND condition2 AND condition3 ...;
			
            OR Syntax :
						SELECT column1, column2, ...
						FROM table_name
						WHERE condition1 OR condition2 OR condition3 ...;
			NOT Syntax
						SELECT column1, column2, ...
						FROM table_name
						WHERE NOT condition;
*/
 
			select  emp_name from employee where emp_num = 101 AND job_class = "database designer";
            select  emp_name from employee where emp_num = 101 OR job_class = "database designer";
            select  * from job where NOT chg_hour = 48.10  ;
            
/**/


















