/*�������� ������ ������ ���ǻ� ��*/
SELECT count(Distinct publisher)
FROM book, orders, customer
WHERE book.bookid=orders.bookid and customer.custid=orders.custid and customer.name like'������';

/*�������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
SELECT bookname, book.price, book.price-orders.saleprice
FROM book, orders
WHERE orders.bookid = book.bookid and custid=1;

/*�������� �������� ���� ������ �̸�*/
SELECT bookname
FROM book
WHERE not exists(SELECT bookname
                    from customer, orders
                    WHERE customer.custid=orders.custid
                            and orders.bookid=book.bookid
                            and customer.name like '������');

/*�ֹ����� ���� ���� �̸�(�μ����� ���)*/
SELECT name
FROM customer
WHERE name NOT IN(SELECT name
                    FROM customer, orders
                    WHERE customer.custid=orders.custid);

/*�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
SELECT sum(saleprice), avg(saleprice)
FROM orders;

/*���� �̸��� ���� ���ž�*/
SELECT name, SUM(saleprice) as total
FROM customer, orders 
WHERE customer.custid=orders.custid
GROUP BY name;

/*���� �̸��� ���� ������ ���� ���*/
SELECT name, book.bookname
FROM customer, orders, book
WHERE orders.custid = customer.custid and orders.bookid=book.bookid;

/*������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�*/
SELECT *
FROM book, orders
WHERE book.bookid=orders.bookid and price-saleprice=(select max(price-saleprice)
                                                        from book, orders
                                                        WHERE book.bookid=orders.bookid);

/*������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�*/
SELECT name, avg(saleprice)
FROM customer, orders
WHERE customer.custid=orders.custid
GROUP BY name
HAVING AVG(saleprice) > (SELECT AVG(saleprice) from orders);