/*도서 번호가 1인 도서의 이름*/
SELECT bookname
FROM book
WHERE bookid=1;

/*가격이 20000원 이상인 도서의 이름*/
SELECT bookname
FROM book
WHERE price>=20000;

/*박지성의 총구매액*/
SELECT SUM(saleprice)
FROM orders
WHERE custid=1;

/*박지성의 총구매액2*/
SELECT SUM(saleprice)
FROM orders, customer
WHERE customer.custid=orders.custid and customer.name Like '박지성';

/*박지성이 구매한 도서의 수*/
SELECT COUNT(*)
FROM orders, customer
WHERE orders.custid=customer.custid and customer.name LIKE '박지성';

/*박지성이 구매한 도서의 출판사 수*/
SELECT COUNT(publisher)
FROM book, orders
WHERE orders.bookid = book.bookid and orders.custid=1;