create database hospital_management;

use hospital_management;

# Creating Patients Table
create table Patients(
patientID int primary key,
firstName varchar(50),
lastName varchar(50),
dob date,
gender varchar(50),
phone_number int,
city varchar(50));

ALTER TABLE Patients
MODIFY phone_number VARCHAR(15);

# Inserting into Patients Table

INSERT INTO Patients VALUES
(101,'Arun','Kumar','1998-05-14','Male',9876543210,'Chennai'),
(102,'Priya','Sharma','2000-08-20','Female',9876543211,'Bangalore'),
(103,'Rohan','Mehta','1995-02-10','Male',9876543212,'Mumbai'),
(104,'Kavya','Reddy','1999-07-25','Female',9876543213,'Hyderabad'),
(105,'Vishnu','Nair','1997-12-18','Male',9876543214,'Kochi');

#Doctors Table
create table Doctors(
doctorID int primary key,
doctorName varchar(50),
specialization varchar(50),
phone_number int,
email varchar(50));

ALTER TABLE Doctors
MODIFY phone_number VARCHAR(15);

INSERT INTO Doctors VALUES
(201,'Dr. Suresh','Cardiologist','9123456781','suresh@hospital.com'),
(202,'Dr. Anita','Neurologist','9123456782','anita@hospital.com'),
(203,'Dr. Rajesh','Orthopedic','9123456783','rajesh@hospital.com'),
(204,'Dr. Divya','Pediatrician','9123456784','divya@hospital.com'),
(205,'Dr. Kiran','Dermatologist','9123456785','kiran@hospital.com');

# Departments Table
create table Departments(
departmentId int primary key,
departmentName varchar(50),
floorNumber int);

INSERT INTO Departments VALUES
(1,'Cardiology',1),
(2,'Neurology',2),
(3,'Orthopedics',3),
(4,'Pediatrics',4),
(5,'Dermatology',5);

#Appointments table

create table Appointments(
patientID int,
doctorID int,
appointmentID int primary key,
appointmentDate date,
appointmentTime time,
status varchar(50),
foreign key (patientID) references Patients(patientID),
foreign key (doctorID) references Doctors(doctorID));

ALTER TABLE Appointments
ADD PRIMARY KEY (appointmentID);

# Inserting into Appointments
INSERT INTO Appointments VALUES
(101,201,301,'2026-01-10','10:00:00','Completed'),
(102,202,302,'2026-01-11','11:00:00','Completed'),
(103,203,303,'2026-01-12','14:00:00','Pending'),
(104,204,304,'2026-01-13','09:30:00','Completed'),
(105,205,305,'2026-01-14','15:00:00','Cancelled');

#Treatments Table

create table Treatments(
treatmentID int primary	key,
appointmentID int,
treatmentName varchar(50),
treatmentCost int,
treatmentDate date,
foreign key (appointmentID) references Appointments(appointmentID));

# Inserting into Treatments table

INSERT INTO Treatments VALUES
(401,301,'ECG Test',2000,'2026-01-10'),
(402,302,'Brain Scan',5000,'2026-01-11'),
(403,303,'X-Ray',1500,'2026-01-12'),
(404,304,'Vaccination',1000,'2026-01-13'),
(405,301,'Blood Test',800,'2026-01-10');


#Bills Table

create table Bills(
BillID int primary key,
patientID int,
billDate date,
totalAmount int,
paymentStatus varchar(50),
foreign key (patientID) references Patients(patientID));

# Inserting into Bills Table

INSERT INTO Bills VALUES
(501,101,'2026-01-10',2800,'Paid'),
(502,102,'2026-01-11',5000,'Paid'),
(503,103,'2026-01-12',1500,'Pending'),
(504,104,'2026-01-13',1000,'Paid'),
(505,105,'2026-01-14',0,'Cancelled');

# Doctpr_Department Table

create table Doctor_Department(
doctordepartmentID int primary key,
doctorID int,
departmentID int,
foreign key (doctorID) references Doctors(doctorID),
foreign key (departmentID) references Departments(departmentID));

# Inserting into Doctor_Deapartments
INSERT INTO Doctor_Department VALUES
(1,201,1),
(2,202,2),
(3,203,3),
(4,204,4),
(5,205,5);

# Employeees Table

create table Employees(
employeeID int primary key,
employeeName varchar(50),
designation varchar(50),
managerID int)
;

# Insert into Employees Table
INSERT INTO Employees VALUES
(601,'Arun Kumar','Hospital Director',NULL),
(602,'Priya Sharma','Admin Manager',601),
(603,'Rohan Mehta','HR Executive',602),
(604,'Kavya Reddy','Receptionist',602),
(605,'Vishnu Nair','Billing Executive',602);



#  1. Which patients have booked appointments and which doctor will attend them?

select * from appointments;
select * from patients;
select * from doctors;

select p.firstName,p.lastName,d.doctorName
from patients p
inner join appointments a 
on p.patientID = a.patientID
inner join doctors d
on a.doctorID = d.doctorID;


# 2.Show all treatments along with the patient who received them. 

select * from patients;
select * from treatments;
select * from appointments;

