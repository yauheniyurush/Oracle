DECLARE
    TYPE aa_type IS TABLE OF INTEGER INDEX BY PLS_INTEGER;
    aa aa_type; -- associative array

    TYPE va_type IS VARRAY(4) OF INTEGER;
    va va_type := va_type(2, 4); -- varray

    TYPE nt_type IS TABLE OF INTEGER;
    nt nt_type := nt_type(1, 3, 5); -- nested table

BEGIN

    aa(1) := 3;
    aa(2) := 6;
    aa(3) := 9;
    aa(4) := 12;
	
	DBMS_OUTPUT.PUT_LINE('LIMIT');
	-- Для varray возвращает максимально допустимое количество элементов в коллекции, для остальных коллекций возвращает null
	
    DBMS_OUTPUT.PUT_LINE('aa.COUNT = ' || aa.count);
    DBMS_OUTPUT.PUT_LINE('aa.LIMIT = ' || aa.limit);

    DBMS_OUTPUT.PUT_LINE('va.COUNT = ' || va.count);
    DBMS_OUTPUT.PUT_LINE('va.LIMIT = ' || va.limit);

    DBMS_OUTPUT.PUT_LINE('nt.COUNT = ' || nt.count);
    DBMS_OUTPUT.PUT_LINE('nt.LIMIT = ' || nt.limit);
END;