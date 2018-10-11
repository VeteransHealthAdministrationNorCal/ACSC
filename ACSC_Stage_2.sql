/* VhaCdwDwhSql33.vha.med.va.gov */
SELECT
  spatient.patienticn as Patient_ICN,
  spatient.patientssn as Patient_SSN,
  spatient.patientname as Patient_Name,
  spatient.sta3n as Sta3n,
  can_score.pMort_90d,
  can_score.pMort_1y,
  can_score.cmort_90d as cMort_90d,
  can_score.cmort_1y as cMort_1y,
  can_score.riskdate
FROM 
  lsv.bisl_r1vx.ar3y_spatient_spatient as spatient
  inner join lsv.bisl_collab.canscore_history as can_score
  on spatient.patienticn = can_score.patienticn
WHERE
  spatient.sta3n = '612'
  and spatient.patientsid != '0'
  and spatient.deceasedflag != 'Y'
  and riskDate > CAST(DATEADD(MONTH, -12, GETDATE()) as date)