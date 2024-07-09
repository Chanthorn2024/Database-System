# Create the database
CREATE DATABASE project_managements;

USE project_managements;
# Create the PROJECT table
CREATE TABLE PROJECT (
    PROJ_NUM INT PRIMARY KEY,
    PROJ_NAME VARCHAR(255) NOT NULL
);

-- Create the JOB table
USE project_managements;
CREATE TABLE JOB (
    JOB_CLASS VARCHAR(50) PRIMARY KEY,
    CHG_HOUR DECIMAL(10, 2) NOT NULL
);

# Create the EMPLOYEE table
USE project_managements;
CREATE TABLE EMPLOYEE (
    EMP_NUM INT PRIMARY KEY,
    EMP_NAME VARCHAR(255) NOT NULL,
    JOB_CLASS VARCHAR(50) NOT NULL,
    CONSTRAINT FK_JOB_CLASS FOREIGN KEY (JOB_CLASS) REFERENCES JOB(JOB_CLASS)
);



-- Create the ASSIGNMENT table
USE project_managements;
CREATE TABLE ASSIGNMENT (
    PROJ_NUM INT,
    EMP_NUM INT,
    ASSIGN_HOURS DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (PROJ_NUM, EMP_NUM),
    FOREIGN KEY (PROJ_NUM) REFERENCES PROJECT(PROJ_NUM),
    FOREIGN KEY (EMP_NUM) REFERENCES EMPLOYEE(EMP_NUM)
);





# Insert into Data to TABLE

USE project_managements;
INSERT INTO PROJECT (PROJ_NUM, PROJ_NAME)
VALUES
 (15, 'Evergreen'),
(18, 'Amber Wave'),
(22, 'Rolling Tide'),
(25, 'Starflight');

USE project_managements;
INSERT INTO JOB (JOB_CLASS, CHG_HOUR)
VALUES
    ('Application Designer',48.10 ),
    ('Clerical Support', 26.87),
    ('database designer', 105.00),
    ('DSS Analyst', 45.95),
    ('Elec.Engineer', 85.50),
    ('General Support', 18.36),
    ('Programmer', 37.75),
    ('System Analyst', 96.75);

USE project_managements;
INSERT INTO EMPLOYEE (EMP_NUM, EMP_NAME, JOB_CLASS)
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

USE project_managements;
INSERT INTO ASSIGNMENT (PROJ_NUM,EMP_NUM, ASSIGN_HOURS)
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



# DROP TABLE ASSIGNMENT;

# SELECT * FROM project_managements.assignment;




# Create foreign key relationship between EMPLOYEE and JOB tables

# ALTER TABLE EMPLOYEE
# ADD CONSTRAINT FK_JOB_CLASS FOREIGN KEY (JOB_CLASS) REFERENCES JOB(JOB_CLASS);