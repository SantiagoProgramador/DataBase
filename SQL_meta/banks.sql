CREATE DATABASE db_banks;
USE db_banks;

#HERE STARTS THE STRONG ENTITIES
CREATE TABLE banks(
bank_code decimal(10) PRIMARY KEY,
bank_name varchar(30) UNIQUE,
foundation_date DATE
);

CREATE TABLE costumers (
account_number INT PRIMARY KEY,
costumer_name varchar(35) NOT NULL,
phone varchar(25),
addres varchar(25),
gender varchar(4) CHECK(gender in ("M","F","Other")),
balance decimal(6) CHECK(balance >= 0)
);

CREATE TABLE guards (
guard_name varchar (35) NOT	NULL,
guard_id INT PRIMARY KEY,
phone varchar (25),
gender varchar(4) CHECK(gender in ("M","F","Other")),
salary DECIMAL(8,2) CHECK(salary  BETWEEN 500 AND 2000)
);

CREATE TABLE positions (
position_code INT PRIMARY KEY auto_increment,
position_name varchar (35) NOT NULL unique,
position_description varchar(200)
);
#HERE ENDS THE STRONG ENTITIES.

CREATE TABLE branches (
 branch_code INT PRIMARY KEY auto_increment,
 location varchar(35) NOT NULL,
 city varchar(35) NOT NULL,
 phone varchar(25)
);

CREATE TABLE employees (
employee_name varchar(35) NOT NULL,
date_of_birth DATE,
gender varchar(4) CHECK(gender in ("M","F","Other")),
employee_code INT PRIMARY KEY AUTO_INCREMENT,
phone VARCHAR(25),
salary DECIMAL(8,2) CHECK(salary  BETWEEN 500 AND 2000),
number_childrens INT CHECK( number_childrens < 4)
);

ALTER TABLE employees ADD COLUMN id_position INT;


create table atms (
number_atm  int primary key AUTO_INCREMENT,
ubication varchar(35) NOT NULL,
deposit decimal check (deposit < 30000)
);

ALTER TABLE atms ADD COLUMN id_branch INT;
ALTER TABLE atms ADD CONSTRAINT fk_branches3 foreign key(id_branch) references branches(branch_code);

create table attentions (
date_attention DATE not null,
duration_attention int check(duration_attention BETWEEN 5 and 20),
id decimal(12) primary key,
id_costumer int not null,
id_branch int not null,
CONSTRAINT fk_costumers FOREIGN KEY(id_costumer) references costumers (account_number),
CONSTRAINT fk_branches FOREIGN KEY(id_branch) REFERENCES branches (branch_code) 
);


CREATE TABLE surveillances (
	surveillance_date DATE NOT NULL,
    news varchar(200), 
    id DECIMAL(12) PRIMARY KEY,
    id_branch INT NOT NULL,
    id_guard INT NOT NULL,
    CONSTRAINT fk_id_branch FOREIGN KEY(id_branch) REFERENCES branches(branch_code),
    CONSTRAINT fk_id_guard FOREIGN KEY(id_guard) REFERENCES guards(guard_id)
);

