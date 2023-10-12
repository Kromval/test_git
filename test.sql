DROP DATABASE IF EXISTS hospital;

CREATE DATABASE hospital;

USE hospital;

CREATE TABLE departments (
    id tinyint unsigned PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(100) NOT NULL UNIQUE,
    constraint department_name_not_empty check (department <> '')
);

CREATE TABLE wards (
    id SMALLINT unsigned PRIMARY KEY AUTO_INCREMENT,
    ward varchar(20) NOT NULL UNIQUE,
    departments_id tinyint unsigned NOT NULL,
    constraint ward_name_not_empty CHECK (ward <> '')
);

CREATE TABLE specializations (
    id SMALLINT unsigned PRIMARY KEY AUTO_INCREMENT,
    specialization varchar(1000) NOT NULL UNIQUE,
        CHECK (specialization <> '')
);

CREATE TABLE doctors (
    id SMALLINT unsigned PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(200) NOT NULL,
    last_name varchar(200) NOT NULL,
    salary decimal(8, 2)NOT NULL,
    premium decimal (8, 2)NOT NULL,
        CHECK (last_name <> ''),
        CHECK (first_name <> ''),
        CHECK (salary > 0),
        CHECK (premium > 0)
);

CREATE TABLE specializations_doctors (
    specialization_id SMALLINT unsigned NOT NULL,
    doctor_id SMALLINT unsigned NOT NULL,
    PRIMARY KEY (specialization_id, doctor_id)

);

alter TABLE wards 
    ADD FOREIGN KEY (departments_id) 
        REFERENCES departments (id);

asd