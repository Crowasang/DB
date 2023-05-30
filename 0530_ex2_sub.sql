/*중첩질의-where절-비교연산자*/
SELECT orderid, custid, saleprice
FROM orders md
WHERE saleprice > (SELECT AVG(saleprice)
                    FROM orders so
                    WHERE md.custid=so.custid);
                    
/*중첩질의 -in,not in 연산자*/
SELECT sum(saleprice) "total"
FROM orders
WHERE custid IN(SELECT custid
                FROM customer
                WHERE address LIKE '%대한민국%');
                
SELECT orderid, saleprice
FROM orders
WHERE saleprice > ALL(SELECT saleprice
                        FROM orders
                        WHERE custid=3);
                        
/*중첩 질의 -exists, not existsSET연산자*/
SELECT sum(saleprice)"total"
FROM orders od
WHERE exists(select *
                from customer cs
                where address like '%대한민국%' and cs.custid=od.custid);