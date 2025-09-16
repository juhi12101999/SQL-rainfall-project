# SQL-rainfall-project
🌦️ Rainfall Analysis SQL Project






📌 Project Overview

This project analyzes rainfall patterns across Indian states and districts using SQL.
It helps uncover insights such as:

Districts with extreme rainfall conditions

Seasonal rainfall distribution (Jan–Dec)

State-wise annual rainfall aggregation

Identifying states/districts with missing or extreme rainfall records

🗂️ Dataset Information

The dataset contains rainfall data for Indian states and districts with monthly, seasonal, and annual rainfall measurements.

Column Name	Description
STATE_UT_NAME	State / Union Territory
DISTRICT	District name
JAN–DEC	Monthly rainfall values (mm)
ANNUAL	Total annual rainfall (mm)
REGION	Geographical region of state
🔑 Key SQL Queries

Some important queries from this project:

Retrieve all districts with JAN rainfall > 100 mm

SELECT DISTRICT, JAN 
FROM rainfall 
WHERE JAN > 100;


Show state-wise average Jun–Sep rainfall

SELECT STATE_UT_NAME, AVG(JUN+JUL+AUG+SEP) AS avg_monsoon 
FROM rainfall 
GROUP BY STATE_UT_NAME 
HAVING avg_monsoon > 1500;


Find states with total ANNUAL rainfall > 50,000 mm

SELECT STATE_UT_NAME, SUM(ANNUAL) AS total_rainfall 
FROM rainfall 
GROUP BY STATE_UT_NAME 
HAVING total_rainfall > 50000;


Identify states with no matching rainfall records

SELECT s.STATE_UT_NAME 
FROM state_info s 
LEFT JOIN rainfall r 
ON s.STATE_UT_NAME = r.STATE_UT_NAME 
WHERE r.STATE_UT_NAME IS NULL;

📊 Insights Gained

🌍 Some states consistently record very high annual rainfall.

☀️ Seasonal monsoon rainfall (Jun–Sep) plays a major role in total annual rainfall.

📉 Certain districts have missing rainfall records, highlighting data quality issues.

🔎 Using WHERE filters helped in row-level conditions, while HAVING clauses were useful in aggregated insights.

🛠️ Tech Stack

Database: MySQL

Queries: DDL, DML, Aggregate functions, Joins, Filtering (WHERE, HAVING)

Visualization (optional extension): Power BI / Excel

🚀 How to Use

Clone this repository:

git clone https://github.com/yourusername/rainfall-sql-project.git


Import the SQL file into MySQL:

mysql -u yourusername -p yourdatabase < sql_project_juhi.sql


Run the queries to explore insights.

✨ Future Enhancements

Integrate with Power BI for interactive dashboards

Automate rainfall reports using stored procedures

Build APIs to fetch rainfall insights
