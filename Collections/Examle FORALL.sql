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

��� ������������� ���������� � ����� �� dml-���������� � �����, ���������� ��������� ������������
���� ������� ���������� ������, � ��� ����� ������������� ������� ������������� ��������� dml 
(��� �� ���������, ������� ����������� �� ������������� ����������).

�����������:
FORALL j IN collection.FIRST.. collection.LAST SAVE EXCEPTIONS 

������� ORA-24381 � �����, ���� � ����� ��������� ����������
SQL%BULK_EXCEPTIONS � ���������, ���������� ���������� � ���� ��������������� �� ����� ���������� ����� �����������
SQL%BULK_EXCEPTIONS.ERROR_INDEX � �������� ������� ��������� (� ���. ������� ��� j), ��� ������� ��������� ����������: 
(sql%bulk_exception(i).error_index)
SQL%BULK_EXCEPTIONS.ERROR_CODE � ��� ��������� ������. ���������� �� ������ ����� ������� � ������� ������� sqlerrm: 
SQLERRM(-(SQL%BULK_EXCEPTIONS(i).ERROR_CODE))
*/
