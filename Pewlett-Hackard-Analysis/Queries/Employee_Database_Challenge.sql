-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;


-- Challenge 7

-- Deliverable 1/Retiring Employees by Title

SELECT * FROM dept_info;
SELECT * FROM titles;
SELECT * FROM current_emp;
SELECT * FROM employees;

-----------------------------------------------------

SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		ti.title,
		ti.from_date,
		ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ti.emp_no ASC;

-- Remove Duplicates
SELECT  e.emp_no,
		e.first_name,
		e.last_name,
		ti.title
INTO unique_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
AND ti.to_date = ('9999-01-01')
ORDER BY ti.emp_no ASC;

--- Deliverable 2
SELECT DISTINCT ON(e.emp_no) e.emp_no, 
    e.first_name, 
    e.last_name, 
    e.birth_date,
    de.from_date,
    de.to_date,
    ti.title
INTO mentorship_eligibilty
FROM employees as e
Left outer Join dept_employees as de
ON (e.emp_no = de.emp_no)
Left outer Join titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no ASC;