/*newbook table ����*/
CREATE TABLE newbook(
bookid  NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));

SELECT * FROM newbook;

/*newcustomer table ����*/
CREATE TABLE newcustomer(
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));

/*neworders table ����*/
CREATE TABLE neworders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE);

/*�Ӽ� �߰�*/
ALTER TABLE newbook ADD isbn VARCHAR2(13);

/*������� ����*/
ALTER TABLE newbook MODIFY isbn NUMBER;

SELECT * FROM newbook;
SELECT * FROM newcustomer;
SELECT * FROM neworders;

/*table ����*/
DROP TABLE newbook;

SELECT * from book;

/*Ʃ�� �߰�*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(11, '����������','�Ѽ����м���',90000);

INSERT INTO book(bookid,bookname,publisher)
VALUES(14,'����������','�Ѽ����м���');

SELECT * FROM imported_book;

/*�뷮 ����*/
INSERT INTO book(bookid, bookname,publisher,price)
SELECT bookid,bookname,publisher,price
FROM imported_book;

SELECT * FROM customer;

/*������Ʈ*/
UPDATE customer
SET address='���ѹα� �λ�'
WHERE custid=5;

update customer
set address=(select address
                from customer
                where name='�迬��')
where name='�ڼ���';

/*Ʃ�û���*/
delete from customer
where custid=5;

select * from customer;

Rollback;
