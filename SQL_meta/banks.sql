CREATE DATABASE db_banks;
USE db_banks;

#THEESE ARE THE STRONG ENTITIES.
CREATE TABLE banks (
	bank_code DECIMAL(6) PRIMARY KEY,
    bank_name varchar(30) UNIQUE,
    foundation_date DATE
);

CREATE TABLE costumers (
	account_number INT PRIMARY KEY,
    costumer_name varchar(35) NOT NULL,
    phone varchar(25),
    address varchar(25),
    gender  varchar(4) CHECK(gender in("M","F","other")),
    balance DECIMAL(6) 
);

CREATE TABLE positions (
	position_code INT PRIMARY KEY AUTO_INCREMENT,
    position_name varchar(35) NOT NULL UNIQUE, 
    position_desc varchar(200) 
);

# HERE ENDS THE STRONG ENTITIES.

CREATE TABLE branches (
	branch_code INT PRIMARY KEY AUTO_INCREMENT,
    location varchar(35) NOT NULL, 
    city varchar(35) NOT NULL,
    phone varchar(25) 
);

CREATE TABLE guards
