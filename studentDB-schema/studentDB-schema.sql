**StudentDB**
    -- create a Students table
CREATE TABLE Students (
  `StudentID` INT PRIMARY KEY,
  `StudentName` VARCHAR(50),
  `Grade_Level` INT,
  `Date_of_Birth` DATE,
  `Email` CHAR(50),
  `Phone_Number` CHAR(12)
);

-- create a Courses table
CREATE TABLE Courses (
  `CourseID` INT (5) PRIMARY KEY,
  `CourseName` CHAR (50),
  `TeacherID` INT,
  `Credits` INT
);

-- Create Enrollment Table
CREATE TABLE Enrollment (
  `EnrollmentID` INT (10) PRIMARY KEY,
  `CourseID` INT (5),
  `StudentID` INT (5),
  `EnrollmentDate` DATE
);

-- Create Teachers Table
CREATE TABLE Teachers (
  `TeacherID` INT,
  `TeacherName` CHAR (50),
  `TeacherEmail` CHAR (50),
  `DepartmentID` INT
);

-- Create Departments Table
CREATE TABLE Departments (
  `DepartmentID` INT,
  `DepartmentName` CHAR (50)
);

-- insert student data into Students Table
INSERT INTO Students VALUES
  (1001, 'Juan De la Cruz', 1, '2000-12-12', 'juandelacruz@aws.com', '09170000001'),
  (1002, 'Maria Santos', 2, '1999-08-25', 'mariasantos@gmail.com', '09280000002'),
  (1003, 'Carlos Reyes', 3, '2001-05-18', 'carlosreyes@yahoo.com', '09390000003'),
  (1004, 'Luisa Hernandez', 4, '2000-02-09', 'luisahernandez@hotmail.com', '09400000004'),
  (1005, 'Ramon Gomez', 2, '1999-11-30', 'ramongomez@gmail.com', '09510000005'),
  (1006, 'Elena Mendoza', 3, '2001-09-03', 'elenamendoza@gmail.com', '09620000006'),
  (1007, 'Roberto Torres', 1, '2000-04-17', 'robertotorres@yahoo.com', '09730000007'),
  (1008, 'Carmen Lopez', 2, '1999-12-05', 'carmenlopez@hotmail.com', '09840000008'),
  (1009, 'Javier Ramirez', 3, '2001-02-28', 'javierramirez@gmail.com', '09950000009'),
  (1010, 'Isabel Diaz', 1, '2000-07-22', 'isabeldiaz@aws.com', '09110000010'),
  (1011, 'Alejandro Cruz', 2, '1999-03-15', 'alejandrocruz@gmail.com', '09220000011'),
  (1012, 'Sofia Medina', 3, '2001-11-07', 'sofiamedina@yahoo.com', '09330000012'),
  (1013, 'Antonio Gonzalez', 4, '2000-06-30', 'antoniogonzalez@hotmail.com', '09440000013'),
  (1014, 'Lorena Ortega', 2, '1999-01-13', 'lorenaortega@gmail.com', '09550000014'),
  (1015, 'Miguel Silva', 3, '2001-04-26', 'miguelsilva@aws.com', '09660000015'),
  (1016, 'Ana Maria Rodriguez', 1, '2000-09-09', 'anarodriguez@yahoo.com', '09770000016'),
  (1017, 'Pedro Vargas', 2, '1999-04-02', 'pedrovargas@hotmail.com', '09880000017'),
  (1018, 'Isabella Torres', 3, '2001-12-15', 'isabellatorres@gmail.com', '09990000018'),
  (1019, 'Hector Lopez', 4, '2000-05-18', 'hectorlopez@aws.com', '09100000019'),
  (1020, 'Monica Rivera', 2, '1999-10-31', 'monicarivera@yahoo.com', '09210000020');

-- insert data into courses table
INSERT INTO Courses VALUES
  (101, 'BS in Information Technology', 201, 15),
  (102, 'BA in Psychology', 202, 20),
  (103, 'BS in Computer Science', 203, 15),
  (104, 'BS in Business Administration', 204, 25),
  (105, 'BS in Electrical Engineering', 205, 20);

-- insert data on enrollment table
INSERT INTO Enrollment VALUES
  (1, 101, 1001, '2023-01-15'),
  (2, 102, 1002, '2023-01-16'),
  (3, 103, 1003, '2023-01-17'),
  (4, 104, 1004, '2023-01-18'),
  (5, 105, 1005, '2023-01-19'),
  (6, 101, 1006, '2023-01-20'),
  (7, 102, 1007, '2023-01-21'),
  (8, 103, 1008, '2023-01-22'),
  (9, 104, 1009, '2023-01-23'),
  (10, 105, 1010, '2023-01-24'),
  (11, 101, 1011, '2023-01-15'),
  (12, 102, 1012, '2023-01-16'),
  (13, 103, 1013, '2023-01-17'),
  (14, 104, 1014, '2023-01-18'),
  (15, 105, 1015, '2023-01-19'),
  (16, 101, 1016, '2023-01-20'),
  (17, 102, 1017, '2023-01-21'),
  (18, 103, 1018, '2023-01-22'),
  (19, 104, 1019, '2023-01-23'),
  (20, 105, 1020, '2023-01-24');

-- insert data into Teachers table
INSERT INTO Teachers VALUES
  (201,'AJ Raval', 'aj@gmail.com', 301),
  (202, 'Andrea Brillantes', 'andrea@yahoo.com', 302),
  (203, 'Sasha Grey', 'shasha@aws.com', 301),
  (204, 'Ivana Ilawi', 'ivana@hotmail.com', 303),
  (205, 'Cristine Reyes', 'cristine@gmail.com', 304);

-- insert data into departments table
INSERT INTO Departments VALUES 
  (301, 'Computer Studies'),
  (301, 'Health Sciences'),
  (301, 'Finance'),
  (301, 'Engineering');


-- Retrieve all students enrolled in a specific course.
SELECT  Enrollment.CourseID, Courses.Coursename, Students.StudentName
FROM Students
INNER JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
INNER JOIN Courses ON Enrollment.CourseID = Courses.CourseID
WHERE Enrollment.CourseID = 105;

-- Find the total number of credits taken by each student.
SELECT Students.StudentID, Students.StudentName, SUM(Courses.Credits) AS TotalCredits
FROM Students
JOIN Enrollment ON Students.StudentID = Enrollment.StudentID
JOIN Courses ON Enrollment.CourseID = Courses.CourseID
GROUP BY Students.StudentID, Students.StudentName;

-- List all courses along with the number of enrolled students.
SELECT Courses.CourseID, Courses.CourseName, COUNT(Enrollment.StudentID) AS EnrolledStudents
FROM Courses
LEFT JOIN Enrollment ON Courses.CourseID = Enrollment.CourseID
GROUP BY Courses.CourseID, Courses.CourseName;
