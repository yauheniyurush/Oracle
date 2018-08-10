DECLARE
  TYPE nt_type IS TABLE OF NUMBER;
  nt nt_type := nt_type(11, 22, 33, 44, 55, 66); -- ��������� �������

  TYPE aa_type_str IS TABLE OF INTEGER INDEX BY VARCHAR2(10); -- ������������� ������
  aa_str aa_type_str;

  TYPE NumList IS VARRAY(10) OF INTEGER; -- varray
  n NumList := NumList(1, 3, 5, 7);
BEGIN
  -- DELETE
  DBMS_OUTPUT.PUT_LINE('DELETE');
  nt.DELETE(2); -- ������� ������ ������� 
  nt(2) := 2222; -- ��������������� 2-� ������� 
  nt.DELETE(2, 4); -- ������� �������� �� 2-�� �� 4-�
  nt(3) := 3333; -- ��������������� 3-� �������
  nt.DELETE; -- ������� ��� ��������. ��� ��������� ���� varray �������� ������ ��� ������.

  -- TRIM
  DBMS_OUTPUT.PUT_LINE('TRIM');
  nt := nt_type(11, 22, 33, 44, 55, 66);

  nt.TRIM; -- ������� ���� ������� � ����� ���������. ���� �������� ���, ���������� ���������� SUBSCRIPT_BEYOND_COUNT.����� ������� ������, ���������� ��� �������� ���� ���������
  nt.DELETE(4); --  ������� n ��������� � ����� ���������. ���� ��������� ������, ��� n, ������������ ���������� SUBSCRIPT_BEYOND_COUNT 
  nt.TRIM(2); -- TRIM. �������� � ���������� �������� ���������. �.�. ���� ��������� ������� ��� ������ � ������� Delete, ����� Trim() ������ ��� ��������� ����� �������.

  -- Extend
  DBMS_OUTPUT.PUT_LINE('Extend');
  nt := nt_type(11, 22, 33);
  nt.EXTEND(2); -- ��������� n ��������� �� ��������� null � ����� ���������
  nt.EXTEND(2, 1); -- EXTEND(n,i) ��������� n ����� �������� � �������� i � ����� ���������. ���� ��������� ����� NOT NULL ����������, ������ ���� ������ ����� ������������.
  nt.DELETE(5); -- Delete fifth element. ���� �������� ���� ����� ������� � ������� ������ Delete, Extend �� ����� ������������ ������������� �� ���������� ������ ������, � ������� ����� ������� (������� ����� ������)
  nt.EXTEND; -- Append one null element 

  -- Exists
  DBMS_OUTPUT.PUT_LINE('Exists');
  nt := nt_type(1, 3, 5, 7);
  nt.DELETE(2); -- Delete second element. ��� ��������� ��������� ���������� false 
  FOR i IN 1 .. 6 LOOP
    IF nt.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE('n(' || i || ') = ' || n(i));
    ELSE
      DBMS_OUTPUT.PUT_LINE('n(' || i || ') does not exist');
    END IF;
  END LOOP;

  -- First � Last
  -- ��� varray First ������ ���������� �������, Last ������ ���������� �� �� ��������, ��� � Count
  DBMS_OUTPUT.PUT_LINE('First � Last');
  aa_str('Z') := 26;
  aa_str('A') := 1;
  aa_str('K') := 11;
  aa_str('R') := 18;

  DBMS_OUTPUT.PUT_LINE('Before deletions:');
  DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
  DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);

  aa_str.DELETE('A');
  aa_str.DELETE('Z');

  DBMS_OUTPUT.PUT_LINE('After deletions:');
  DBMS_OUTPUT.PUT_LINE('FIRST = ' || aa_str.FIRST);
  DBMS_OUTPUT.PUT_LINE('LAST = ' || aa_str.LAST);

  -- Count
  DBMS_OUTPUT.PUT_LINE('Count');
  DBMS_OUTPUT.PUT('n.COUNT = ' || n.COUNT || ', ');
  DBMS_OUTPUT.PUT_LINE('n.LAST = ' || n.LAST);

  n.EXTEND(3);
  DBMS_OUTPUT.PUT('n.COUNT = ' || n.COUNT || ', ');
  DBMS_OUTPUT.PUT_LINE('n.LAST = ' || n.LAST);

  n.TRIM(5);
  DBMS_OUTPUT.PUT('n.COUNT = ' || n.COUNT || ', ');
  DBMS_OUTPUT.PUT_LINE('n.LAST = ' || n.LAST);

  -- Prior � Next - ���������� ������ �����������/���������� �������� (��� null, ���� �������� ���)
  DBMS_OUTPUT.PUT_LINE('Prior � Next');
  
  nt := nt_type(18, NULL, 36, 45, 54, 63);

  nt.DELETE(4);
  DBMS_OUTPUT.PUT_LINE('nt(4) was deleted.');

  FOR i IN 1 .. 7 LOOP
    DBMS_OUTPUT.PUT_LINE('nt.PRIOR(' || i || ') = ' || nt.PRIOR(i));
    DBMS_OUTPUT.PUT_LINE('nt.NEXT(' || i || ')  = ' || nt.NEXT(i));
  END LOOP;
  
  
  
  /* */

END;
