-------------------------------------------------------------
select regexp_replace('MASK: lower case', '[a, e, i, o, u, y, b, c, d, f, g, h, j, k, l, m, n, p, q, r, s, t, v, w, x, y, z]', '*') as result from dual;
select regexp_replace('MASK: lower case', '[a-z]', '*') as result from dual -- по идее должны сключаться только не прописыне символы а исключаются все буквы алфавита за исключением "A" почему описано здесь https://habr.com/post/269387/
-------------------------------------------------------------
