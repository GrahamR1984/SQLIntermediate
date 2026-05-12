SELECT
  ps.PatientId
 
  ,ps.AdmittedDate
 
  ,ps.DischargeDate
 
  ,ps.Hospital
 
  ,ps.Ward
 
  ,DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) + 1 AS LengthOfStay
 
  ,DATEADD(month, 3, ps.DischargeDate) AS AppointmentDate
 
  ,DATEADD(week, -2, ps.AdmittedDate) AS ReminderDate
FROM
  PatientStay ps
WHERE
 --ps.Hospital IN ( 'Oxleas', 'PRUH' )
 --AND 
 ps.AdmittedDate BETWEEN '2024-02-01' AND '2024-02-28'
  --AND ps.Ward LIKE '%Surgery'
  AND ps.Ward LIKE 'D%'
ORDER BY
 ps.AdmittedDate DESC
 , ps.PatientId DESC;
