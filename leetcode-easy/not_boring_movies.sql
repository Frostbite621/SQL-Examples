--Return odd number ids that are not boring
--order by desc id
--multiple conditions for the WHERE

SELECT id, movie, description, rating
FROM Cinema
WHERE id % 2 = 1 AND description != 'boring'
ORDER BY rating DESC;
