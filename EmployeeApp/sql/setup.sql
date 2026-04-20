-- ============================================================
-- Assignment 05 – Employee Registration Database Setup
-- Run this script ONCE before starting the application
-- ============================================================

-- 1. Create the database
CREATE DATABASE IF NOT EXISTS employeedb;
USE employeedb;

-- 2. Create the employees table
CREATE TABLE IF NOT EXISTS employees (
    id          INT           AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(50)   NOT NULL,
    last_name   VARCHAR(50)   NOT NULL,
    email       VARCHAR(100)  NOT NULL UNIQUE,
    phone       VARCHAR(15)   NOT NULL,
    department  VARCHAR(60)   NOT NULL,
    designation VARCHAR(80)   NOT NULL,
    salary      DECIMAL(12,2) NOT NULL,
    join_date   DATE          NOT NULL,
    created_at  TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- 3. (Optional) Insert sample data to test
INSERT INTO employees (first_name, last_name, email, phone, department, designation, salary, join_date)
VALUES
  ('Rahul',  'Sharma',  'rahul.sharma@company.com',  '9876543210', 'Engineering',      'Software Engineer',   55000.00, '2024-01-15'),
  ('Priya',  'Patel',   'priya.patel@company.com',   '9123456780', 'Human Resources',  'HR Manager',          60000.00, '2023-06-01'),
  ('Arjun',  'Verma',   'arjun.verma@company.com',   '9988776655', 'Finance',          'Financial Analyst',   52000.00, '2023-11-20');

-- 4. Verify
SELECT * FROM employees;
