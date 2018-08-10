-- ������ ��������� ������� � ���������� ����� ������
CREATE TYPE XX_TYPE_CHAIR IS TABLE OF VARCHAR2(100);

-- ������ ������� CHAIRS, � ������� ������������ ������� CHAIR_NAME ������������ ��������� �������
CREATE TABLE CHAIRS (ID NUMBER, CHAIR_NAME  XX_TYPE_CHAIR) NESTED TABLE CHAIR_NAME STORE AS NESTED_CHAIRS;

-- ��������� ������ � �������
INSERT INTO CHAIRS VALUES (1, XX_TYPE_CHAIR('����','���������'));

INSERT INTO CHAIRS VALUES (2, XX_TYPE_CHAIR('������','�����','�����'));

-- ������������� ������ � �������
select * from chairs t;

--��������� ��� ���������� ��������� ������� TABLE
select t1.id, t2.* from chairs t1, table(t1.chair_name) t2;
 
-- ��������� �������� THE ��������� ������ ������ �� ��������� �������
select VALUE(t2) from THE (select chair_name from chairs t1 where id = 2) t2;
 
