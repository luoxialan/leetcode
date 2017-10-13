# my solution
SELECT Request_at AS Day,
    CAST(cancelled_order/total_order as decimal(3,2)) AS 'Cancellation Rate'
FROM (
SELECT Request_at,
    COUNT(Id) AS total_order,
    SUM(CASE WHEN Status = 'cancelled_by_client' THEN 1 WHEN Status = 'cancelled_by_driver' THEN 1 ELSE 0 END) AS cancelled_order
FROM (
    SELECT T.* FROM Trips T
    LEFT JOIN Users U 
    ON T.Client_Id = U.Users_Id
    WHERE U.Banned <> 'Yes' AND Request_at between '2013-10-01' and '2013-10-03' ) T
GROUP BY Request_at ) C
