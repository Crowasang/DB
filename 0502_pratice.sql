/*7장 Summer table*/
DROP TABLE Summer;

CREATE TABLE Summer(
sid NUMBER,
class VARCHAR2(20),
price NUMBER);

INSERT INTO Summer VALUES(100, 'FORTRAN', 20000);
INSERT INTO Summer VALUES(150, 'PASCAL', 15000);
INSERT INTO Summer VALUES(200, 'C', 10000);
INSERT INTO Summer VALUES(250, 'FORTRAN', 20000);

SELECT * FROM Summer;

SELECT sid, class
FROM Summer;

SELECT price
FROM Summer
WHERE class='C';

SELECT DISTINCT class
FROM summer
WHERE price=(SELECT MAX(price)
                FROM summer);
                
SELECT COUNT(*), SUM(price)
FROM summer;

DELETE FROM summer WHERE sid=200;

/*C강좌 수강료 조회*/
SELECT price
FROM summer
WHERE class='c';

INSERT INTO Summer VALUES(NULL, 'JAVA', 25000);

SELECT COUNT(*) as "수강인원"
FROM summer;

SELECT COUNT(sid) as "수강인원"
FROM summer;

SELECT COUNT(*) as "수강인원"
FROM summer
WHERE sid IS NOT NULL;

UPDATE summer
SET price=15000
WHERE class='FORTRAN';

SELECT DISTINCT price as "FORTRAN 수강료"
FROM summer
WHERE class='FORTRAN';

UPDATE summer
SET price=20000
WHERE class='FORTRAN';

UPDATE summer
SET price=15000
WHERE class='FORTRAN' AND sid=100;

DROP TABLE summerprice;
DROP TABLE summerendroll;

CREATE TABLE summerprice(
class VARCHAR2(20),
price NUMBER);

CREATE TABLE summerendroll(
sid INTEGER,
class VARCHAR2(20));

INSERT INTO summerprice VALUES ('FORTRAN',20000);
INSERT INTO summerprice VALUES ('PASCAL',15000);
INSERT INTO summerprice VALUES ('C',10000);

INSERT INTO summerendroll VALUES (100,'FORTRAN');
INSERT INTO summerendroll VALUES (150,'PASCAL');
INSERT INTO summerendroll VALUES (200,'C');
INSERT INTO summerendroll VALUES (250,'FORTRAN');

select * from summerprice;
select * from summerendroll;

select sid, class
from summerendroll;

select price
from summerprice
where class='C';

select distinct class
from summerprice
where price=(select max(price)
                from summerprice);
                
select count(*), sum(price)
from summerprice, summerendroll
where summerprice.class=summerendroll.class;

select price as "C 수강료"
from summerprice
where class='C';


delete from summerendroll where sid=200;

select *
from summerendroll;

insert into summerprice values ('JAVA', 25000);

select *
from summerprice;


update summerprice
set price=15000
where class='FORTRAN';

select price as "FORTRAN 수강료"
from summerprice
where class='FORTRAN';