/* Task 2 - Create Database by Ali Masuth */

DROP DATABASE IF EXISTS HAPPY_LEARNING;
CREATE DATABASE HAPPY_LEARNING;
USE HAPPY_LEARNING;
SHOW DATABASES;


/* Task 3 - Create Tables by Ali Masuth */

SHOW TABLES;
CREATE TABLE CARETAKER_AM (
	ID_AM INT PRIMARY KEY,
    FIRST_NAME_AM VARCHAR(22) NOT NULL,
    MIDDLE_NAME_AM VARCHAR(22),
    LAST_NAME_AM VARCHAR(22) NOT NULL,
    PHONE_AM CHAR(14) NOT NULL,
    EMAIL_AM VARCHAR(30),
    RELATIONSHIP_AM VARCHAR(25) NOT NULL
);

CREATE TABLE TEACHER_AM (
	ID_AM INT PRIMARY KEY,
    FIRST_NAME_AM VARCHAR(22) NOT NULL,
    MIDDLE_NAME_AM VARCHAR(22),
    LAST_NAME_AM VARCHAR(22) NOT NULL,
    PHONE_AM CHAR(14) NOT NULL,
    WORK_EMAIL_AM VARCHAR(30) NOT NULL,
    PERSONAL_EMAIL_AM VARCHAR(30),
    COLLEGE_AM VARCHAR(55) NOT NULL,
    DEGREE_AM VARCHAR(5) NOT NULL,
    DEGREE_AREA_AM VARCHAR(25) NOT NULL
);

CREATE TABLE CLASS_AM (
	ID_AM INT PRIMARY KEY,
    CODE_AM CHAR(2) NOT NULL UNIQUE,
    COLOR_AM VARCHAR(5) NOT NULL,
    LEVEL_AM VARCHAR(7) NOT NULL,
    ROOM_NUMBER_AM INT NOT NULL UNIQUE,
    PHONE_AM CHAR(14) NOT NULL UNIQUE,
    DIRECTIONS_AM VARCHAR(130),
    TEACHER_ID_AM INT NOT NULL,
    FOREIGN KEY (TEACHER_ID_AM) REFERENCES TEACHER_AM(ID_AM)
);

CREATE TABLE STUDENT_AM (
	ID_AM INT PRIMARY KEY,
    FIRST_NAME_AM VARCHAR(22) NOT NULL,
    MIDDLE_NAME_AM VARCHAR(22),
    LAST_NAME_AM VARCHAR(22) NOT NULL,
    NICKNAME_AM VARCHAR(20),
    DATE_OF_BIRTH_AM DATE NOT NULL,
    CITY_AM VARCHAR(15) NOT NULL,
    STATE_AM CHAR(2) NOT NULL,
    ZIP_CODE_AM CHAR(5) NOT NULL,
    STREET_AM VARCHAR(35) NOT NULL,
    CLASS_ID_AM INT NOT NULL,
    FOREIGN KEY (CLASS_ID_AM) REFERENCES CLASS_AM(ID_AM)
);

CREATE TABLE GUARDIANSHIP_AM (
	STUDENT_ID_AM INT NOT NULL,
    FOREIGN KEY (STUDENT_ID_AM) REFERENCES STUDENT_AM(ID_AM),
    CARETAKER_ID_AM INT NOT NULL,
    FOREIGN KEY (CARETAKER_ID_AM) REFERENCES CARETAKER_AM(ID_AM)
);

SHOW TABLES;
DESCRIBE CARETAKER_AM;
DESCRIBE TEACHER_AM;
DESCRIBE CLASS_AM;
DESCRIBE STUDENT_AM;
DESCRIBE GUARDIANSHIP_AM;


/* Task 4 - Add Data by Ali Masuth */

SELECT * FROM CARETAKER_AM;
SELECT * FROM TEACHER_AM;
SELECT * FROM CLASS_AM;
SELECT * FROM STUDENT_AM;
SELECT * FROM GUARDIANSHIP_AM;

INSERT INTO CARETAKER_AM VALUES
	(1, 'Rachel', 'Amanda', 'Harvey', '(703) 123-1234', NULL, 'Mother'),
    (2, 'Amanda', NULL, 'Morin', '(703) 987-6543', 'amandamorin@gmail.com', 'Mother'),
    (3, 'Samuel', 'James', 'Hansen', '(571) 123-5432', NULL, 'Father'),
    (4, 'Joshua', 'Adam', 'Hudson', '(571) 458-2852', 'joshuahudson32@gmail.com', 'Brother'),
    (5, 'Samantha', 'Jamie', 'Sanders', '(172) 751-2541', 'samjsanders41@gmail.com', 'Aunt');

