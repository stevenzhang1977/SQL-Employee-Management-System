-- Creating Tables

CREATE TABLE JobTitle_T
( JobTitleID    NUMBER(4,0)     NOT NULL,
  JobTitleName  VARCHAR(25)     NOT NULL,
  BasePay       VARCHAR(25)     NOT NULL,

CONSTRAINT JobTitleT_PK PRIMARY KEY(JobTitleID)
);

CREATE TABLE Location_T
( LocationID    NUMBER(4,0)       NOT NULL,
  LocationName  VARCHAR(25)       NOT NULL,
  LocationType  VARCHAR(7)       
        CHECK(LocationType IN('Remote', 'Hybrid', 'On-site')),
    
CONSTRAINT LocationT_PK PRIMARY KEY(LocationID)
);

CREATE TABLE Department_T
( DepartmentID      NUMBER(4,0)  NOT NULL,
  DepartmentName    VARCHAR(25)  NOT NULL,
  LocationID        NUMBER(4,0)  NOT NULL,

CONSTRAINT DepartmentT_PK PRIMARY KEY(DepartmentID),
CONSTRAINT DepartmentT_FK FOREIGN KEY(LocationID) REFERENCES Location_T(LocationID)
);

CREATE TABLE Employee_T
( EmployeeID                NUMBER(4,0)  NOT NULL,
  EmployeeName              VARCHAR(25)  NOT NULL,
  EmployeeDOB               DATE         NOT NULL,
  Employee_Phone_Number     NUMBER(10,0) NOT NULL,
  EmployeeStreet            VARCHAR(25)  NOT NULL,
  EmployeeCity              VARCHAR(25)  NOT NULL,
  EmployeeState             VARCHAR(2)   NOT NULL,
  EmployeeZipcode           NUMBER(5,0)  NOT NULL,
  DepartmentID              NUMBER(4,0)  NOT NULL,
  JobTitleID                NUMBER(4,0)  NOT NULL,
  
CONSTRAINT EmployeeT_PK PRIMARY KEY(EmployeeID),
CONSTRAINT EmployeeT_FK1 FOREIGN KEY(DepartmentID) REFERENCES Department_T(DepartmentID),
CONSTRAINT EmployeeT_FK2 FOREIGN KEY(JobTitleID) REFERENCES JobTitle_T(JobTitleID)
);

CREATE TABLE Full_Time_T
( FTEmployeeID      NUMBER(4,0)     NOT NULL,      
  AnnualSalary      VARCHAR(10)     NOT NULL,

CONSTRAINT Full_TimeT_PK PRIMARY KEY(FTEmployeeID)
);

CREATE TABLE Part_Time_T
( PTEmployeeID      NUMBER(4,0)    NOT NULL,
  HourlyWage        VARCHAR(10)    NOT NULL,

CONSTRAINT Part_TimeT_PK PRIMARY KEY(PTEmployeeID)
);

CREATE TABLE Performance_Review_T
( ReviewID              NUMBER(4,0)   NOT NULL,
  Performance_Score     NUMBER(2)     
        CHECK(Performance_Score IN(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)),
  Performance_Comments  VARCHAR(25)
        CHECK(Performance_Comments IN('Poor', 'Mediocre', 'Good', 'Excellent')),
  ReviewDate            DATE          NOT NULL,
  EmployeeID            NUMBER(4,0)   NOT NULL,

CONSTRAINT PerformanceReviewT_PK PRIMARY KEY(ReviewID),
CONSTRAINT PerformanceReviewT_FK FOREIGN KEY(EmployeeID) REFERENCES Employee_T(EmployeeID)
);


-- Insert Data

-- Insert Job Title data
INSERT INTO JobTitle_T VALUES (1001, 'Data Analyst', '$80,000 annually');
INSERT INTO JobTitle_T VALUES (1002, 'Database Administrator', '$110,000 annually');
INSERT INTO JobTitle_T VALUES (1003, 'Financial Analyst', '$90,000 annually');
INSERT INTO JobTitle_T VALUES (1004, 'Project Manager', '$122,000 annually');
INSERT INTO JobTitle_T VALUES (1005, 'HR Manager', '$95,000 annually');
INSERT INTO JobTitle_T VALUES (1006, 'Sales Associate', '$30,000 annually');
INSERT INTO JobTitle_T VALUES (1007, 'Marketing Intern', '$15,000 annually');

