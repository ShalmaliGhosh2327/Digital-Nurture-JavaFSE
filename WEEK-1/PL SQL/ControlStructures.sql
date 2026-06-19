CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    age NUMBER,
    balance NUMBER,
    loan_interest_rate NUMBER
);


CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    due_date DATE
);


INSERT INTO customers VALUES (1,'Rahul',65,15000,8);
INSERT INTO customers VALUES (2,'Amit',45,8000,9);
INSERT INTO customers VALUES (3,'Priya',70,20000,7);
INSERT INTO customers VALUES (4,'Neha',30,12000,8);


INSERT INTO loans VALUES (101,1,SYSDATE+10);
INSERT INTO loans VALUES (102,2,SYSDATE+40);
INSERT INTO loans VALUES (103,3,SYSDATE+20);

COMMIT;

DECLARE

BEGIN

FOR customer_record IN 
(
    SELECT customer_id, age, loan_interest_rate
    FROM customers
)

LOOP

    IF customer_record.age > 60 THEN

        UPDATE customers
        SET loan_interest_rate = loan_interest_rate - 1
        WHERE customer_id = customer_record.customer_id;

    END IF;

END LOOP;

COMMIT;

END;
/

SELECT * FROM customers;

ALTER TABLE customers
ADD isVIP VARCHAR2(5);

DECLARE

BEGIN

FOR customer_record IN
(
SELECT customer_id,balance
FROM customers
)

LOOP

IF customer_record.balance > 10000 THEN

UPDATE customers
SET isVIP='TRUE'
WHERE customer_id=customer_record.customer_id;

ELSE

UPDATE customers
SET isVIP='FALSE'
WHERE customer_id=customer_record.customer_id;

END IF;

END LOOP;

COMMIT;

END;
/

SELECT * FROM customers;

SET SERVEROUTPUT ON;


DECLARE

BEGIN

FOR loan_record IN
(
SELECT loan_id,customer_id,due_date
FROM loans
WHERE due_date <= SYSDATE + 30
)

LOOP

DBMS_OUTPUT.PUT_LINE(
'Reminder: Customer '||
loan_record.customer_id||
' loan '||
loan_record.loan_id||
' is due on '||
loan_record.due_date
);

END LOOP;


END;
/