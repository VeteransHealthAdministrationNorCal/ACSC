/* VhaCdwDwhSql33.vha.med.va.gov */
SELECT DISTINCT
  SPatient.patientssn as Patient_SSN,
  SPatient.PatientICN as Patient_ICN,
  SPatient.PatientSID,
  ICD10.ICD10SID,
  ICD10.ICD10Code,
  Description.ICD10Description
FROM
  lsv.bisl_r1vx.ar3y_spatient_spatient as SPatient
  INNER JOIN LSV.Outpat.ProblemList as ProblemList
    ON SPatient.PatientSID = ProblemList.PatientSID
	AND SPatient.Sta3n = ProblemList.Sta3n
  INNER JOIN LSV.Dim.ICD10 as ICD10
    ON ProblemList.ICD10SID = ICD10.ICD10SID
	AND ProblemList.Sta3n = ICD10.Sta3n
  INNER JOIN LSV.Dim.ICD10DescriptionVersion as Description
    ON ICD10.ICD10SID = Description.ICD10SID
	AND ICD10.Sta3n = Description.Sta3n
WHERE
  SPatient.sta3n = '612'
  AND spatient.patientsid != '0'
  AND spatient.deceasedflag != 'Y'
  AND SPatient.PatientName NOT LIKE 'zz%'
  AND (
    ICD10.ICD10Code like 'I50.%' -- heart failure
	OR ICD10.ICD10Code like 'E08.%' --diabetes mellitus
	OR ICD10.ICD10Code like 'E09.%' --diabetes mellitus
	OR ICD10.ICD10Code like 'E10.%' --diabetes mellitus
	OR ICD10.ICD10Code like 'E11.%' --diabetes mellitus
	OR ICD10.ICD10Code like 'E13.%' --diabetes mellitus
	OR ICD10.ICD10Code like 'J44.%' -- copd
  )