-- Insert Location data
INSERT INTO Location_T VALUES (2001, 'Webex meeting', 'Remote');
INSERT INTO Location_T VALUES (2002, 'Webex and Campus site 1', 'Hybrid');
INSERT INTO Location_T VALUES (2003, 'Webex and Campus site 2', 'Hybrid');
INSERT INTO Location_T VALUES (2004, 'Campus site 1', 'On-site');
INSERT INTO Location_T VALUES (2005, 'Campus site 2', 'On-site');

-- Insert Department data
INSERT INTO Department_T VALUES (3001, 'Marketing', 2003);
INSERT INTO Department_T VALUES (3002, 'Finance', 2005);
INSERT INTO Department_T VALUES (3003, 'Human Resources', 2004);
INSERT INTO Department_T VALUES (3004, 'Information Technology', 2001);
INSERT INTO Department_T VALUES (3005, 'Operations Management', 2002);

-- Insert Employee data
INSERT INTO Employee_T VALUES (4001, 'John Doe', '01/30/2000', 3011239876, '123 Main St', 'Rockville', 'MD', 20847, 3004, 1001);
INSERT INTO Employee_T VALUES (4002, 'Peter Parker', '08/10/2001', 3015253865, '456 Pine St', 'Bethesda', 'MD', 20810, 3004, 1002);
INSERT INTO Employee_T VALUES (4003, 'Mary Jane', '08/19/1993', 2408913846, '101 Maple Dr', 'Silver Spring', 'MD', 20901, 3002, 1003);
INSERT INTO Employee_T VALUES (4004, 'Jay Park', '04/25/1987', 4438292134, '202 Elm St', 'Elkridge', 'MD', 21043, 3005, 1004);
INSERT INTO Employee_T VALUES (4005, 'Emily Johnson', '07/13/1999', 4438329301, '789 Oak Ave', 'Ellicott City', 'MD', 21041, 3003, 1005);
INSERT INTO Employee_T VALUES (4006, 'Jacky Le', '05/13/1999', 4432983845, '357 Wisteria Dr', 'Columbia', 'MD', 21046, 3001, 1006);
INSERT INTO Employee_T VALUES (4007, 'Angelina Chen', '12/06/2002', 2400103909, '246 Birch Ln', 'Rockville', 'MD', 20848, 3001, 1007);
INSERT INTO Employee_T VALUES (4008, 'Tiffany Nguyen', '10/30/2003', 2405938234, '126 Spruce Dr', 'Rockville', 'MD', 20849, 3001, 1007);
INSERT INTO Employee_T VALUES (4009, 'Landon Zhang', '12/06/2004', 4430103909, '369 Cherry Ave', 'Gaithersburg', 'MD', 20879, 3001, 1007);
INSERT INTO Employee_T VALUES (4010, 'Kevin Hong', '01/02/2001', 4438934321, '589 Evergreen Dr', 'Laurel', 'MD', 20707, 3001, 1006);

-- Insert Full Time Employee data
INSERT INTO Full_Time_T VALUES (4001, '$81,000');
INSERT INTO Full_Time_T VALUES (4002, '$112,000');
INSERT INTO Full_Time_T VALUES (4003, '$93,000');
INSERT INTO Full_Time_T VALUES (4004, '$126,000');
INSERT INTO Full_Time_T VALUES (4005, '$98,000');

-- Insert Part Time Employee data
INSERT INTO Part_Time_T VALUES (4006, '$28/hr');
INSERT INTO Part_Time_T VALUES (4007, '$15/hr');
INSERT INTO Part_Time_T VALUES (4008, '$15/hr');
INSERT INTO Part_Time_T VALUES (4009, '$15/hr');
INSERT INTO Part_Time_T VALUES (4010, '$28/hr');

