CREATE TABLE Titles (
	TitleID VARCHAR(10) PRIMARY KEY,
	Title VARCHAR(50)	
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
	TitleID VARCHAR(10),
	Birthdate DATE NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	Sex VARCHAR(2),
    HireDate DATE NOT NULL,
	FOREIGN KEY (TitleID) REFERENCES Titles(TitleID)
);

CREATE TABLE Departments (
	DeptID VARCHAR(10) PRIMARY KEY,
	Department VARCHAR(50)	
);

CREATE TABLE DeptManagers (
	DeptID VARCHAR(10),
	EmployeeID INT,
	FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE EmpDepartments (
	DeptID VARCHAR(10),
	EmployeeID INT,	
	FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
-- The above table gave me issues when I tried to import the CSV because the columns were switched

CREATE TABLE Salaries (	
	EmployeeID INT,
	Salary INT,
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)	
);

--Created new table to fix issue
CREATE TABLE DeptEmployees (	
	EmployeeID INT,	
	DeptID VARCHAR(10),
	FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

DROP TABLE EmpDepartments;