use hospital_management;

# 1.Display all patients along with their appointment details.

DELIMITER //

CREATE PROCEDURE GetPatientAppointments()
BEGIN
    SELECT
        p.patientID,
        CONCAT(p.firstName,' ',p.lastName) AS Patient_Name,
        a.appointmentID,
        a.appointmentDate,
        a.status
    FROM Patients p
    INNER JOIN Appointments a
    ON p.patientID = a.patientID;
END //

DELIMITER ;

CALL GetPatientAppointments();

# 2. Retrieve all appointments for a specific patient.
DELIMITER //

CREATE PROCEDURE GetAppointmentsByPatient(
    IN p_patientID INT
)
BEGIN
    SELECT
        appointmentID,
        appointmentDate,
        appointmentTime,
        status
    FROM Appointments
    WHERE patientID = p_patientID;
END //

DELIMITER ;

CALL GetAppointmentsByPatient(101);


# 3.Find the total treatment cost incurred by a patient.
DELIMITER //

CREATE PROCEDURE GetTotalTreatmentCost(
    IN p_patientID INT,
    OUT total_cost DECIMAL(10,2)
)
BEGIN
    SELECT SUM(t.treatmentCost)
    INTO total_cost
    FROM Treatments t
    INNER JOIN Appointments a
    ON t.appointmentID = a.appointmentID
    WHERE a.patientID = p_patientID;
END //

DELIMITER ;

CALL GetTotalTreatmentCost(101, @cost);
SELECT @cost;
