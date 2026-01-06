# Optimizing MySQL Queries with Window Functions and Subqueries

## Overview
This project demonstrates optimization of slow MySQL queries using
window functions (`ROW_NUMBER`, `RANK`), optimized subqueries, and indexing.
Execution plans are compared before and after optimization.

## Technologies Used
- MySQL 8.0+
- MySQL Workbench
- Window Functions
- EXPLAIN Plan Analysis

## Project Structure
- `sql/` – Database schema and queries
- `explain_plans/` – Execution plan comparison
- `report/` – PDF report with analysis

## Key Optimizations
- Replaced correlated subqueries with window functions
- Added composite indexes
- Reduced full table scans
- Improved query scalability and performance

## How to Run
1. Execute `schema.sql`
2. Run queries from `original_queries.sql`
3. Run optimized queries from `optimized_queries.sql`
4. Compare execution plans using EXPLAIN

## Author
Bola Lokesh  
Data Analyst
