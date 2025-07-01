# Task 6: Subqueries & Nested Queries 🚀

## 🎯 Objective
Demonstrate advanced SQL skills using **scalar**, **correlated**, and **derived-table** subqueries within `SELECT`, `WHERE`, and `FROM` clauses.

## 🛠️ Tools
- DB Browser for SQLite  
- MySQL Workbench  

## 📊 Sample Schema

```sql
CREATE TABLE employees (
  emp_id   INTEGER PRIMARY KEY,
  name     TEXT,
  salary   NUMERIC,
  dept_id  INTEGER
);

CREATE TABLE departments (
  dept_id   INTEGER PRIMARY KEY,
  dept_name TEXT,
  location  TEXT
);

CREATE TABLE sales (
  sale_id  INTEGER PRIMARY KEY,
  emp_id   INTEGER,
  amount   NUMERIC,
  FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);
ℹ️ Explanation of Subquery Types
Scalar subqueries return single values for columns (e.g., global avg salary).

Correlated subqueries reference the outer row, executed per row (dept avg, sale count).

Derived tables in FROM aggregate data (avg sale amount).

IN filters against a list (departments in Vijayawada).

EXISTS ensures related rows exist (employees with sales).
