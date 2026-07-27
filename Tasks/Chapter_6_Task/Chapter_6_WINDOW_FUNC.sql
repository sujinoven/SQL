use hospital_management;

# 1.Rank patients based on their total treatment cost.

select * from patients;
select * from appointments;
select * from treatments;

select p.patientID,concat(p.firstName," ",p.lastName) as PatientName,
sum(t.treatmentCost) as TotalCost,
rank() over(order by sum(t.treatmentCost) desc) as Patient_Rank
from patients p
inner join appointments a 
on p.patientID = a.patientID
inner join treatments t 
on t.appointmentID=a.appointmentID
group by patientID;

# 2.Assign dense ranks to patients based on bill amounts.

select * from patients;
select * from bills;

select concat(p.firstName,' ',p.lastName) as PatientName,
b.totalAmount as BillAmount,
dense_rank() over(order by b.totalAmount) as Ranks
from patients p
inner join bills b 
on p.patientID= b.patientID;

#3.Dense rank patients based on total treatment cost.

select * from patients;
select * from appointments;
select * from treatments;

select p.patientID,concat(p.firstName,' ',p.lastName) as PatientName,
sum(t.treatmentCost) as TreatmentCost,
dense_rank() over(order by sum(t.treatmentCost))
from patients p
inner join appointments a
on p.patientID = a.patientID
inner join treatments t
on t.appointmentID = a.appointmentID
group by p.patientID,p.firstName,p.lastName;

# 4.Show cumulative treatment cost for each patient.

select p.patientID,concat(p.firstName,' ',p.lastName) as patientName,t.treatmentCost,
sum(t.treatmentCost) over(partition by p.patientID order by t.treatmentDate) as Running_Total
from patients p
inner join appointments a 
on p.patientID=a.patientID
inner join treatments t
on t.appointmentID=a.appointmentID;

#5.Compare a patient's current treatment cost with their previous treatment cost.

SELECT
    patientID,
    treatmentDate,
    treatmentCost,
    LAG(treatmentCost)
    OVER(
        PARTITION BY patientID
        ORDER BY treatmentDate
    ) AS Previous_Cost
FROM
(
    SELECT
        p.patientID,
        t.treatmentDate,
        t.treatmentCost
    FROM Patients p
    JOIN Appointments a
    ON p.patientID=a.patientID
    JOIN Treatments t
    ON a.appointmentID=t.appointmentID
) x ;

# 6.Show a patient's next treatment cost.
SELECT
    patientID,
    treatmentDate,
    treatmentCost,
    LEAD(treatmentCost)
    OVER(
        PARTITION BY patientID
        ORDER BY treatmentDate
    ) AS Next_Cost
FROM
(
    SELECT
        p.patientID,
        t.treatmentDate,
        t.treatmentCost
    FROM Patients p
    JOIN Appointments a
    ON p.patientID=a.patientID
    JOIN Treatments t
    ON a.appointmentID=t.appointmentID
) x;