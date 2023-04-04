/*박지성이 구매한 도서의 출판사 수*/
SELECT count(publisher)
FROM book, orders
WHERE book.bookid=orders.bookid and custid=1;

/*박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
SELECT bookname, book.price, book.price-orders.saleprice
FROM book, orders
WHERE orders.bookid = book.bookid and custid=1;

/*박지성이 구매하지 않은 도서의 이름*/
SELECT DISTINCT bookname
FROM book, orders
WHERE orders.bookid = book.bookid and NOT custid=1;

/*주문하지 않은 고객의 이름(부속질의 사용)*/
SELECT name
FROM customer
WHERE NOT custid IN(SELECT custid
                    FROM orders);

/*주문 금액의 총액과 주문의 평균 금액*/
SELECT sum(saleprice), avg(saleprice)
FROM orders;

/*고객의 이름과 고객별 구매액*/
SELECT name, SUM(saleprice)
FROM customer, orders 
WHERE customer.custid=orders.custid
GROUP BY customer.name;

/*고객의 이름과 고객의 구매한 도서 목록*/
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE orders.custid = customer.custid and orders.bookid=book.bookid;

/*도서의 가격과 판매가격의 차이가 가장 많은 주문*/
SELECT book.price, max(b1.saleprice)
FROM book, orders
WHERE 

/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름*/