INSERT INTO TEACHER_AM VALUES
	(11, 'John', 'Robert', 'Gamby', '(703) 749-1727', 'johngamby23@happylearning.com', NULL, 'University of Colorado', 'BA', 'Elementary Education'),
    (12, 'Veronica', 'Noelle', 'Adams', '(703) 273-2841', 'noellea81@happylearning.com', 'noellea81@gmail.com', 'Virginia Commonwealth University', 'BS', 'Mathematics'),
    (13, 'Wilson', NULL, 'Jacobs', '(703) 182-5812', 'willjacobs38@happylearning.com', 'willjacobs38@gmail.com', 'George Mason University', 'MS', 'Science'),
    (14, 'Douglas', 'Timothy', 'Rogers', '(571) 499-9889', 'dougrogers@happylearning.com', NULL, 'University of North Texas', 'BA', 'Elementary Education'),
    (15, 'Emily', NULL, 'Christopher', '(571) 123-9999', 'emilychris@happylearning.com', 'emilychris@gmail.com', 'Virginia Tech', 'MA', 'English');

INSERT INTO CLASS_AM VALUES
	(21, 'RT', 'Red', 'Turtles', 101, '(703) 111-1111', 'Northwest Wing, Room 101', 11),
    (22, 'RF', 'Red', 'Foxes', 102, '(703) 222-2222', 'East Wing, Room 102', 11),
    (23, 'RM', 'Red', 'Monkeys', 103, '(703) 333-3333', NULL, 12),
    (24, 'BT', 'Blue', 'Turtles', 104, '(703) 444-4444', NULL, 12),
    (25, 'BF', 'Blue', 'Foxes', 105, '(703) 555-5555', 'South Wing, Room 105', 13),
    (26, 'BM', 'Blue', 'Monkeys', 106, '(703) 666-6666', 'Annex Building, Room 106', 13),
    (27, 'GT', 'Green', 'Turtles', 107, '(703) 777-7777', 'Upper Floor, Room 107', 14),
    (28, 'GF', 'Green', 'Foxes', 108, '(703) 888-8888', NULL, 14),
    (29, 'GM', 'Green', 'Monkeys', 109, '(703) 999-9999', NULL, 15);

INSERT INTO STUDENT_AM VALUES
    (31, 'Emma', 'Grace', 'Harvey', NULL, '2005-03-15', 'Citytown', 'ST', '12345', 'First Street', 21),
    (32, 'Liam', 'Alexander', 'Morin', NULL, '2004-08-22', 'Alexandria', 'VA', '23456', 'Second Avenue', 22),
    (33, 'Olivia', 'Sophia', 'Hansen', NULL, '2006-02-10', 'Sunnydale', 'MD', '34567', 'Third Boulevard', 23),
    (34, 'Noah', 'James', 'Hudson', NULL, '2005-11-30', 'Harbor City', 'DC', '45678', 'Fourth Lane', 24),
    (35, 'Ava', 'Elizabeth', 'Sanders', NULL, '2006-07-05', 'Rainbow Falls', 'NY', '56789', 'Fifth Street', 25),
    (36, 'Mia', 'Charlotte', 'Morin', NULL, '2004-05-20', 'Starlight City', 'CA', '67890', 'Sixth Avenue', 26),
    (37, 'Lucas', 'William', 'Hansen', 'Luke', '2005-09-18', 'Pleasantville', 'FL', '78901', 'Seventh Boulevard', 27),
    (38, 'Isabella', NULL, 'Hudson', 'Bella', '2006-04-12', 'Maplewood', 'TX', '89012', 'Eighth Lane', 28),
    (39, 'Jackson', 'Michael', 'Hudson', 'Jack', '2004-12-25', 'Winchester', 'GA', '90123', 'Ninth Street', 29),
    (40, 'Sophia', 'Grace', 'Harvey', NULL, '2005-02-28', 'Riverside', 'CA', '11223', 'Tenth Avenue', 21),
    (41, 'Ethan', 'Alexander', 'Morin', NULL, '2004-11-15', 'Springfield', 'IL', '33445', 'Eleventh Boulevard', 22),
    (42, 'Amelia', 'Lily', 'Hansen', NULL, '2006-01-10', 'Woodland', 'OH', '55667', 'Twelfth Lane', 23),
    (43, 'Daniel', 'Joseph', 'Hudson', 'Dan', '2005-10-30', 'Highland', 'MI', '77889', 'Thirteenth Street', 24),
    (44, 'Chloe', 'Sophia', 'Hudson', NULL, '2006-06-05', 'Meadowview', 'VA', '99011', 'Fourteenth Avenue', 25),
    (45, 'Oliver', 'Benjamin', 'Morin', NULL, '2004-04-20', 'Sunset', 'AZ', '11223', 'Fifteenth Boulevard', 26),
    (46, 'Aria', 'Grace', 'Harvey', NULL, '2005-08-18', 'Greenfield', 'KS', '33445', 'Sixteenth Lane', 27),
    (47, 'Carter', 'Thomas', 'Morin', NULL, '2006-03-12', 'Bayside', 'FL', '55667', 'Seventeenth Street', 28),
    (48, 'Scarlett', 'Rose', 'Sanders', NULL, '2004-12-25', 'Roseville', 'CA', '77889', 'Eighteenth Avenue', 29);

