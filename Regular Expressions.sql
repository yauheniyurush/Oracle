-------------------------------------------------------------
select regexp_replace('MASK: lower case', '[a, e, i, o, u, y, b, c, d, f, g, h, j, k, l, m, n, p, q, r, s, t, v, w, x, y, z]', '*') as result from dual;
select regexp_replace('MASK: lower case', '[a-z]', '*') as result from dual -- �� ���� ������ ���������� ������ �� ��������� ������� � ����������� ��� ����� �������� �� ����������� "A" ������ ������� ����� https://habr.com/post/269387/
-------------------------------------------------------------