select p.firstName,p.lastName,t.treatmentName
from patients p
inner join appointments a
on p.patientID = a.patientID
inner join treatments t 
on t.appointmentID = a.appointmentID where a.status = "Completed";

# 3. List doctors and their department names.

select * from doctors;
select * from departments;
select * from doctor_department;

select d.doctorName,d.specialization,de.departmentName
from doctors d
inner join doctor_department dod
on d.doctorID = dod.doctorID
inner join departments de
on dod.departmentID = de.departmentID;

# 4.Show appointment details with patient and doctor information. 

select * from appointments;
select * from patients;
select * from doctors;

select p.firstName,p.lastName,d.doctorName,d.specialization,a.appointmentDate,a.appointmentTime,a.status
from patients p
inner join appointments a 
on p.patientID = a.patientID
inner join doctors d
on a.doctorID = d.doctorID;

# 5. Display bills generated for patients along with their names.
 
 select * from bills;
 select * from patients;
 
 select p.firstName,p.lastName,b.BillID,b.billDate,b.totalAmount,b.paymentStatus
 from patients p 
 inner join bills b
 on p.patientID = b.patientID;
 
 # 6.Show all patients and their appointments, including patients who never booked an appointment. 
 
 
 # Adding some new data to see the real difference between joins since with current data .almost every foreign key has a matching paretn row
 INSERT INTO Patients
VALUES
(106,'Rahul','Verma','1996-04-15','Male','9876543215','Delhi');

 select * from patients;
 select * from appointments;
 
 select p.firstName,p.lastName,a.appointmentDate,a.appointmentTime,a.status
 from patients p
 left join appointments a
 on a.patientID = p.patientID;
 
 
 # Inserting some more data in other tables
 
 INSERT INTO Patients
VALUES
(107,'Anjali','Singh','1998-08-20','Female','9876543216','Pune');

select * from patients;
select * from bills;

select p.firstName,p.lastName,b.BillID,b.billDate,b.totalAmount,b.paymentStatus
from patients p
left join bills b
on p.patientID = b.patientID;

INSERT INTO Departments VALUES
(6,'Radiology',6),
(7,'Psychiatry',7);

INSERT INTO Patients VALUES
(108,'Deepak','Nair','1994-03-11','Male','9876543217','Trivandrum'),
(109,'Sneha','Patel','1999-07-17','Female','9876543218','Surat'); 

INSERT INTO Bills VALUES
(506,101,'2026-02-01',1500,'Paid'),
(507,102,'2026-02-02',2500,'Pending');

INSERT INTO Employees VALUES
(606,'Manoj Kumar','Pharmacist',602),
(607,'Ritika Sharma','Lab Technician',602);


# 7. Show all patients and their bills, including patients who do not have bills.

select * from patients;
select * from bills;

select p.firstName,p.lastName, b.totalAmount,b.paymentStatus
from patients p
left join bills b
on p.patientID = b.patientID;

#  9. Show all appointments and corresponding patients.

select * from appointments;
select * from patients;

select a.appointmentID,a.appointmentDate,a.appointmentTime,a.status,p.firstName,p.lastName
from patients p
right join appointments a
on a.patientID = p.patientID;

# 10. Show all doctors and appointment records.

select * from doctors;
select * from appointments;

select d.doctorName,a.appointmentDate,a.appointmentTime,a.status
from doctors d
right join appointments a 
on d.doctorID = a.doctorID;

# 11. Every Patient-Doctor Combination

select * from doctors;
select * from patients;

select p.firstName,d.doctorName
from  patients p
cross join doctors d

# 12. Every Doctor-Department Combination 

select * from doctors;
select * from departments;

select d.doctorName,de.departmentName
from doctors d
cross join departments de 

# 13. Show each employee and their manager.


select e.employeeName as Employees,
m.employeename as Manager
from employees e
left join employees m
on e.employeeID = m.managerID;

# 14.Find all employees reporting to the Admin Manager.


SELECT
    e.employeeName
FROM Employees e
INNER JOIN Employees m
ON e.managerID = m.employeeID
WHERE m.designation = 'Admin Manager';

# 15. Show all appointments and treatments.

select * from appointments;
select * from treatments;

select a.appointmentID,t.treatmentName
from appointments a 
left join treatments t
on t.appointmentID = a.appointmentID

union

select a.appointmentID,t.treatmentName
from appointments a 
right join treatments t
on t.appointmentID = a.appointmentID;

# 16. Show all patients and appointments.

select * from patients;
select * from appointments;

select p.firstName,p.lastName,a.appointmentDate,a.appointmentTime
from patients p
left join appointments a
on p.patientID = a.patientID

union

select p.firstName,p.lastName,a.appointmentDate,a.appointmentTime
from patients p
left join appointments a
on p.patientID = a.patientID;


# 17.Show all patients and bills. 

select * from patients;
select * from bills;

select p.firstName,p.lastName,b.totalAmount,b.paymentStatus
from patients p
left join bills b
on p.patientID = b.patientID

union

select p.firstName,p.lastName,b.totalAmount,b.paymentStatus
from patients p
right join bills b
on p.patientID = b.patientID;