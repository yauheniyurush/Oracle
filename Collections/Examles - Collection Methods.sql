DECLARE
  TYPE nt_type IS TABLE OF NUMBER;
  nt nt_type := nt_type(11, 22, 33, 44, 55, 66); -- вложенная таблица

  TYPE aa_type_str IS TABLE OF INTEGER INDEX BY VARCHAR2(10); -- ассоциативный массив
  aa_str aa_type_str;

  TYPE NumList IS VARRAY(10) OF INTEGER; -- varray
  n NumList := NumList(1, 3, 5, 7);
BEGIN
  -- DELETE
  DBMS_OUTPUT.PUT_LINE('DELETE');
  nt.DELETE(2); -- Удаляет второй элемент 
  nt(2) := 2222; -- Восстанавливает 2-й элемент 
  nt.DELETE(2, 4); -- Удаляет элементы со 2-го по 4-й
  nt(3) := 3333; -- Восстанавливает 3-й элемент
  nt.DELETE; -- Удаляет все элементы. Для коллекций типа varray подходит только эта версия.

  -- TRIM
  DBMS_OUTPUT.PUT_LINE('TRIM');
  nt := nt_type(11, 22, 33, 44, 55, 66);

  nt.TRIM; -- удаляет один элемент в конце коллекции. Если элемента нет, генерирует исключение SUBSCRIPT_BEYOND_COUNT.Сразу очищает память, выделенную для хранения этих элементов
  nt.DELETE(4); --  удаляет n элементов в конце коллекции. Если элементов меньше, чем n, генерируется исключение SUBSCRIPT_BEYOND_COUNT 
  nt.TRIM(2); -- TRIM. Работает с внутренним размером коллекции. Т.е. если последний элемент был удален с помощью Delete, вызов Trim() удалит уже удаленный ранее элемент.

  -- Extend
  DBMS_OUTPUT.PUT_LINE('Extend');
  nt := nt_type(11, 22, 33);
  nt.EXTEND(2); -- добавляет n элементов со значением null в конец коллекции
  nt.EXTEND(2, 1); -- EXTEND(n,i) добавляет n копий элемента с индексом i в конец коллекции. Если коллекция имеет NOT NULL констрейнт, только этой формой можно пользоваться.
  nt.DELETE(5); -- Delete fifth element. Если элементы были ранее удалены с помощью метода Delete, Extend не будет использовать сохранившиеся за коллекцией ячейки памяти, а добавит новый элемент (выделит новую память)
  nt.EXTEND; -- Append one null element 

  -- Exists
  DBMS_OUTPUT.PUT_LINE('Exists');
  nt := nt_type(1, 3, 5, 7);
  nt.DELETE(2); -- Delete second element. Для удаленных элементов возвращает false 
  FOR i IN 1 .. 6 LOOP
    IF nt.EXISTS(i) THEN
      DBMS_OUTPUT.PUT_LINE('n(' || i || ') = ' || n(i));
    ELSE
      DBMS_OUTPUT.PUT_LINE('n(' || i || ') does not exist');
    END IF;
  END LOOP;

  -- First и Last
  -- Для varray First всегда возвращает единицу, Last всегда возвращает то же значение, что и Count
  DBMS_OUTPUT.PUT_LINE('First и Last');
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

  -- Prior и Next - Возвращают индекс предыдущего/следующего элемента (или null, если элемента нет)
  DBMS_OUTPUT.PUT_LINE('Prior и Next');
  
  nt := nt_type(18, NULL, 36, 45, 54, 63);

  nt.DELETE(4);
  DBMS_OUTPUT.PUT_LINE('nt(4) was deleted.');

  FOR i IN 1 .. 7 LOOP
    DBMS_OUTPUT.PUT_LINE('nt.PRIOR(' || i || ') = ' || nt.PRIOR(i));
    DBMS_OUTPUT.PUT_LINE('nt.NEXT(' || i || ')  = ' || nt.NEXT(i));
  END LOOP;
  
  
  
  /* */

END;
