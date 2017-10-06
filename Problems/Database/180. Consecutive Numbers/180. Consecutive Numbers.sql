# Solution
SELECT DISTINCT Logs1.Num AS ConsecutiveNums 
FROM logs 
INNER JOIN (SELECT Id-1 as Id, Num FROM Logs) Logs1
ON Logs1.Num = Logs.Num AND Logs1.Id = Logs.Id
INNER JOIN (SELECT Id-2 as Id, Num FROM Logs) Logs2
ON Logs2.Num = Logs.Num AND Logs2.Id = Logs.Id
