-- Query 1: Find students whose total credits are greater than 100
SELECT name, tot_cred
FROM University.student
WHERE tot_cred > 100;

-- Query 2: Find course IDs and grades for Mahesh
SELECT t.course_id, t.grade
FROM takes t
JOIN student s ON t.ID = s.ID
WHERE s.name = 'Mahesh';

-- Query 3: Find instructors who taught a CSE course, even if they belong to another department
SELECT DISTINCT i.ID, i.name
FROM instructor i
JOIN teaches t ON i.ID = t.ID
JOIN course c ON t.course_id = c.course_id
WHERE c.dept_name = 'CSE';

-- Query 4: Find courses offered in both odd-numbered and even-numbered semesters
SELECT DISTINCT c.course_id, c.title
FROM course c
JOIN section s1 ON c.course_id = s1.course_id
WHERE CAST(s1.semester AS UNSIGNED) IN (1, 3, 5, 7)
  AND EXISTS (
      SELECT 1
      FROM section s2
      WHERE s2.course_id = c.course_id
        AND CAST(s2.semester AS UNSIGNED) IN (2, 4, 6, 8)
  );

--   Query 5: Find instructors belonging to the CSE department
SELECT name
FROM instructor
WHERE dept_name = 'CSE';

-- Query 6: Find course IDs and titles taught by Aditya
SELECT DISTINCT c.course_id, c.title
FROM course c
JOIN teaches t ON c.course_id = t.course_id
JOIN instructor i ON t.ID = i.ID
WHERE i.name = 'Adithya';

-- Query 7: Find instructors who taught at least one course in semester 2 of 2025
SELECT DISTINCT i.ID, i.name
FROM instructor i
JOIN teaches t ON i.ID = t.ID
WHERE t.semester = '2'
  AND t.year = 2025;

SELECT * FROM prereq;
SELECT * FROM teaches;
SELECT * FROM takes;
SELECT * FROM advisor;