--Returns which classes have at least 5 students
--Utilizes group by and having

SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;
