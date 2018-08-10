DECLARE
    TYPE NumList IS TABLE OF NUMBER;
    depts NumList := NumList(10, 20, 30);

    TYPE enum_t IS TABLE OF employees.employee_id%TYPE;
    e_ids enum_t;

    TYPE dept_t IS TABLE OF employees.department_id%TYPE;
    d_ids dept_t;
BEGIN
    FORALL j IN depts.FIRST .. depts.LAST
        DELETE FROM emp_temp
        WHERE  department_id = depts(j)
        RETURNING employee_id, department_id BULK COLLECT INTO e_ids, d_ids;
END;


/*
Exceptions in forall

При возникновении исключения в любом из dml-операторов в цикле, транзакция полностью откатывается
Если описать обработчик ошибок, в нем можно зафиксировать успешно выполнившиеся операторы dml 
(это те операторы, которые выполнились до возникновения исключения).

Конструкция:
FORALL j IN collection.FIRST.. collection.LAST SAVE EXCEPTIONS 

Генерит ORA-24381 в конце, если в цикле возникали исключения
SQL%BULK_EXCEPTIONS – коллекция, содержащая информацию о всех сгенерированных во время выполнения цикла исключениях
SQL%BULK_EXCEPTIONS.ERROR_INDEX – значение индекса коллекции (в тек. примере это j), при котором произошло исключение: 
(sql%bulk_exception(i).error_index)
SQL%BULK_EXCEPTIONS.ERROR_CODE — код возникшей ошибки. Информацию об ошибке можно извлечь с помощью функции sqlerrm: 
SQLERRM(-(SQL%BULK_EXCEPTIONS(i).ERROR_CODE))
*/
