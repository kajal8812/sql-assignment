create table Employee(Empno int,Empname varchar(10),Job varchar(10),Mgr int, HireDate date ,Salary int,Comm int,Deptno int);



insert into Employee values('325','Smith','Clerk',433,'1995-01-11','3500','1400','20');
insert into Employee values( 825,'James','Clerk',466,'1981-08-02',2975,null,20);
insert into Employee values( 433  ,'James','Analyst',825 ,'1989-12-03',3500,null,40);
insert into Employee values( 466,'Mike','President',null,'1997-11-18',7000,null,30);
insert into Employee values( 889,'Adams','Manager',433,'1987-05-23',3250,0,10);
insert into Employee values( 435,'Blake','Analyst',889 ,'1989-12-03',4500,0,40);

create table Department(Deptno int,Dname varchar(255),Loc varchar(255));

insert into Department values(10,'Accounting','Chicago');
insert into Department values(20,'Research','Dallas');
insert into Department values(30,'Sales','NewYork');
insert into Department values(40,'Operations','Boston');
insert into Department values(50,'Purchase','Los Angeles');


// to demonstrate DQL Command:
select * from Employee;
select * from Department;
select Empno,EmpName,job from Employee;
select Deptno,Dname from Department;
select distinct job from employee;

// to demonstrate DQL Command using operators:
select Empname from Employee where job like 'Analyst' and salary>2000;
select Empname from Employee where comm is null;
select Empname from Employee where job in ('Clerk','Analyst','Manager') and salary>3000;
select Empname from Employee where deptno in (10,20,40) or job in ('clerk','analyst');
select e.Empname,e.deptno,d.dname from Employee as e,Department as d where d.deptno=e.deptno and d.dname='Research';
select * from Employee where Empname LIKE 'B%e';


 
// QUERIES:

SELECT JOB,empname FROM employee WHERE DEPTNO between 10 and 20;
select job from employee where deptno not in (10);
select empname  from employee where salary*1.2>3000;
select * from employee where job != 'Manager';

//to demonstrate DQL Command using aggregate and character 
functions:

select count(*) from employee;
select count(*) from employee e,department d where e.deptno=d.deptno and dname='Accounting';
select sum(salary) from employee;
select deptno,avg(salary),max(salary),min(salary),sum(salary) from employee  group by deptno order by deptno;
select deptno,count(*),avg(salary),max(salary),min(salary),sum(salary) from employee group by deptno having count(*)>2;

 
 select current_date 
select empname,salary*12 annualsalary from employee;
 

//  SQL Queries using clauses:
select job,count(*) from employee group by job;
select job,sum(salary) from employee group by job having sum(salary)>50000;
select empno,empname,deptno,salary from employee order by empname,deptno,salary;
select empname,salary*12 annualsalary from employee order by annualsalary desc;

	
// SQL Queries using subqueries:

select empname from employee where salary=(select max(salary) from employee);
select empname from employee where salary>(select avg(salary) from employee);
select empname from employee where salary>(select salary from employee where deptno=30);
select empname from employee where salary>(select salary from employee e,department d  where e.deptno=d.deptno 
and d.dname='Sales');
select empname from employee where mgr in (select empno from employee where empname='James');
select empname from employee where mgr in (select empno from employee where empname='James') and 
salary>=(select avg(salary) from employee);

// SQL Queries using joins:
select e.empno,e.empname ,e.deptno,d.dname from employee e,department d where e.deptno=d.deptno;
select e1.empname ename , e2.empname manager from employee e1,employee e2 where e1.mgr=e2.empno;
select e1.empname ename  from employee e1,employee e2 where e1.mgr=e2.empno and e1.deptno=e2.deptno;
select * from employee e1 left join department d1 on e1.deptno=d1.deptno;
select * from employee e1 right join department d1 on e1.deptno=d1.deptno;
select * from employee e1 full outer join department d1 on e1.deptno=d1.deptno;

// SQL Queries on integrity constraints:


create table Cust_dtls (cust_no int unique not null,cust_name varchar(50) check (upper(cust_name)= cust_name),
cust_city varchar(20) check (cust_city like 'H%'));

alter table employee add primary key(empno);
alter table employee alter column empname set not null;
alter table employee alter column comm set default 0;

alter table employee add constraint FK_Employee  foreign key (mgr) references Employee (empno);

SELECT conname, contype FROM pg_catalog.pg_constraint;

alter table department add unique(loc);
alter table department drop constraint department_loc_key;
alter table cust_dtls drop constraint cust_dtls_cust_name_check;


// to demonstrate DDL command:

alter table department add column Budget numeric(10);
alter table department alter column Budget set data type numeric(12);
alter table department alter column Budget set default 5000;
drop table employee;



//to demonstrate DML command: 
ALTER TABLE department RENAME TO dept_details;
delete from dept_details where loc='NewYork';
delete from employee where salary<(select avg(salary) from emp);
update dept_details set deptno=70 , dname='Distribution' where dname='Sales';
select * from dept_details