INSERT INTO GUARDIANSHIP_AM VALUES
    (31, 1),
    (32, 2),
    (33, 3),
    (34, 4),
    (35, 5),
    (36, 2),
    (37, 3),
    (38, 4),
    (39, 4),
    (40, 1),
    (41, 2),
    (42, 3),
    (43, 4),
    (44, 4),
    (45, 2),
    (46, 1),
    (47, 2),
    (48, 5);

SELECT * FROM CARETAKER_AM;
SELECT * FROM TEACHER_AM;
SELECT * FROM CLASS_AM;
SELECT * FROM STUDENT_AM;
SELECT * FROM GUARDIANSHIP_AM;


/* Task 5 - Query the Data by Ali Masuth */

SELECT 
    CONCAT(STUDENT_AM.FIRST_NAME_AM, ' ', STUDENT_AM.LAST_NAME_AM) AS 'Student',
    LEVEL_AM AS 'Level',
    COLOR_AM AS 'Color',
    ROOM_NUMBER_AM AS 'Room',
    CONCAT(TEACHER_AM.FIRST_NAME_AM, ' ', TEACHER_AM.LAST_NAME_AM) AS 'Teacher'
FROM 
    STUDENT_AM, CLASS_AM, TEACHER_AM
WHERE 
    STUDENT_AM.CLASS_ID_AM=CLASS_AM.ID_AM AND CLASS_AM.TEACHER_ID_AM=TEACHER_AM.ID_AM
ORDER BY 
    STUDENT_AM.FIRST_NAME_AM ASC;


SELECT
	COLOR_AM AS 'Color', 
    LEVEL_AM AS 'Level', 
    CONCAT(STUDENT_AM.FIRST_NAME_AM, ' ', STUDENT_AM.LAST_NAME_AM) AS 'Student Name',
    STUDENT_AM.NICKNAME_AM AS 'Nickname'
FROM
	CLASS_AM, STUDENT_AM
WHERE
	STUDENT_AM.CLASS_ID_AM=CLASS_AM.ID_AM
ORDER BY
	LEVEL_AM ASC, COLOR_AM ASC, STUDENT_AM.FIRST_NAME_AM ASC;


SELECT
    CONCAT(CARETAKER_AM.FIRST_NAME_AM, ' ', CARETAKER_AM.LAST_NAME_AM) AS 'Caretaker Name',
    CARETAKER_AM.EMAIL_AM AS 'Email',
    CONCAT(STUDENT_AM.FIRST_NAME_AM, ' ', STUDENT_AM.LAST_NAME_AM) AS 'Student Name',
    CLASS_AM.LEVEL_AM AS 'Class Level',
    CLASS_AM.COLOR_AM AS 'Color'
FROM
    CARETAKER_AM,
    GUARDIANSHIP_AM,
    STUDENT_AM,
    CLASS_AM
WHERE
    CARETAKER_AM.ID_AM = GUARDIANSHIP_AM.CARETAKER_ID_AM
    AND GUARDIANSHIP_AM.STUDENT_ID_AM = STUDENT_AM.ID_AM
    AND STUDENT_AM.CLASS_ID_AM = CLASS_AM.ID_AM
ORDER BY
    CARETAKER_AM.FIRST_NAME_AM ASC, STUDENT_AM.FIRST_NAME_AM ASC;


/* Each student only contains one caretaker. */
SELECT
    CONCAT(TEACHER_AM.FIRST_NAME_AM, ' ', TEACHER_AM.LAST_NAME_AM) AS 'Teacher',
    CONCAT(STUDENT_AM.FIRST_NAME_AM, ' ', STUDENT_AM.LAST_NAME_AM) AS 'Student',
    CONCAT(CARETAKER_AM.FIRST_NAME_AM, ' ', CARETAKER_AM.LAST_NAME_AM) AS 'Parent'
FROM
    TEACHER_AM, CLASS_AM, STUDENT_AM, GUARDIANSHIP_AM, CARETAKER_AM
WHERE
    CLASS_AM.TEACHER_ID_AM = TEACHER_AM.ID_AM
    AND STUDENT_AM.CLASS_ID_AM = CLASS_AM.ID_AM
    AND GUARDIANSHIP_AM.STUDENT_ID_AM = STUDENT_AM.ID_AM
    AND GUARDIANSHIP_AM.CARETAKER_ID_AM = CARETAKER_AM.ID_AM
ORDER BY
    TEACHER_AM.FIRST_NAME_AM ASC, STUDENT_AM.FIRST_NAME_AM ASC, CARETAKER_AM.FIRST_NAME_AM ASC;