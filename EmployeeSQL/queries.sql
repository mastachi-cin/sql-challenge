-- Verify data import process
select * from departments;

select * from titles;

select * from employees;

select * from dept_emp;

select * from dept_manager;

select * from salaries;

-- 1. List of each employee: employee number, last name, first name, sex, and salary
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees e
left join salaries s on s.emp_no = e.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986
select first_name, last_name, hire_date
from employees
where extract(year from hire_date) = '1986';

-- 3. List the manager of each department: department number, department name, the manager's employee number, last name, first name
select d.*, dm.emp_no, e.first_name, e.last_name
from departments d
inner join dept_manager dm on dm.dept_no = d.dept_no
inner join employees e on e.emp_no = dm.emp_no;

-- 4. List the department of each employee: employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
inner join dept_emp de on de.emp_no = e.emp_no
inner join departments d on d.dept_no = de.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules' 
and last_name = 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
inner join dept_emp de on de.dept_no = d.dept_no
inner join employees e on e.emp_no = de.emp_no
where d.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments d
inner join dept_emp de on de.dept_no = d.dept_no
inner join employees e on e.emp_no = de.emp_no
where d.dept_name IN ('Sales', 'Development');

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name
select last_name, count(last_name) AS last_name_count
from employees
group by last_name
order by last_name_count desc;

-- Bonus
select t.title_name, round(avg(salary),2) as average_salary
from salaries s
inner join employees e on e.emp_no = s.emp_no
inner join titles t on t.title_id = e.title_id
group by title_name;

-- Employee ID number = 499942
select e.emp_no, e.last_name, e.first_name, e.sex, t.title_name, s.salary
from employees e
inner join salaries s on s.emp_no = e.emp_no
inner join titles t on t.title_id = e.title_id 
where e.emp_no = 499942;