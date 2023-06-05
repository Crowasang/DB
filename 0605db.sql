/*2023.06.05
뷰 생성, 수정, 삭제*/
SELECT *
FROM book;


/*책 제목에 축구가 들어가는 자료만 가상 테이블 생성*/
CREATE VIEW vw_book
AS SELECT *
    FROM book
    WHERE bookname LIKE '%축구%';
    
SELECT *
FROM vw_book;

SELECT *
FROM customer;

/*주소가 대한민국인 고객 자료만 가상 테이블 생성*/
CREATE VIEW vw_customer
AS SELECT *
   FROM customer
   WHERE address LIKE '%대한민국%';

SELECT *
FROM vw_customer;

CREATE OR REPLACE VIEW vw_customer(custid, name, address)
AS SELECT custid, name, address
   FROM customer
   WHERE address LIKE '%영국%';
   
SELECT *
FROM vw_customer;
