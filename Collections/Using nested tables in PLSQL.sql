DECLARE
  TYPE XX_TYPE_CHAIR IS TABLE OF VARCHAR2(100);
  CHAIR_NAME XX_TYPE_CHAIR := XX_TYPE_CHAIR();
BEGIN
  FOR I IN 1 .. 5 LOOP
    CHAIR_NAME.EXTEND;
    CHAIR_NAME(I) := '�������� �' || TO_CHAR(I);
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('������ ����������:');
  FOR I IN CHAIR_NAME.FIRST .. CHAIR_NAME.LAST LOOP
    DBMS_OUTPUT.PUT_LINE(CHAIR_NAME(I));
  END LOOP;
END;