-- Insert Performance Review data
INSERT INTO Performance_Review_T VALUES (5001, 7, 'Good', '11/10/2024', 4001);
INSERT INTO Performance_Review_T VALUES (5002, 8, 'Good', '11/09/2024', 4002);
INSERT INTO Performance_Review_T VALUES (5003, 6, 'Good', '11/12/2024', 4003);
INSERT INTO Performance_Review_T VALUES (5004, 9, 'Excellent', '10/30/2024', 4004);
INSERT INTO Performance_Review_T VALUES (5005, 10, 'Excellent', '11/05/2024', 4005);
INSERT INTO Performance_Review_T VALUES (5006, 8, 'Good', '11/13/2024', 4006);
INSERT INTO Performance_Review_T VALUES (5007, 10, 'Excellent', '11/14/2024', 4007);
INSERT INTO Performance_Review_T VALUES (5008, 6, 'Good', '11/03/2024', 4008);
INSERT INTO Performance_Review_T VALUES (5009, 8, 'Good', '11/01/2024', 4009);
INSERT INTO Performance_Review_T VALUES (5010, 7, 'Good', '11/02/2024', 4010);


-- Update Statements

-- Update Jay Park's phone number from 4438292134 to 4430304455
UPDATE Employee_T 
SET Employee_Phone_Number = 4430304455 
WHERE EmployeeID = 4004;

-- Update the Base Pay for the Project Manager job title from $122,000 annually to $125,000 annually.
UPDATE JobTitle_T
SET BasePay = '$125,000 annually'
WHERE JobTitleID = 1004;


-- Select Statements

-- Create a query that displays the Employee Name, Employee Phone Number, and 
-- Department ID for all employees who live in Rockville, ordered by EmployeeName
SELECT EmployeeName, Employee_Phone_Number, DepartmentID
FROM Employee_T
WHERE EmployeeCity = 'Rockville'
ORDER BY EmployeeName;

-- Create a query that displays the Performance Score, Performance Comments, 
-- and Employee ID for all Performance Reviews that are excellent, ordered by 
-- the Performance Score
SELECT Performance_Score, Performance_Comments, EmployeeID
FROM Performance_Review_T
WHERE Performance_Comments = 'Excellent'
ORDER BY Performance_Score;


-- Queries with GROUP BY Statements

-- Create a query that displays the count of ReviewIDs as Number_of_Reviews 
-- that received each Performance Score, grouped by Performance Score.
SELECT COUNT(ReviewID) AS Number_of_Reviews, Performance_Score
FROM Performance_Review_T
GROUP BY Performance_Score;

-- Create a query that displays the count of EmployeeIDs as Employees who 
-- work in each Department identified by its DepartmentID, grouped by DepartmentID.
SELECT COUNT(EmployeeID) AS Employees, DepartmentID
FROM Employee_T
GROUP BY DepartmentID;


-- Queries with JOIN statements

-- Create a query that displays every employee name and the annual salary if 
-- they are full time employees or the hourly wage if they are part time 
-- employees, ordered by employee.
SELECT E.EmployeeName AS Employee, FTE.AnnualSalary AS Annual_Salary, 
       PTE.HourlyWage AS Hourly_Wage
FROM Employee_T E
    LEFT OUTER JOIN Full_Time_T FTE ON E.EmployeeID = FTE.FTEmployeeID
    LEFT OUTER JOIN Part_Time_T PTE ON E.EmployeeID = PTE.PTEmployeeID
ORDER BY Employee;
    
-- Create a query that displays the employee name, performance score, and 
-- performance comments for all reviews, ordered by performance score.
SELECT E.EmployeeName AS Employee, PR.Performance_Score, PR.Performance_Comments
FROM Employee_T E
    INNER JOIN Performance_Review_T PR ON E.EmployeeID = PR.EmployeeID
ORDER BY PR.Performance_Score;

-- Create a query that displays each employee's name, their job title,
-- and the department they are in, ordered by department, then by employee.
SELECT E.EmployeeName AS Employee, JT.JobTitleName AS Job_Title, 
       D.DepartmentName AS Department
FROM Employee_T E
    LEFT OUTER JOIN JobTitle_T JT ON E.JobTitleID = JT.JobTitleID
    LEFT OUTER JOIN Department_T D ON E.DepartmentID = D.DepartmentID
ORDER BY Department, Employee;

-- Create a query that displays all department names, their location name, 
-- and its location type, ordered by department.
SELECT D.DepartmentName AS Department, L.LocationName AS Location, 
       L.LocationType AS Location_Type
FROM Department_T D
    INNER JOIN Location_T L ON D.LocationID = L.LocationID
ORDER BY Department;

