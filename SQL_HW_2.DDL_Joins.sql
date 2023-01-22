--Создать таблицу employees

create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

--Наполнить таблицу employees

insert into employees(employee_name) 
values ('User_name_1'),
	   ('User_name_2'),
	   ('User_name_3'),
	   ('User_name_4'),
	   ('User_name_5'),
	   ('User_name_6'),
	   ('User_name_7'),
	   ('User_name_8'),
	   ('User_name_9'),
	   ('User_name_10'),
	   ('User_name_11'),
	   ('User_name_12'),
	   ('User_name_13'),
	   ('User_name_14'),
	   ('User_name_15'),
	   ('User_name_16'),
	   ('User_name_17'),
	   ('User_name_18'),
	   ('User_name_19'),
	   ('User_name_20'),
	   ('User_name_21'),
	   ('User_name_22'),
	   ('User_name_23'),
	   ('User_name_24'),
	   ('User_name_25'),
	   ('User_name_26'),
	   ('User_name_27'),
	   ('User_name_28'),
	   ('User_name_29'),
	   ('User_name_30'),
	   ('User_name_31'),
	   ('User_name_32'),
	   ('User_name_33'),
	   ('User_name_34'),
	   ('User_name_35'),
	   ('User_name_36'),
	   ('User_name_37'),
	   ('User_name_38'),
	   ('User_name_39'),
	   ('User_name_40');
	  
--Создать таблицу salary

create table salary( 
    id serial primary key,
    monthly_salary int not null
);
 
--Наполнить таблицу salary

insert into salary (monthly_salary)
values  (1000),
		(1100),
		(1200),
		(1300),
		(1400),
		(1500),
		(1600),
		(1700),
		(1800),
		(1900),
		(2000),
		(2100),
		(2200),
		(2300),
		(2400),
		(2500);
	

-- Создать таблицу employee_salary

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--Наполнить таблицу employee_salary

insert into employee_salary(employee_id, salary_id)
	values (3, 16),
		   (1, 4),
		   (5, 9),
		   (40, 13),
		   (23, 4),
		   (11, 2),
		   (52, 10),
		   (15, 13),
		   (26, 4),
		   (16, 1),
		   (33, 7),
      	   (43, 12),
		   (7, 4),
		   (21, 9),
		   (48, 16),
		   (19, 15),
		   (17, 11),
		   (4, 10),
		   (66, 13),
		   (35, 4),
		   (75, 4),
		   (29, 9),
		   (31, 13),
		   (62, 6),
		   (37, 2),
		   (55, 10),
		   (9, 13),
		   (59, 4),
		   (27, 14),
		   (22, 7),
      	   (13, 8),
		   (88, 4),
		   (6, 9),
		   (51, 13),
		   (10, 4),
		   (38, 6),
		   (39, 10),
		   (2, 13),
		   (8, 4),
		   (25, 16);
		
--Создать таблицу roles

create table roles(
	id serial primary key,
	role_name int not null unique
);

--Поменять тип столбца role_name int на varchar(30)

alter table roles
alter column role_name type varchar(30);

--Наполнить таблицу roles 20 строками

insert into roles(role_name)
values('Junior Python developer'),
		('Middle Python developer'),
		('Senior Python developer'),
		('Junior Java developer'),
		('Middle Java developer'),
		('Senior Java developer'),
		('Junior JavaScript developer'),
		('Middle JavaScript developer'),
		('Senior JavaScript developer'),
		('Junior Manual QA engineer'),
		('Middle Manual QA engineer'),
		('Senior Manual QA engineer'),
		('Project Manager'),
		('Designer'),
		('HR'),
		('CEO'),
		('Sales manager'),
		('Junior Automation QA engineer'),
		('Middle Automation QA engineer'),
		('Senior Automation QA engineer');

--Создать таблицу roles_employee

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null, 
		foreign key(employee_id) 
			references employees(id),
		foreign key(role_id)
			references roles(id)
	 );

--Наполнить таблицу roles_employee 40 строками
	
