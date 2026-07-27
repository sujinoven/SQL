use hospital_management;

# Show all patients along with their appointment details, including patients who have never booked an appointment.

select * from patients;
select * from appointments;

select concat(p.firstName,' ',p.lastName) as PatientName, a.appointmentDate,a.appointmentTime,a.status
from patients p
left join appointments a
on p.patientID = a.patientID;

# Display the names of patients, the doctors they consulted, and the appointment dates.

select * from patients;
select * from appointments;
select * from doctors;

select concat(p.firstName," ",p.lastName),d.doctorName,a.appointmentDate
from patients p
inner join appointments a 
on p.patientID = a.patientID
inner join doctors d 
on d.doctorID = a.doctorID where a.status = "Completed" ;

# Show every doctor and the appointments assigned to them, including doctors who have not been assigned any appointments.
select * from doctors;
select * from appointments;

select d.doctorName,a.appointmentDate
from doctors d
left join appointments a 
on d.doctorID = a.doctorID;

# Generate all possible combinations of patients and doctors for a health camp planning report.

select concat(p.firstName," ",p.lastName), d.doctorName
from patients p
cross join doctors d;


# Display patient names, treatment names, treatment costs, and the doctor who provided the treatment.

select * from patients;
select * from treatments;
select * from doctors;

select concat(p.firstName," ",p.lastName) as PatientName, t.treatmentName,t.treatmentCost
from patients p 
inner join appointments a 
on p.patientID = a.patientID
inner join treatments t
on t.appointmentID = a.appointmentID
inner join doctors d
on d.doctorID = a.doctorID;

# Retrieve the names of all patients along with the names of their assigned doctors.
select * from patients;
select * from appointments;
select* from doctors;

# Retrieve the names of all patients along with the names of their assigned doctors.

select concat(p.firstName," ",p.lastName) as PatientName, d.doctorName
from patients p
inner join appointments a 
on p.patientID =a.patientID
inner join doctors d
on a.doctorID = d.doctorID;

# Display all patients and their doctor details, including patients who are not assigned to any doctor.
select * from patients;
select * from appointments;
select* from doctors;

select concat(p.firstName," ",p.lastName) as PatientName,d.doctorName
from patients p
left join appointments a 
on a.patientID = p.patientID
left join doctors d
on d.doctorID = a.doctorID;

# List all doctors and the patients assigned to them, including doctors who currently have no patients.

select concat(p.firstName," ",p.lastName) as PatientName,d.doctorName
from patients p
right join appointments a 
on a.patientID = p.patientID
left join doctors d
on d.doctorID = a.doctorID;

# Show all patients and all doctors, whether they are associated with each other or not.

select concat(p.firstName," ",p.lastName) as PatientName,d.doctorName
from patients p
left join appointments a 
on a.patientID = p.patientID
left join doctors d
on d.doctorID = a.doctorID

union

select concat(p.firstName," ",p.lastName) as PatientName,d.doctorName
from patients p
right join appointments a 
on a.patientID = p.patientID
left join doctors d
on d.doctorID = a.doctorID;

# Generate every possible combination of patients and doctors for appointment planning.
select p.firstName, d.doctorName
from patients p
cross join doctors d

# Display patient name, doctor name, and appointment date for every appointment.

select p.firstName,d.doctorName,a.appointmentDate
from patients p
inner join appointments a
on p.patientID = a.patientID
inner join doctors d
on d.doctorID= a.doctorID;

