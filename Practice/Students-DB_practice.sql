create database studentsdb;

use studentsdb;

create table students(
studentid int auto_increment primary key,
firstname varchar(50),
lastname varchar(50),
birthdate date,
gender varchar(50));

create table courses(
courseid int auto_increment primary key,
coursename varchar(50),
credits int);

create table enrollment(
enrollmentid int auto_increment primary key,
studentid int,
courseid int,
foreign key(studentid) references students(studentid),
foreign key(courseid) references courses(courseid));


insert into students (firstname,lastname,birthdate,gender) 
values
("John","Doe",'2000-05-15','Male'),
('Jane',"smith",'2002-11-09',"Female"),
('Emily', 'Johnson', '2001-07-22', 'Female'),
('Michael', 'Williams', '2000-12-30', 'Male'),
('Sarah', 'Brown', '1998-10-10', 'Female'),
('David', 'Jones', '2002-03-25', 'Male'),
('Emma', 'Garcia', '2000-11-08', 'Female'),
('James', 'Martinez', '1999-01-01', 'Male'),
('Olivia', 'Hernandez', '2001-08-30', 'Female'),
('William', 'Lopez', '2000-02-14', 'Male');


insert into courses (coursename,credits)
values
("Maths",3),
('Computer Science', 4),
('Biology', 3),
('Chemistry', 4),
('Physics', 3),
('Literature', 2),
('History', 3),
('Economics', 3),
('Engineering', 4),
('Data Science', 4);


insert into enrollment (courseid,studentid)
values
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(4, 2),
(5, 3),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9);

select * from students;

select * from enrollment;

select courseid,credits from courses;