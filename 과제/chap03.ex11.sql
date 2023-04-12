/*���� ���̺� ����*/
CREATE TABLE Theater(
theaternumber NUMBER PRIMARY KEY,
theatername VARCHAR2(10),
location VARCHAR2(10));

/*�󿵰� ���̺� ����*/
CREATE TABLE atheater(
theaternumber NUMBER,
atheaternumber NUMBER CHECK(atheaternumber>=1 and atheaternumber<=10),
moviename VARCHAR2(20),
price NUMBER CHECK(price<=20000),
seat NUMBER,
FOREIGN KEY(theaternumber) REFERENCES theater(theaternumber) ON DELETE CASCADE);

DROP TABLE atheater;
DROP TABLE theater;
DROP TABLE Reservation;
DROP TABLE cust;

/*���� ���̺� ����*/
CREATE TABLE Reservation(
theaternumber NUMBER,
atheaternumber NUMBER CHECK(atheaternumber>=1 and atheaternumber<=10),
custid NUMBER PRIMARY KEY,
seatid NUMBER,
day DATE,
FOREIGN KEY(theaternumber) REFERENCES theater(theaternumber) ON DELETE CASCADE);


/*�� ���̺� ����*/
CREATE TABLE cust(
custid NUMBER PRIMARY KEY,
name VARCHAR2(10),
address VARCHAR2(10),
FOREIGN KEY(custid) REFERENCES Reservation(custid));

INSERT INTO Theater values(1,'�Ե�','���');
INSERT INTO Theater values(2,'�ް�','����');
INSERT INTO Theater values(3,'����','���');

INSERT INTO aTheater values(1,1,'����� ��ȭ',15000,48);
INSERT INTO aTheater values(3,1,'���� ��ȭ',7500,120);
INSERT INTO aTheater values(3,2,'��մ� ��ȭ',8000,110);

INSERT INTO Reservation values(3,2,3,15,'2020-09-01');
INSERT INTO Reservation values(3,1,4,16,'2020-09-01');
INSERT INTO Reservation values(1,1,9,48,'2020-09-01');

INSERT INTO cust values(3,'ȫ�浿','����');
INSERT INTO cust values(4,'��ö��','���');
INSERT INTO cust values(9,'�ڿ���','����');

/*��� ������ �̸��� ��ġ�� ���̽ÿ�*/
select theatername, location
from theater;

/*'���'�� �ִ� ������ ���̽ÿ�*/
select *
from theater
where location like '���';

/*'���'�� ��� ���� �̸��� ������������ ���̽ÿ�.*/
select name
from cust
where address like '���'
group by cust.name
order by cust.name;

/*������ 8000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�*/
select theaternumber, atheaternumber, moviename
from atheater
where price<=8000;

/*���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.*/
select *
from cust, reservation, theater
where cust.custid = reservation.custid and reservation.theaternumber = Theater.theaternumber and theater.location = cust.address;

/*������ ���� ��ΰ�*/
select count(theaternumber)
from theater;

/*�󿵵Ǵ� ��ȭ�� ��� ������ ���ΰ�*/
select round(avg(price))
from atheater;

/*2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�*/
select count(custid)
from reservation
where day = '2020-09-01';

/*'����'���忡�� �󿵵� ��ȭ������ ���̽ÿ�.*/
select moviename
from theater, atheater
where atheater.theaternumber = theater.theaternumber and theater.theatername like '����';

/*'����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.*/
select name
from theater, reservation, cust
where reservation.theaternumber = theater.theaternumber and cust.custid = reservation.custid
and theatername like '����';

/*'����'������ ��ü ������ ���̽ÿ�.*/
select sum(price)
from theater, atheater
where atheater.theaternumber = theater.theaternumber and theater.theatername like '����';

/*���庰 �󿵰� ���� ���̽ÿ�.*/
select theater.theaternumber, atheaternumber
from theater LEFT OUTER JOIN atheater
ON theater.theaternumber = atheater.theaternumber;

/*'���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
select *
from theater, atheater
where theater.theaternumber = atheater.theaternumber and location like '���';

/*2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/


/*2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.*/















