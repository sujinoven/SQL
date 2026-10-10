# SQL Learning and Practice

A collection of MySQL practice scripts and chapter-wise exercises documenting my SQL learning journey. The examples cover relational databases, data retrieval, joins, aggregations, subqueries, stored procedures, and window functions.

The exercises use student, sales, e-commerce, and hospital data to practice answering practical questions with SQL.

## Topics Covered

- **Database design:** creating databases and tables, data types, primary keys, and foreign keys.
- **Data insertion and schema changes:** `INSERT INTO` and `ALTER TABLE`.
- **Data retrieval:** `SELECT`, `WHERE`, `IN`, `ORDER BY`, and `LIMIT`.
- **Aggregations:** `COUNT()`, `SUM()`, `AVG()`, `MAX()`, `GROUP BY`, and `HAVING`.
- **Joins:** inner, left, right, cross, and self joins.
- **Combining results:** `UNION`.
- **Subqueries:** filtering records using results from another query.
- **Stored procedures:** reusable queries with `IN` and `OUT` parameters.
- **Window functions:** `RANK()`, `DENSE_RANK()`, `LAG()`, `LEAD()`, and running totals.

## Repository Guide

| File or Folder | Contents |
|---|---|
| `Practice/Students-DB_practice.sql` | Student database with students, courses, enrollments, and sample records |
| `Practice/SQL_PRactice.sql` | E-commerce queries covering filtering, aggregation, joins, subqueries, ranking, and procedures |
| `Practice/joins_practice.sql` | Join exercises using hospital data |
| `Tasks/Chapter_1_Task/` | Chapter 1 task sheet |
| `Tasks/Chapter_2_Task/` | Sales database script, sample data spreadsheets, database diagram, and task sheet |
| `Tasks/Chapter_3_Task/` | Filtering and sorting exercises using sales data |
| `Tasks/Chapter_4_Task/` | Aggregate functions, grouped summaries, and subqueries |
| `Tasks/Chapter_5_Task/` | Hospital database tables, sample data, and join exercises |
| `Tasks/Chapter_6_Task/` | Stored procedures and window-function exercises |
| `04. SQL Course.pdf` | SQL course reference material |

## Practice Highlights

### Student Database

[View the script](Practice/Students-DB_practice.sql)

Creates a `studentsdb` database with three related tables:

- `students`
- `courses`
- `enrollment`

Demonstrates auto-incrementing primary keys, foreign-key relationships, inserting records, and basic queries.

### Sales Data Exercises

[Explore the tasks](Tasks/Chapter_2_Task/)

Uses the `sales_management` database to practice working with customers, products, employees, orders, and payments.

Exercises include identifying high-credit customers, finding low-stock products, filtering orders by status, summarizing payments, and comparing values against averages.

### Hospital Database Exercises

[View the script](Tasks/Chapter_5_Task/Chapter_5_Answer.sql)

Defines patient, doctor, department, appointment, treatment, billing, and employee tables.

The exercises explore relationships between patients and appointments, doctors and departments, treatment records, bills, and employee reporting structures.

### Stored Procedures and Window Functions

[Explore Chapter 6](Tasks/Chapter_6_Task/)

Includes procedures for retrieving patient appointments and calculating a patient’s total treatment cost.

Window-function exercises cover patient rankings, cumulative treatment costs, and comparisons with previous or next treatment costs.

## Getting Started

### Requirements

- MySQL 8.0 or later for the window-function exercises.
- MySQL Workbench or another compatible SQL client.

### Clone the Repository

```bash
git clone https://github.com/sujinoven/SQL.git
cd SQL
```

Alternatively, download and extract the repository ZIP from GitHub.

### Run the Exercises

1. Connect your SQL client to a local MySQL server.
2. Start with `Practice/Students-DB_practice.sql`.
3. Execute statements section by section and inspect the results.
4. Prepare the sales database before working through Chapters 3 and 4.
5. Prepare the hospital database from Chapter 5 before running the hospital join exercises and Chapter 6 scripts.

## Setup Notes

These scripts capture ongoing practice and require some preparation:

- `Practice/SQL_PRactice.sql` expects an existing `ecommerce_db`; its setup script is not included.
- The Chapter 2 script references `orders`, `payments`, and `orderdetails` without defining those tables. Create the missing tables before running the related statements.
- The Chapter 5 script attempts to add a primary key to `Appointments` after already defining it. Skip the duplicate statement.
- Some queries need corrections or missing semicolons before execution. Table-name capitalization may also need to match your MySQL environment.

Use a dedicated practice database and run selected sections while learning.

## Learning Goal

Build confidence in relational database design and SQL querying, with a focus on skills useful for data analysis and AI/ML work.

## Author

Maintained by [SUJINOVEN](https://github.com/sujinoven).
