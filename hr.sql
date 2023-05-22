create table hr.users (
	user_id serial primary key
);

drop table users cascade;

create table hr.work_orders (
	work_id serial primary key,
	woro_start_date timestamp,
	woro_status varchar(15),
	woro_user_id integer,
	foreign key (woro_user_id) references users(user_id)
);

drop table work_orders cascade;

create table hr.facillities (
	faci_id serial primary key
);

create table hr.service_task (
	seta_id serial primary key
);

create table hr.job_role (
	joro_id serial primary key,
	joro_name varchar(55) unique,
	joro_modified_date timestamp
);

drop table job_role cascade;

create table hr.employee (
	emp_id serial primary key,
	emp_national_id varchar(25) unique,
	emp_birth_date timestamp,
	emp_martial_status char(1),
	emp_gender char(1),
	emp_hire_date timestamp,
	emp_salaried_flag char(1),
	emp_vacation_hours smallint,
	emp_sickleave_hours smallint,
	emp_current_flag smallint,
	emp_photo varchar(255),
	emp_modified_date timestamp,
	emp_emp_id integer,
	foreign key (emp_emp_id) references employee(emp_id),
	emp_joro_id integer,
	foreign key (emp_joro_id) references job_role(joro_id)
);

drop table employee cascade;

create table hr.work_order_detail (
	wode_id serial primary key,
	wode_task_name varchar(255),
	wode_status varchar(15),
	wode_start_date timestamp,
	wode_end_date timestamp,
	wode_notes varchar(255),
	wode_emp_id integer,
	foreign key (wode_emp_id) references employee(emp_id),
	wode_seta_id integer,	
	foreign key (wode_seta_id) references employee(emp_id),
	wode_faci_id integer,
	foreign key (wode_faci_id) references facillities(faci_id),
	wode_woro_id integer,
	foreign key (wode_woro_id) references work_orders(work_id)
);

create table hr.employee_pay_history (
	ephi_emp_id integer,
	ephi_rate_change_date date,
	constraint employee_pay_history_pk primary key (ephi_emp_id,ephi_rate_change_date),
	foreign key (ephi_emp_id) references employee(emp_id),
	ephi_rate_salary money,
	ephi_pay_frequence smallint,
	ephi_modified_date timestamp
);

drop table employee_pay_history cascade;

create table hr.shift (
	shift_id serial primary key,
	shift_name varchar(25) unique,
	shift_start_time timestamp unique,
	shift_end_time timestamp unique
)

create table hr.employee_department_history (
	edhi_id serial ,
	edhi_emp_id integer,
	constraint employee_department_history_pk primary key (edhi_id,edhi_emp_id),
	foreign key (edhi_emp_id) references employee(emp_id),
	edhi_start_date timestamp,
	edhi_end_date timestamp,
	edhi_modified_date timestamp,
	edhi_dept_id integer,
	foreign key (edhi_dept_id) references department(dept_id),
	edhi_shift_id integer,
	foreign key (edhi_shift_id) references shift(shift_id)
);

create table hr.department (
	dept_id serial primary key,
	dept_name varchar(50),
	dept_modified_date timestamp
)

--insert data--

insert into hr.work_order_detail (wode_id,wode_task_name,wode_status,wode_start_date,wode_end_date,wode_notes,
wode_emp_id,wode_seta_idwode_fact_id,wode_woro_id)values
('1','COMPLETED','2023-01-01','2023-02-01','Bisa',1,1,1,1),
('2','CANCELLED','2023-01-02','2023-02-02','Bisa',2,2,2,2),
('3','COMPLETED','2023-01-03','2023-02-03','Bisa',3,3,3,3),
('4','COMPLETED','2023-01-04','2023-02-04','Bisa',4,4,4,4),
('5','COMPLETED','2023-01-05','2023-02-05','Bisa',5,5,5,5),
('6','COMPLETED','2023-01-06','2023-02-06','Bisa',6,6,6,6),
('7','COMPLETED','2023-01-07','2023-02-07','Bisa',7,7,7,7),
('8','CANCELLED','2023-01-08','2023-02-08','Bisa',8,8,8,8),
('9','COMPLETED','2023-01-09','2023-02-09','Bisa',9,9,9,9),
('10','COMPLETED','2023-01-10','2023-02-10','Bisa',10,10,10,10);

insert into hr.department(dept_id,dept_name,dept_modified_date) values
('1','Keuangan','2023-04-01'),
('2','SDA','2023-04-02'),
('3','Pemasaran','2023-04-03'),
('4','Produksi','2023-04-04'),
('5','Penelitian','2023-04-05'),
('6','TI','2023-04-06'),
('7','L.Pelanggan','2023-04-07'),
('8','Pengadaan','2023-04-08'),
('9','Operasional','2023-04-09'),
('10','Kualitas dan Keamanan Product','2023-04-10'),


insert into hr.hr.employee_pay_history (ephi_emp_id, ephi_rate_change_date, ephi_rate_salary, ephi_pay_frequence, ephi_modified_date)
VALUES
    (1, '2023-01-01', 1000000, 1, '2023-01-01'),
    (2, '2023-01-02', 2000000, 2, '2023-01-02'),
    (3, '2023-01-03', 3000000, 1, '2023-01-03'),
    (4, '2023-01-04', 4000000, 2, '2023-01-04'),
    (5, '2023-01-05', 5000000, 1, '2023-01-05'),
    (6, '2023-01-06', 6000000, 2, '2023-01-06'),
    (7, '2023-01-07', 7000000, 1, '2023-01-07'),
    (8, '2023-01-08', 8000000, 2, '2023-01-08'),
    (9, '2023-01-09', 9000000, 1, '2023-01-09'),
    (10, '2023-01-10', 10000000, 2, '2023-01-10');


