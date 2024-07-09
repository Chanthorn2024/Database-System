/*
+MySQL Sample Databases For learning 
 MySQL's Sample <Employees management> Database
 Reference: MySQL's Sample Employees Database @ http://dev.mysql.com/doc/employee/en/index.html.
 This is a rather simple database with 6 tables but with millions of records.
*/
# Create database <employee management> :
  CREATE DATABASE Employee_Managament;
  USE Employee_Managament; #Run This Statement for SELECT this Database
  
  # 1- CREATE TABLE employee
  CREATE TABLE employees (
    emp_no      INT             NOT NULL,  -- UNSIGNED AUTO_INCREMENT??
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,  -- Enumeration of either 'M' or 'F'  
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no)                   -- Index built automatically on primary-key column
                                           -- INDEX (first_name)
                                           -- INDEX (last_name)
);

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,  -- in the form of 'dxxx'
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),                 -- Index built automatically
    UNIQUE  KEY (dept_name)                -- Build INDEX on this unique-value column
);

CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    KEY         (emp_no),   -- Build INDEX on this non-unique-value column
    KEY         (dept_no),  -- Build INDEX on this non-unique-value column
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
           -- Cascade DELETE from parent table 'employee' to this child table
           -- If an emp_no is deleted from parent 'employee', all records
           --  involving this emp_no in this child table are also deleted
           -- ON UPDATE CASCADE??
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
           -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, dept_no)
           -- Might not be unique?? Need to include from_date
);

CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
                                  -- ON UPDATE CASCADE??
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no, dept_no)  -- might not be unique?? Need from_date
);

CREATE TABLE titles (
    emp_no      INT          NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    from_date   DATE         NOT NULL,
    to_date     DATE,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
                         -- ON UPDATE CASCADE??
    PRIMARY KEY (emp_no, title, from_date)
       -- This ensures unique combination. 
       -- An employee may hold the same title but at different period
);

CREATE TABLE salaries (
    emp_no      INT    NOT NULL,
    salary      INT    NOT NULL,
    from_date   DATE   NOT NULL,
    to_date     DATE   NOT NULL,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);







/*
+SQL Tutorial : SQL is a standard language for storing, manipulating and retrieving 
			   data in databases.Our SQL tutorial will teach you how to use SQL in: 
               MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, 
               and other database systems.
+Introduction to SQL: SQL is a standard language for accessing and manipulating databases.

+What is SQL?
	-SQL stands for Structured Query Language
	-SQL lets you access and manipulate databases
	-SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standardization (ISO) in 1987

+What Can SQL do?
		SQL can execute queries against a database
		SQL can retrieve data from a database
		SQL can insert records in a database
		SQL can update records in a database
		SQL can delete records from a database
		SQL can create new databases
		SQL can create new tables in a database
		SQL can create stored procedures in a database
		SQL can create views in a database
		SQL can set permissions on tables, procedures, and views
		SQL is a Standard - BUT....
		Although SQL is an ANSI/ISO standard, there are different versions of the SQL language.

		However, to be compliant with the ANSI standard, they all support at least the major 
        commands (such as SELECT, UPDATE, DELETE, INSERT, WHERE) in a similar manner.

		***Note: Most of the SQL database programs also have their own proprietary extensions 
			     in addition to the SQL standard!


*/








