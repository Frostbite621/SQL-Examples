--Returns each player with their first login
--Uses aggregation and group by

SELECT player_id, MIN(event_date) as "first_login"
FROM Activity
GROUP BY player_id;
