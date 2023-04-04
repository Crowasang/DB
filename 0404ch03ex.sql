/*�������� ������ ������ ���ǻ� ��*/
SELECT count(publisher)
FROM book, orders
WHERE book.bookid=orders.bookid and custid=1;

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT bookname, book.price, book.price-orders.saleprice
FROM book, orders
WHERE orders.bookid = book.bookid and custid=1;

/*�������� �������� ���� ������ �̸�*/
SELECT DISTINCT bookname
FROM book, orders
WHERE orders.bookid = book.bookid and NOT custid=1;

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT name
FROM customer
WHERE NOT custid IN(SELECT custid
                    FROM orders);

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT sum(saleprice), avg(saleprice)
FROM orders;

/*���� �̸��� ���� ���ž�*/
SELECT name, SUM(saleprice)
FROM customer, orders 
WHERE customer.custid=orders.custid
GROUP BY customer.name;

/*���� �̸��� ���� ������ ���� ���*/
SELECT customer.name, book.bookname
FROM customer, orders, book
WHERE orders.custid = customer.custid and orders.bookid=book.bookid;

/*������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�*/
SELECT book.price, max(b1.saleprice)
FROM book, orders
WHERE 

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
