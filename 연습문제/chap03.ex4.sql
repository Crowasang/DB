/*���ο���� ���缭���� �԰�Ǿ���, ������ �� �� ��� �ʿ��� �����Ͱ� �� �ִ��� ã�ƺ��ÿ�.*/
INSERT INTO book
VALUES (15,'����������','���ѹ̵��',10000);

/*'�Ｚ��'���� ������ ������ �����Ͻÿ�.*/
DELETE FROM book WHERE bookname='�Ｚ��';

/*'�̻�̵��'���� ������ ������ �����Ͻÿ�. ������ �� �Ǹ� ������ ������ ���ÿ�.*/
DELETE FROM book WHERE bookname='�̻�̵��';

/*���ǻ�'���ѹ̵��'�� '�������ǻ�'�� �̸��� �ٲٽÿ�*/
UPDATE book
SET publisher='�������ǻ�'
WHERE publisher='���ѹ̵��';

/*���ǻ翡 ���� ������ �����ϴ� ���̺� bookcompany�� �����ϰ��� �Ѵ�. name�� �⺻Ű�̸� ,address, begin�� dateŸ������ �����Ͽ� �����Ͻÿ�*/
CREATE TABLE bookcompany(
name VARCHAR2(20) PRIMARY KEY,
address VARCHAR2(20),
begin DATE);

/*bookcompany ���̺� ���ͳ� �ּҸ� �����ϴ� webaddress�Ӽ��� �߰��Ͻÿ�.*/
ALTER TABLE bookcompany ADD webaddress VARCHAR2(30);

/*bookcompany ���̺� ������ ���� name=�Ѻ���ī����, address=����� ������, begin=1993-01-01, webaddress=http://hanbit.co.kr�� �����Ͻÿ�.*/
INSERT INTO bookcompany(name, address, begin, webaddress)
VALUES('�Ѻ���ī����','����� ������','1993-01-01','http://hanbit.co.kr');

SELECT * FROM bookcompany;
SELECT * FROM orders;