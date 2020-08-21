-- Create table departments
create table departments (
    dept_no varchar(4) primary key not null,
    dept_name text not null
);

-- Create table titles
create table titles (
    title_id varchar(5) primary key not null,
    title_name text not null
);

-- Create table employees
create table employees (
    emp_no int primary key not null,
    title_id varchar(5) not null,
	birth_date date not null,
	first_name text not null,
	last_name text not null,
	sex varchar(1) not null,
	hire_date date not null,
	foreign key (title_id) references titles(title_id)
);

-- Create table dept_emp
create table dept_emp (
    emp_no int not null,
    dept_no varchar(4) not null,
	primary key (emp_no, dept_no),
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

-- Create table dept_manager
create table dept_manager (
	dept_no varchar(4) not null,
    emp_no int not null,
	primary key (dept_no, emp_no),
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

-- Create table salaries
create table salaries (
    emp_no int primary key not null,
	salary int NOT NULL,
	foreign key (emp_no) references employees(emp_no)
);


