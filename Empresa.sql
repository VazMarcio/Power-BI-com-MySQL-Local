create database Empresa;
use Empresa;

CREATE TABLE Department (
  Dnumber INT PRIMARY KEY,
  Dname VARCHAR(50) NOT NULL,
  Mgr_ssn VARCHAR(11),
  Mgr_start_date DATE
);

CREATE TABLE Dependent (
  Essn VARCHAR(11),
  Dependent_name VARCHAR(50),
  Sex CHAR(1),
  Bdate DATE,
  Relationship VARCHAR(25),
  PRIMARY KEY (Essn, Dependent_name)
);

CREATE TABLE Dep_Locations (
  Dnumber INT,
  Dlocation VARCHAR(50),
  PRIMARY KEY (Dnumber, Dlocation),
  FOREIGN KEY (Dnumber) REFERENCES Department(Dnumber)
);

CREATE TABLE Employee (
  Ssn VARCHAR(11) PRIMARY KEY,
  Fname VARCHAR(50),
  Lname VARCHAR(50),
  Bdate DATE,
  Address VARCHAR(100),
  Sex CHAR(1),
  Salary DECIMAL(10,2),
  Super_ssn VARCHAR(11),
  Dno INT,
  FOREIGN KEY (Dno) REFERENCES Department(Dnumber),
  FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn)
);

CREATE TABLE Project (
  Pnumber INT PRIMARY KEY,
  Pname VARCHAR(50),
  Plocation VARCHAR(50),
  Dnum INT,
  FOREIGN KEY (Dnum) REFERENCES Department(Dnumber)
);


CREATE TABLE Works_on (
  Essn VARCHAR(11),
  Pno INT,
  Hours DECIMAL(4,1),
  PRIMARY KEY (Essn, Pno),
  FOREIGN KEY (Essn) REFERENCES Employee(Ssn),
  FOREIGN KEY (Pno) REFERENCES Project(Pnumber)
);


