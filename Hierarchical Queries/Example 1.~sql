-- test data
/*create table test_table (
  id integer,
  pid integer,
  title varchar2(256)
);

insert into test_table values (1, null, 'Россия');
insert into test_table values (2, 1, 'Воронеж');
insert into test_table values (3, 2, 'ООО "Рога и копыта"');
insert into test_table values (4, 1, 'Москва');
insert into test_table values (5, 1, 'Лиски');
insert into test_table values (6, 3, 'Главный офис');
insert into test_table values (7, 3, 'Офис 1');
insert into test_table values (8, 3, 'Офис 2');
insert into test_table values (9, 8, 'Сервер 1');
insert into test_table values (10, 5, 'ЛискиПресс');*/

-- 1 simple query
SELECT level, id, pid, title 
FROM test_table
START WITH pid is null
CONNECT BY PRIOR id = pid;

-- 2 with sorting inheritors
SELECT lpad(' ', 3*level)||title as Tree
FROM test_table
START WITH pid is null
CONNECT BY PRIOR id = pid
ORDER SIBLINGS BY title;

-- 3 directory
SELECT SYS_CONNECT_BY_PATH(title, '/') as Path
FROM test_table
WHERE id=9
START WITH pid is null
CONNECT BY PRIOR id = pid;

--4
SELECT id, pid, title, level, 
 CONNECT_BY_ISLEAF as IsLeaf, -- 1 if is leaf, 0 if not
 PRIOR title as Parent, 
 CONNECT_BY_ROOT title as Root -- root record
FROM test_table
START WITH pid is null
CONNECT BY PRIOR id = pid
ORDER SIBLINGS BY title;

-- 5 a loop in a query
/*update test_table set pid=10 where id=5;*/

SELECT CONNECT_BY_ISCYCLE as cycl, -- mark a record that lead to loop
id, pid, title 
FROM test_table
START WITH id=5
CONNECT BY NOCYCLE -- NOCYCLE не даёт запросу падать когда он натыкается на looping records
PRIOR id = pid;

