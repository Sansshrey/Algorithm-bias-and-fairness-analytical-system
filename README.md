# Algorithm Bias & Fairness Analytics System

## Overview
A SQL-based analytics system to detect bias in algorithmic decisions 
across demographic groups like gender, race, and education level.

## Tech Stack
- MySQL — Database design and queries
- Python — Data generation (Faker library)
- Power BI — Dashboard visualizations

## Database Design
6 normalized tables:
- users — basic user information
- demographics — gender, race, region, education
- scores — credit score, performance score, risk score
- decisions — algorithm predictions and outcomes
- outcomes — actual vs predicted results
- categories — algorithm metadata
- audit_logs — auto-logged via trigger

## Key Features
- 1000+ records inserted via Python script
- 15+ SQL queries covering JOINs, subqueries, aggregations
- Trigger-based automatic audit logging
- 4 Power BI dashboards for visualization

## SQL Queries Cover
- Approval rate by gender and race
- False positive and true positive rates
- Algorithm accuracy comparison
- Monthly decision trends
- High bias group detection using HAVING clause

## Key Findings
- Approval rates varied by up to 9% across gender groups
- Hispanic group had highest approval rate (50.95%)
- All algorithms showed similar accuracy (~50%) on random data
- No extreme bias group found (all above 40% approval)

## How to Run
1. Run schema.sql in MySQL Workbench
2. Run generate_data.py to insert 1000 records
3. Run queries.sql to see analysis results
4. Open Power BI and connect to bias_fairness_db
