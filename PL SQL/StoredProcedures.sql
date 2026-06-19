CREATE TABLE savings_accounts (
    account_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    balance NUMBER
);


CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    department VARCHAR2(50),
    salary NUMBER
);


CREATE TABLE accounts (
    account_id NUMBER PRIMARY KEY,
    account_holder VARCHAR2(50),
    balance NUMBER
);

INSERT INTO savings_accounts VALUES (1,'Rahul',10000);
INSERT INTO savings_accounts VALUES (2,'Amit',20000);
INSERT INTO savings_accounts VALUES (3,'Priya',15000);


INSERT INTO employees VALUES (101,'John','IT',50000);
INSERT INTO employees VALUES (102,'Sara','HR',40000);
INSERT INTO employees VALUES (103,'Mike','IT',60000);


INSERT INTO accounts VALUES (1,'Rahul',5000);
INSERT INTO accounts VALUES (2,'Amit',3000);


COMMIT;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS

BEGIN

UPDATE savings_accounts
SET balance = balance + (balance * 1 / 100);

COMMIT;

END;
/

BEGIN
ProcessMonthlyInterest;
END;
/

SELECT * FROM savings_accounts;


CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
dept_name VARCHAR2,
bonus_percent NUMBER
)

IS

BEGIN

UPDATE employees
SET salary = salary + (salary * bonus_percent / 100)
WHERE department = dept_name;


COMMIT;

END;
/

BEGIN

UpdateEmployeeBonus('IT',10);

END;
/

SELECT * FROM employees;


CREATE OR REPLACE PROCEDURE TransferFunds
(
from_account NUMBER,
to_account NUMBER,
amount NUMBER
)

IS

source_balance NUMBER;


BEGIN


SELECT balance
INTO source_balance
FROM accounts
WHERE account_id = from_account;


IF source_balance >= amount THEN


UPDATE accounts
SET balance = balance - amount
WHERE account_id = from_account;


UPDATE accounts
SET balance = balance + amount
WHERE account_id = to_account;


COMMIT;


ELSE

DBMS_OUTPUT.PUT_LINE('Insufficient Balance');


END IF;


END;
/

BEGIN

TransferFunds(1,2,1000);

END;
/

SELECT * FROM accounts;