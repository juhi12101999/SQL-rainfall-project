create database project;

-- basic select questions
-- Retrieve all columns for all districts
-- ANS
SELECT * 
FROM district_rainfall;
-- Show the STATE_UT_NAME, DISTRICT, and ANNUAL rainfall for each district.
-- ans
SELECT STATE_UT_NAME, DISTRICT, ANNUAL
FROM district_rainfall;

-- where questions
-- Retrieve all districts where JAN rainfall is greater than 100 mm.
-- ans
SELECT *
FROM district_rainfall
WHERE JAN > 100;

-- Show the STATE_UT_NAME, DISTRICT, and ANNUAL rainfall for districts where ANNUAL is more than 3000 mm.
-- ans
SELECT STATE_UT_NAME, DISTRICT, ANNUAL
FROM district_rainfall
WHERE ANNUAL > 3000;

-- having questions
-- Find states where the total ANNUAL rainfall across all districts is more than 50000 mm.
-- ans
SELECT STATE_UT_NAME, SUM(ANNUAL) AS total_annual_rainfall
FROM district_rainfall
GROUP BY STATE_UT_NAME
HAVING SUM(ANNUAL) > 50000;
-- Display states with an average Jun-Sep rainfall greater than 1500 mm.
-- ans 
SELECT STATE_UT_NAME, AVG("Jun-Sep") AS avg_jun_sep_rainfall
FROM district_rainfall
GROUP BY STATE_UT_NAME
HAVING AVG("Jun-Sep") > 1500;

-- filtering and conditions questions
-- Find all districts in Maharashtra with ANNUAL rainfall above 2000 mm.
-- ans
SELECT STATE_UT_NAME, DISTRICT, ANNUAL
FROM district_rainfall
WHERE STATE_UT_NAME = 'MAHARASHTRA'
  AND ANNUAL > 2000;
  
-- Show districts where rainfall in JUL is more than 500 mm and in AUG is more than 500 mm.
-- ans
SELECT STATE_UT_NAME, DISTRICT, JUL, AUG
FROM district_rainfall
WHERE JUL > 500
  AND AUG > 500;
  
-- Display districts where Jun-Sep rainfall is less than 1000 mm.
-- ans
SELECT STATE_UT_NAME, DISTRICT, "Jun-Sep"
FROM district_rainfall
WHERE "Jun-Sep" < 1000;

-- sorting questions
-- List all districts in descending order of ANNUAL rainfall.
-- ans
SELECT STATE_UT_NAME, DISTRICT, ANNUAL
FROM district_rainfall
ORDER BY ANNUAL DESC;

-- Show top 5 districts in Kerala based on ANNUAL rainfall.
-- ans
SELECT STATE_UT_NAME, DISTRICT, ANNUAL
FROM district_rainfall
WHERE STATE_UT_NAME = 'KERALA'
ORDER BY ANNUAL DESC
LIMIT 5;

-- aggregations questions
-- Find the average ANNUAL rainfall for each state.
-- ans 
SELECT STATE_UT_NAME, AVG(ANNUAL) AS avg_annual_rainfall
FROM district_rainfall
GROUP BY STATE_UT_NAME;

-- Count the number of districts in each state.
-- ans
SELECT STATE_UT_NAME, COUNT(DISTRICT) AS district_count
FROM district_rainfall
GROUP BY STATE_UT_NAME;

-- advanced filtered questions
-- Show districts where Jan-Feb rainfall is more than twice the Oct-Dec rainfall.
-- ans
SELECT STATE_UT_NAME, DISTRICT, "Jan-Feb", "Oct-Dec"
FROM district_rainfall
WHERE "Jan-Feb" > 2 * "Oct-Dec";

-- joins questions
-- Show each district with its corresponding region from state_info.
-- ans
SELECT r.DISTRICT, r.STATE_UT_NAME, s.REGION
FROM district_rainfall r
JOIN STATE_UT_NAME AS s
  ON r.STATE_UT_NAME = s.STATE_UT_NAME;
  
-- Show all districts with MAY rainfall > 300, even if their state’s details are missing in state_info.
-- ANS
SELECT r.DISTRICT, r.STATE_UT_NAME, r.MAY, s.REGION
FROM district_rainfall r
LEFT JOIN state_ut_name  s
  ON r.STATE_UT_NAME = s.STATE_UT_NAME
WHERE r.MAY > 300;
-- Show states that have no matching district rainfall records.
-- ans 

SELECT s.STATE_UT_NAME, s.REGION
FROM state_ut_name s
LEFT JOIN district_rainfall r
  ON s.STATE_UT_NAME = r.STATE_UT_NAME
WHERE r.STATE_UT_NAME IS NULL;





