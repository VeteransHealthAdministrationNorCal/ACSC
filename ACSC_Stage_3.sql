/* VhaCdwDwhSql33.vha.med.va.gov */
;WITH
x AS (
  select
    ACSC.patient_icn as Patient_ICN,
    ACSC.patient_ssn as Patient_SSN,
    ACSC.patient_name as Patient_Name,
    ACSC.sta3n as Sta3n,
    ROUND(ACSC.pmort_90d, 3, 0) as pMort_90d,
    ROUND(ACSC.pmort_1y, 3, 0) as pMort_1y,
    ACSC.cmort_90d as cMort_90d,
    ACSC.cmort_1y as cMort_1y,
    CONVERT(VARCHAR, ACSC.riskdate, 101) as Risk_Date,
    rn = ROW_NUMBER() OVER 
    (PARTITION BY ACSC.patient_icn ORDER BY ACSC.riskdate DESC)
  from
    D05_VISN21Sites.MAC.ACSC_Stage_2 as ACSC
  where
    ACSC.riskdate >= CAST(DATEADD(MONTH, -12, GETDATE()) as date)
  group by
    ACSC.patient_icn,
    ACSC.patient_ssn,
    ACSC.patient_name,
    ACSC.sta3n,
    ACSC.pmort_90d,
    ACSC.pmort_1y,
    ACSC.cmort_90d,
    ACSC.cmort_1y,
    ACSC.riskdate
)
SELECT
  patient_icn,
  patient_ssn,
  patient_name,
  sta3n,
  pmort_90d,
  pmort_1y,
  cmort_90d,
  cmort_1y,
  risk_date
FROM
  x
WHERE
  rn = 1