insert into roles_employee (employee_id, role_id)
values 	(7,2),
		(20,4),
		(3,9),
		(5,13),
		(23,4),
		(11,2),
		(10,9),
		(22,13),
		(21,3),
		(34,18),
		(6,7),
		(27,1),
		(1,16),
		(38,10),
		(14,5),
		(31,14),
		(8,20),
		(29,15),
		(18,6),
		(9,19),
		(40,18),
		(2,8),
		(25,11),
		(36,17),
		(4,12),
		(19,1),
		(37,20),
		(24,10),
		(12,8),
		(16,16),
		(39,3),
		(35,7),
		(13,14),
		(26,5),
		(15,11),
		(33,15),
		(28,6),
		(30,12),
		(32,19),
		(17,17);  
	
select * from salary;
select * from employees;
select * from roles;
select * from employee_salary;
select * from roles_employee;

-- Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary 
from employees join employee_salary 
					on employees.id = employee_salary.employee_id
		       join salary
		       		on salary.id = employee_salary.salary_id
;

--Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, monthly_salary
from employees join employee_salary 
					on employees.id = employee_salary.employee_id
		       join salary
		       		on salary.id = employee_salary.salary_id
where salary.monthly_salary < 2000
;

--Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employees.employee_name
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		      left join employees
		       		on employees.id = employee_salary.employee_id
where employee_name is null
;

--Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employees.employee_name
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		      left join employees
		       		on employees.id = employee_salary.employee_id
where employee_name is null and monthly_salary < 2000
;

--Найти всех работников кому не начислена ЗП.
select employees.employee_name
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    left join employees
		       		on employees.id = employee_salary.employee_id
where employee_name is null; 

--Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
;

--Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
where roles.role_name like '%Java developer'
;

--Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
where roles.role_name like '%Python developer'
;

--Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
where roles.role_name like '%QA engineer'
;

--Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
where roles.role_name like '%Manual QA engineer'
;

--Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name 
from employees join roles_employee
		       		on employees.id = roles_employee.employee_id
		   	    join roles 
		    		on 	roles.id = roles_employee.role_id 
where roles.role_name like '%Automation QA%'
;

--Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	roles.id = roles_employee.role_iD
where roles.role_name like 'Junior%';

--Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	roles.id = roles_employee.role_iD
where roles.role_name like 'Middle%';

--Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	roles.id = roles_employee.role_iD
where roles.role_name like 'Senior%';

--Вывести зарплаты Java разработчиков
select salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	roles.id = roles_employee.role_iD
where roles.role_name like '%Java developer';

--Вывести зарплаты Python разработчиков
select salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	roles.id = roles_employee.role_iD
where roles.role_name like '%Python developer';

--Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id 
 where ROLES.role_name like 'Junior%Python&developer';

--Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id 
where ROLES.role_name like 'Middle%JavaScript%developer';

--Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_iD
where ROLES.role_name like 'Senior%Java%developer';

--Вывести зарплаты Junior QA инженеров
select salary.monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_iD
where role_name like 'Junior%QA%engineer';


--Вывести среднюю зарплату всех Junior специалистов
select avg(salary.monthly_salary) as avg_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where roles.role_name like 'Junior%' 
;

--Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as sum_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where roles.role_name like '%JavaScript%developer'

--Вывести минимальную ЗП QA инженеров
select min(monthly_salary) as min_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where role_name like '%QA%engineer';

--Вывести максимальную ЗП QA инженеров
select max(monthly_salary) as max_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where role_name like '%QA%engineer';

--Вывести количество QA инженеров
select count(role_name) from roles
where role_name like '%QA%engineer';

--Вывести количество Middle специалистов
select count(role_name) from roles
where role_name like 'Middle%';

--Вывести количество разработчиков
select count(role_name) from roles
where role_name like '%developer';

--Вывести фонд (сумму) зарплаты разработчиков.
select sum(monthly_salary)
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where role_name like '%developer';

--Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
order by monthly_salary asc;

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where monthly_salary between 1700 and 2300
order by monthly_salary asc;	

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where monthly_salary < 2300
order by monthly_salary asc;	

--Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from salary join employee_salary 
					on salary.id = employee_salary.salary_id
		    join employees
		       		on employees.id = employee_salary.employee_id
		    join roles_employee
		    		on employees.id = roles_employee.employee_id
		    join roles 
		    		on 	ROLES.id = roles_employee.role_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary asc
;	   
