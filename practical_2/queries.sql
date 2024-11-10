use schoolmanagementsystem;

-- Query 1: Select all fields from the Students table
SELECT * FROM Students;
-- This query retrieves all columns and rows in the Students table.

-- Query 2: Filter students above the age of 18
SELECT * FROM Students
WHERE age >= 16;
-- This query retrieves only the students who are 16 or older than 16.

-- Query 3: Retrieve classes ordered alphabetically by class_name
SELECT * FROM Classes
ORDER BY class_name ASC;
-- This query sorts all classes alphabetically by their names.

-- Query 4: Count the number of students in each class
SELECT class_id, COUNT(student_id) AS student_count
FROM Students
GROUP BY class_id;
-- This query counts the number of students in each class by grouping by class_id.

-- Query 5: Join Students and Classes tables to show students' names and their classes
SELECT Students.first_name, Students.last_name, Classes.class_name
FROM Students
JOIN Classes ON Students.class_id = Classes.class_id;
-- This query retrieves students' first and last names along with their class name.

-- Query 6: Multi-Table Join to show students, subjects they are enrolled in, and the teacher's name
SELECT Students.first_name AS student_first_name, Students.last_name AS student_last_name,
       Subjects.subject_name, Teachers.first_name AS teacher_first_name, Teachers.last_name AS teacher_last_name
FROM Enrollments
JOIN Students ON Enrollments.student_id = Students.student_id
JOIN Subjects ON Enrollments.subject_id = Subjects.subject_id
JOIN Classes ON Subjects.class_id = Classes.class_id
JOIN Teachers ON Classes.teacher_id = Teachers.teacher_id;
-- This query joins multiple tables to display students’ names, subjects, and the teacher for each subject.
