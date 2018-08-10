/*
DBMS_SESSION.FREE_UNUSED_USER_MEMORY

* Процедура DBMS_SESSION.FREE_UNUSED_USER_MEMORY возвращает неиспользуемую более память системе
* В документации Oracle процедуру советуют использовать «редко и благоразумно».
* В случае подключения в режиме Dedicated Server вызов этой процедуры возвращает неиспользуемую PGA память операционной системе
* В случае подключения в режиме Shared Server вызов этой процедуры возвращает неиспользуемую память в Shared Pool


В каких случаях нужно освобождать память: 
1. Большие сортировки, когда используется вся область sort_area_size
2. Компиляция больших PL/SQL пакетов, процедур или функций
3. Хранение больших объемов данных в индексных таблицах PL/SQL
*/

CREATE PACKAGE foobar
   type number_idx_tbl is table of number indexed by binary_integer;

   store1_table  number_idx_tbl;     --  PL/SQL indexed table
   store2_table  number_idx_tbl;     --  PL/SQL indexed table
   store3_table  number_idx_tbl;     --  PL/SQL indexed table
   ...
END;            --  end of foobar

DECLARE
   ...
   empty_table   number_idx_tbl;     --  uninitialized ("empty") version
BEGIN
   FOR i in 1..1000000 loop
     store1_table(i) := i;           --  load data
   END LOOP;
   ...
   store1_table := empty_table;      --  "truncate" the indexed table
   ... 
   -
   dbms_session.free_unused_user_memory;  -- give memory back to system

   store1_table(1) := 100;           --  index tables still declared;
   store2_table(2) := 200;           --  but truncated.
   ...
END;
