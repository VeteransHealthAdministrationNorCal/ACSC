/* VhaCdwDwhSql33.vha.med.va.gov */
SELECT
  S1.Patient_ICN,
  S3.Patient_SSN,
  S3.Patient_Name,
  S1.VISN,
  S3.Sta3n,
  S1.Gender,
  S1.Age,
  S1.State,
  S1.City,
  S1.ZIP,
  S1.State_code,
  S1.County_code,
  S1.FIPS,
  S1.Census_tract,
  S1.LON,
  S1.LAT,
  S3.pMort_90d,
  S3.pMort_1y,
  S3.cMort_90d,
  S3.cMort_1y,
  S3.Risk_Date,
  S4.ICD10SID as ICD10_SID,
  S4.ICD10Code as ICD10_Code,
  S4.ICD10Description as ICD10_Description
FROM
  D05_VISN21Sites.MAC.ACSC_Stage_1 as S1
  FULL OUTER JOIN D05_VISN21Sites.MAC.ACSC_Stage_3 as S3
    ON S1.Patient_ICN = S3.Patient_ICN
  FULL OUTER JOIN D05_VISN21Sites.MAC.ACSC_Stage_4 as S4
    ON S1.Patient_ICN = S4.Patient_ICN
WHERE
  S1.County_code IS NOT NULL
  AND (S3.Risk_Date IS NOT NULL
  OR S4.ICD10Code IS NOT NULL)