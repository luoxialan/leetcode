[626. Exchange Seats](https://leetcode.com/problems/exchange-seats/description/)

SQL Statement
```
SELECT S.id, 
    CASE WHEN S.id % 2 = 0 Then B.student
         ELSE CASE WHEN A.student is null THEN S.student ELSE A.student END 
    END AS student
FROM seat AS S
LEFT JOIN (SELECT id-1 AS id, student FROM seat) AS A
ON S.id = A.id 
LEFT JOIN (SELECT id+1 AS id, student FROM seat) AS B
ON S.id = B.id
ORDER BY S.id 
```