insert into hr.hr.employee_department_history(edhi_id, edhi_emp_id, edhi_start_date, edhi_end_date, edhi_modified_date, edhi_dept_id, edhi_shift_id)
VALUES
    (1, 1, '2023-01-01', '2023-01-21', '2023-01-11', 1, 1),
    (2, 2, '2023-01-02', '2023-01-22', '2023-01-12', 2, 2),
    (3, 3, '2023-01-03', '2023-01-23', '2023-01-13', 3, 3),
    (4, 4, '2023-01-04', '2023-01-24', '2023-01-14', 4, 4),
    (5, 5, '2023-01-05', '2023-01-25', '2023-01-15', 5, 5),
    (6, 6, '2023-01-06', '2023-01-26', '2023-01-16', 6, 6),
    (7, 7, '2023-01-07', '2023-01-27', '2023-01-17', 7, 7),
    (8, 8, '2023-01-08', '2023-01-28', '2023-01-18', 8, 8),
    (9, 9, '2023-01-09', '2023-01-29', '2023-01-19', 9, 9),
    (10, 10, '2023-01-10', '2023-01-30', '2023-01-20', 10, 10);


insert into hr.job_role (joro_id,joro_name,joro_modified_date)
values
(1, 'Public Accountant','2007/05/27'),
(2, 'Accounting Manager','2007/06/16'),
(3, 'Administration Assistant','2008/10/24'),
(4, 'President','2009/03/31'),
(5, 'Admiistration Vice President','2009/03/31'),
(6, 'Accountant','2008/03/31'),
(7, 'Finance Manager','2009/05/31'),
(8, 'Human Resources Representative','2003/03/17'),
(9, 'Programmer','2008/04/30'),
(10, 'Marketing Manager','2009/05/19');

set datestyle to YMD

select * from job_role

insert into hr.work_orders (work_id,woro_start_date,woro_status,woro_user_id) 
values 
(1, '2001-10-27', 'OPEN',1),
(2, '2005-03-15', 'CLOSED',2),
(3, '2006-07-24', 'CANCELLED',3),
(4, '2007-12-31', 'OPEN',4),
(5, '2007-12-31', 'CANCELLED',5),
(6, '2006-12-31', 'OPEN',6),
(7, '2007-12-31', 'OPEN',7),
(8, '2001-06-17', 'CLOSED',8),
(9, '2006-12-31', 'CANCELLED',9),
(10, '2007-12-19', 'CLOSED',10)



insert into hr.employee (emp_id,emp_national_id,emp_birth_date,emp_martial_status,emp_gender,emp_hire_date,emp_salaried_flag,emp_vacation_hours,emp_sickleave_hours,emp_current_flag,emp_photo,emp_modified_date,emp_emp_id,emp_joro_id)
values
(1, 'Indonesia', '1948-12-08', 'M','F', '1992-05-01', '1', 80, 16,0,'Education includes a BA in psychology from Colorado State University in 1970.','1998-05-01', 1, 1),
(2, 'Amerika', '1950-02-08', 'M', 'M', '1994-05-05', '0', 78, 18,1,'He joined the company as a sales representative,','2000-08-01', 2, 2),
(3, 'Thailand', '1952-02-08', 'S', 'M', '1996-05-08', '0', 70, 11,0,'promoted to sales representative in February 1992.','1997-08-01', 3, 3),
(4, 'Vietnam', '1952-02-08', 'M', 'F', '1996-05-02', '0', 70, 11,1,'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.','1997-08-01', 4, 4),
(5, 'Malaysia', '1952-02-08', 'S', 'M', '1996-05-14', '1', 70, 11,1,'Janet has a BS degree in chemistry from Boston College (1984).  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.','1997-08-01', 5, 5),
(6, 'Kamboja', '1952-02-08', 'S', 'M', '1996-05-24', '1', 70, 11,1,' in 1991 and promoted to sales representative in February 1992.','1997-08-01', 6, 6),
(7, 'Chili', '1952-02-08', 'S', 'M', '1996-05-23', '0', 70, 11,0,'Janet has a BS degree in chemistry from Boston College (1984).','1997-08-01', 7, 7),
(8, 'Singapura', '1952-02-08', 'M', 'F', '1996-05-14', '1', 70, 11,1,'Janet has a BS degree in chemistry from Boston College (1984).  She has also completed a certificate program in food retailing management.','1997-08-01', 8, 8),
(9, 'Kanada', '1952-02-08', 'S', 'F', '1996-05-18', '0', 70, 11,0,'Janet has a BS degree in chemistry from Boston College (1984). ','1997-08-01', 9, 9),
(10, 'German', '1952-02-08', 'M', 'F', '1996-05-20', '0', 70, 11,0,'promoted to sales representative in February 1992.','1997-08-01', 10, 10)



insert into hr.shift (shift_id,shift_name,shift_start_time,shift_end_time)
values
(1, 'Anwar','2007/03/27','2008/05/27'),
(2, 'Sabrina','2005/02/21','2006/04/27'),
(3, 'Joe','2007/08/13','2008/04/14'),
(4, 'Darvin','1994/05/22','2008/02/14'),
(5, 'Sugoy','19922/02/22','2008/01/14'),
(6, 'Justin','19934/02/22','2007/03/14'),
(7, 'Silvi','1992/12/22','2006/05/14'),
(8, 'Anton','1999/04/23','2006/01/14'),
(9, 'Bella','1993/02/22','2007/05/14'),
(10, 'Christ','1998/02/22','2005/06/14')

select * from shift

















