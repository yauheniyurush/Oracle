DECLARE
  TYPE numlist IS TABLE OF INTEGER;
  list1 numlist := numlist(11, 22, 33, 44);
BEGIN
 
  dbms_output.put_line('COUNT='||list1.COUNT);
  dbms_output.put_line('FIRST='||list1.first);
  dbms_output.put_line('LAST='||list1.last);
 
  dbms_output.put_line(chr(10)||'Delete(2)');
  list1.DELETE(2);
  dbms_output.put_line(' COUNT='||list1.COUNT);
  dbms_output.put_line(' FIRST='||list1.first);
  dbms_output.put_line(' LAST='||list1.last);
 
  dbms_output.put_line(chr(10)||'EXTEND(4, 3)');
  list1.EXTEND(4, 3);
  dbms_output.put_line(' COUNT='||list1.COUNT);
  dbms_output.put_line(' FIRST='||list1.first);
  dbms_output.put_line(' LAST='||list1.last);
 
  dbms_output.put_line(chr(10)||'print list1');
  dbms_output.put_line(' list1(1)='||list1(1));
  dbms_output.put_line(' list1(3)='||list1(3));
  dbms_output.put_line(' list1(4)='||list1(4));
  dbms_output.put_line(' list1(5)='||list1(5));
  dbms_output.put_line(' list1(6)='||list1(6));
  dbms_output.put_line(' list1(7)='||list1(7));
  dbms_output.put_line(' list1(8)='||list1(8));
 
  dbms_output.put_line(chr(10)||'wrong');
 
  begin
    dbms_output.put_line(' list1(2)='||list1(2));
  exception
   when others then dbms_output.put_line(' list1(2)= '||SQLERRM);
  end;
 
  begin
    dbms_output.put_line(' list1(9)='||list1(9));
  exception
   when others then dbms_output.put_line(' list1(9)= '||SQLERRM);
  end;  
 
END;
