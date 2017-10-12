# my solution 
SELECT D.Name AS Department,
    E.Name AS Employee,
    E.Salary
FROM Employee E
INNER JOIN Department D
ON E.DepartmentId = D.id
WHERE E.id in (
    SELECT DISTINCT Id from (
    SELECT Id, ct FROM (
    SELECT Id, 
        @prevdept as pd, 
        @prevsalary as ps,
        CASE WHEN DepartmentID = @prevdept AND Salary <> @prevsalary THEN @count := @count + 1 
        WHEN DepartmentID = @prevdept and Salary = @prevsalary THEN @count := @count
        ELSE @count := 1 END AS ct,
        @prevdept := DepartmentID,
        @preVsalary := Salary
    FROM Employee, (SELECT @prevdept := null) d, (SELECT @count := 1) c, (SELECT @prevsalary := null) s
    ORDER BY DepartmentID, Salary DESC ) I ) t WHERE ct < 4
) ORDER BY D.Name, E.Salary DESC
