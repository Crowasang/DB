/*극장 테이블 생성*/
CREATE TABLE Theater(
theaternumber NUMBER PRIMARY KEY,
theatername VARCHAR2(10),
location VARCHAR2(10));

/*상영관 테이블 생성*/
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

/*예약 테이블 생성*/
CREATE TABLE Reservation(
theaternumber NUMBER,
atheaternumber NUMBER CHECK(atheaternumber>=1 and atheaternumber<=10),
custid NUMBER PRIMARY KEY,
seatid NUMBER,
day DATE,
FOREIGN KEY(theaternumber) REFERENCES theater(theaternumber) ON DELETE CASCADE);


/*고객 테이블 생성*/
CREATE TABLE cust(
custid NUMBER PRIMARY KEY,
name VARCHAR2(10),
address VARCHAR2(10),
FOREIGN KEY(custid) REFERENCES Reservation(custid));

INSERT INTO Theater values(1,'롯데','잠실');
INSERT INTO Theater values(2,'메가','강남');
INSERT INTO Theater values(3,'대한','잠실');

INSERT INTO aTheater values(1,1,'어려운 영화',15000,48);
INSERT INTO aTheater values(3,1,'멋진 영화',7500,120);
INSERT INTO aTheater values(3,2,'재밌는 영화',8000,110);

INSERT INTO Reservation values(3,2,3,15,'2020-09-01');
INSERT INTO Reservation values(3,1,4,16,'2020-09-01');
INSERT INTO Reservation values(1,1,9,48,'2020-09-01');

INSERT INTO cust values(3,'홍길동','강남');
INSERT INTO cust values(4,'김철수','잠실');
INSERT INTO cust values(9,'박영희','강남');

/*모든 극장의 이름과 위치를 보이시오*/
select theatername, location
from theater;

/*'잠실'에 있는 극장을 보이시오*/
select *
from theater
where location like '잠실';

/*'잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
select name
from cust
where address like '잠실'
group by cust.name
order by cust.name;

/*가격이 8000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오*/
select theaternumber, atheaternumber, moviename
from atheater
where price<=8000;

/*극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
select *
from cust, reservation, theater
where cust.custid = reservation.custid and reservation.theaternumber = Theater.theaternumber and theater.location = cust.address;

/*극장의 수는 몇개인가*/
select count(theaternumber)
from theater;

/*상영되는 영화의 평균 가격은 얼마인가*/
select round(avg(price))
from atheater;

/*2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가*/
select count(custid)
from reservation
where day = '2020-09-01';

/*'대한'극장에서 상영된 영화제목을 보이시오.*/
select moviename
from theater, atheater
where atheater.theaternumber = theater.theaternumber and theater.theatername like '대한';

/*'대한'극장에서 영화를 본 고객의 이름을 보이시오.*/
select name
from theater, reservation, cust
where reservation.theaternumber = theater.theaternumber and cust.custid = reservation.custid
and theatername like '대한';

/*'대한'극장의 전체 수입을 보이시오.*/
select sum(price)
from theater, atheater
where atheater.theaternumber = theater.theaternumber and theater.theatername like '대한';

/*극장별 상영관 수를 보이시오.*/
select theater.theaternumber, atheaternumber
from theater LEFT OUTER JOIN atheater
ON theater.theaternumber = atheater.theaternumber;

/*'잠실'에 있는 극장의 상영관을 보이시오.*/
select *
from theater, atheater
where theater.theaternumber = atheater.theaternumber and location like '잠실';

/*2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/


/*2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/















