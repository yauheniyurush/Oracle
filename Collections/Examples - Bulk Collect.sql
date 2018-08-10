DECLARE
    TYPE NumTab IS TABLE OF employees.employee_id%TYPE;
    TYPE NameTab IS TABLE OF employees.last_name%TYPE;

    CURSOR c1 IS SELECT employee_id,last_name
        FROM   employees
        WHERE  salary > 10000
        ORDER  BY last_name;

    enums NumTab;
    names NameTab;
BEGIN
    
    -- Bulk Collect Возвращает результаты sql-оператора в PL/SQL пачками, а не по одному 
    
    -- SELECT BULK COLLECT INTO
    SELECT employee_id, last_name 
    BULK COLLECT INTO   enums, names
    FROM   employees
    ORDER  BY employee_id;
    
    -- FETCH BULK COLLECT INTO [LIMIT]
    OPEN c1;
    LOOP
        FETCH c1 BULK COLLECT INTO enums, names LIMIT 10;
        EXIT WHEN names.COUNT = 0;
        do_something();
    END LOOP;
    CLOSE c1;
    
    -- RETURNING BULK COLLECT INTO
    DELETE FROM emp_temp WHERE department_id = 30
    RETURNING employee_id, last_name BULK COLLECT INTO enums, names;
END;
