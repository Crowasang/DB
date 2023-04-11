/*새로운도서가 마당서점에 입고되었다, 삽입이 안 될 경우 필요한 대이터가 더 있는지 찾아보시오.*/
INSERT INTO book
VALUES (15,'스포츠세계','대한미디어',10000);

/*'삼성당'에서 출판한 도서를 삭제하시오.*/
DELETE FROM book WHERE bookname='삼성당';

/*'이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해 보시오.*/
DELETE FROM book WHERE bookname='이상미디어';

/*출판사'대한미디어'를 '대한출판사'로 이름을 바꾸시오*/
UPDATE book
SET publisher='대한출판사'
WHERE publisher='대한미디어';

/*출판사에 대한 정보를 저장하는 테이블 bookcompany를 생성하고자 한다. name은 기본키이며 ,address, begin은 date타입으로 선언하여 생성하시오*/
CREATE TABLE bookcompany(
name VARCHAR2(20) PRIMARY KEY,
address VARCHAR2(20),
begin DATE);

/*bookcompany 테이블에 인터넷 주소를 저장하는 webaddress속성을 추가하시오.*/
ALTER TABLE bookcompany ADD webaddress VARCHAR2(30);

/*bookcompany 테이블에 임의의 투플 name=한빛아카데미, address=서울시 마포구, begin=1993-01-01, webaddress=http://hanbit.co.kr을 삽입하시오.*/
INSERT INTO bookcompany(name, address, begin, webaddress)
VALUES('한빛아카데미','서울시 마포구','1993-01-01','http://hanbit.co.kr');

SELECT * FROM bookcompany;
SELECT * FROM orders;