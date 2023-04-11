/*newbook table 생성*/
CREATE TABLE newbook(
bookid  NUMBER PRIMARY KEY,
bookname VARCHAR2(20) NOT NULL,
publisher VARCHAR2(20) UNIQUE,
price NUMBER DEFAULT 10000 CHECK(price > 1000));

SELECT * FROM newbook;

/*newcustomer table 생성*/
CREATE TABLE newcustomer(
custid NUMBER PRIMARY KEY,
name VARCHAR2(20),
address VARCHAR2(20),
phone VARCHAR2(30));

/*neworders table 생성*/
CREATE TABLE neworders(
orderid NUMBER,
custid NUMBER NOT NULL,
bookid NUMBER NOT NULL,
saleprice NUMBER,
orderdate DATE,
PRIMARY KEY(orderid),
FOREIGN KEY(custid) REFERENCES newcustomer(custid) ON DELETE CASCADE);

/*속성 추가*/
ALTER TABLE newbook ADD isbn VARCHAR2(13);

/*제약사항 변경*/
ALTER TABLE newbook MODIFY isbn NUMBER;

SELECT * FROM newbook;
SELECT * FROM newcustomer;
SELECT * FROM neworders;

/*table 삭제*/
DROP TABLE newbook;

SELECT * from book;

/*튜플 추가*/
INSERT INTO book(bookid, bookname, publisher, price)
VALUES(11, '스포츠의학','한솔의학서적',90000);

INSERT INTO book(bookid,bookname,publisher)
VALUES(14,'스포츠의학','한솔의학서적');

SELECT * FROM imported_book;

/*대량 삽입*/
INSERT INTO book(bookid, bookname,publisher,price)
SELECT bookid,bookname,publisher,price
FROM imported_book;

SELECT * FROM customer;

/*업데이트*/
UPDATE customer
SET address='대한민국 부산'
WHERE custid=5;

update customer
set address=(select address
                from customer
                where name='김연아')
where name='박세리';

/*튜플삭제*/
delete from customer
where custid=5;

select * from customer;

Rollback;
