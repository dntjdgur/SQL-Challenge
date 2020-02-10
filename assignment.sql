CREATE TABLE Employees (
    emp_no INT NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender INT NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT PK_Employees PRIMARY KEY (emp_no)
);

CREATE TABLE Departments (
    dept_no VARCHAR(30) NOT NULL REFERENCES Dept_manager (dept_no),
    dept_name VARCHAR(30) NOT NULL
);

CREATE TABLE Title (
    emp_no INT NOT NULL REFERENCES Employees (emp_no),
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL REFERENCES Employees (emp_no),
    title VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

CREATE TABLE Dept_manager (
    id SERIAL NOT NULL,
    dept_no VARCHAR(30) NOT NULL,
    emp_no INT NOT NULL REFERENCES Employees (emp_no),
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
    CONSTRAINT PK_Dept_manager PRIMARY KEY (dept_no)
);

CREATE TABLE Dept_emp (
    emp_no INT NOT NULL REFERENCES Employees (emp_no),
    dept_no VARCHAR(30) NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL
);

DROP TABLE Employees;
DROP TABLE Departments;
DROP TABLE Dept_emp;
DROP TABLE Dept_manager;
DROP TABLE Salaries;
DROP TABLE Title;



ALTER TABLE Employees ADD CONSTRAINT FK_Employees_emp_no FOREIGN KEY (emp_no) REFERENCES Dept_emp (emp_no);

ALTER TABLE Departments ADD CONSTRAINT FK_Departments_dept_no FOREIGN KEY(dept_no) REFERENCES Dept_manager (dept_no);

ALTER TABLE Title ADD CONSTRAINT FK_Title_emp_no FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

ALTER TABLE Salaries ADD CONSTRAINT FK_Salaries_emp_no FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

ALTER TABLE Dept_manager ADD CONSTRAINT FK_Dept_manager_emp_no FOREIGN KEY(emp_no) REFERENCES Employees (emp_no);

