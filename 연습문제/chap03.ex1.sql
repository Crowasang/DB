/*���� ��ȣ�� 1�� ������ �̸�*/
SELECT bookname
FROM book
WHERE bookid=1;

/*������ 20000�� �̻��� ������ �̸�*/
SELECT bookname
FROM book
WHERE price>=20000;

/*�������� �ѱ��ž�*/
SELECT SUM(saleprice)
FROM orders
WHERE custid=1;

/*�������� �ѱ��ž�2*/
SELECT SUM(saleprice)
FROM orders, customer
WHERE customer.custid=orders.custid and customer.name Like '������';

/*�������� ������ ������ ��*/
SELECT COUNT(*)
FROM orders, customer
WHERE orders.custid=customer.custid and customer.name LIKE '������';

/*�������� ������ ������ ���ǻ� ��*/
SELECT COUNT(publisher)
FROM book, orders
WHERE orders.bookid = book.bookid and orders.custid=1;