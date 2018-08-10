-- Создаём вложенную таблицу с символьным типом данных
CREATE TYPE XX_TYPE_CHAIR IS TABLE OF VARCHAR2(100);

-- Создаём таблицу CHAIRS, в которой присутствует колонка CHAIR_NAME использующая вложенную таблицу
CREATE TABLE CHAIRS (ID NUMBER, CHAIR_NAME  XX_TYPE_CHAIR) NESTED TABLE CHAIR_NAME STORE AS NESTED_CHAIRS;

-- Вставляем данные в таблицу
INSERT INTO CHAIRS VALUES (1, XX_TYPE_CHAIR('стул','тубуретка'));

INSERT INTO CHAIRS VALUES (2, XX_TYPE_CHAIR('кресло','пуфик','диван'));

-- Просматриваем данные в таблице
select * from chairs t;

--Отобразим все результаты используя функцию TABLE
select t1.id, t2.* from chairs t1, table(t1.chair_name) t2;
 
-- Используя оператор THE отобразим данные только из вложенной таблицы
select VALUE(t2) from THE (select chair_name from chairs t1 where id = 2) t2;
 
