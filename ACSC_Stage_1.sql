/*Vhacdwa01.vha.med.va.gov*/
SELECT DISTINCT
  LEFT(ICN, 10) as Patient_ICN,
  GENDER as Gender,
  AGEALB as Age,
  ST as State,
  CITY_1 as City,
  ZIP_1 as ZIP,
  VISN,
  STATE_FIPS as State_code,
  RIGHT(FIPS, 3) as County_code,
  FIPS,
  TRACT as Census_tract,
  LON,
  LAT
FROM
  PAF_PSSG.OutBox.FY2018_Q2
WHERE
  MARKET IN (
    '21-i',
    '21-h'
  )
  AND ICN IS NOT NULL