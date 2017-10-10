# my solution
UPDATE salary
SET sex = @s := (case when sex = 'f' then 'm' when sex = 'm' then 'f' end)

