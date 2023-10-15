-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT E.EmployeeID, E.LastName, E.FirstName, E.Sex, S.Salary
FROM Employees E
INNER JOIN Salaries S ON E.EmployeeID = S.EmployeeID;

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT FirstName, LastName, HireDate
FROM Employees
WHERE EXTRACT(YEAR FROM HireDate) = 1986;

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT D.DeptID, D.Department, E.EmployeeID, E.LastName, E.FirstName
FROM Departments D
INNER JOIN DeptManagers DM ON D.DeptID = DM.DeptID
INNER JOIN Employees E ON DM.EmployeeID = E.EmployeeID;

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT E.EmployeeID, E.LastName, E.FirstName, D.DeptID, D.Department
FROM Departments D
INNER JOIN DeptEmployees DE ON D.DeptID = DE.DeptID
INNER JOIN Employees E ON DE.EmployeeID = E.EmployeeID;


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT FirstName, LastName, Sex
FROM Employees
WHERE FirstName = 'Hercules' AND LastName LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
SELECT E.EmployeeID, E.LastName, E.FirstName
FROM Employees E
INNER JOIN DeptEmployees DE ON E.EmployeeID = DE.EmployeeID
INNER JOIN Departments D ON DE.DeptID = D.DeptID
WHERE D.Department = 'Sales';

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT E.EmployeeID, E.LastName, E.FirstName, D.Department
FROM Employees E
INNER JOIN DeptEmployees DE ON E.EmployeeID = DE.EmployeeID
INNER JOIN Departments D ON DE.DeptID = D.DeptID
WHERE D.Department IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT LastName, COUNT(*)
FROM Employees
GROUP BY LastName
ORDER BY COUNT(*) DESC, LastName;