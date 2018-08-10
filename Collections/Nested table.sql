  -- вложенную таблицу снчала надо объявить как тип  
  -- create or replace type innerTableTypeOfInteger  is table of integer;        -- вложенная таблица с элементами типа интежер
  -- create or replace type innerTableTypeOfVarchar2 is table of varchar2(4000); -- вложенная таблица с элементами типа строка
  
  -- потом эту вложенную таблицу можно использовать
  declare  
    
    innerTable         innerTableTypeOfInteger  := innerTableTypeOfInteger();--вложенную таблицу обязательно надо инициализировать потом использовать
    innerTableVarchar2 innerTableTypeOfVarchar2 := innerTableTypeOfVarchar2();
    
  begin
   
    innerTable.extend();--вложенную таблицу надо заранее расширять перед тем как присваивать ей значения 
    innerTable(1):= 111;     
    dbms_output.put_line('innerTable(1) >> '||innerTable(1)); 
    
    innerTableVarchar2.extend();--
    innerTableVarchar2(1):= 'aaa';     
    dbms_output.put_line('innerTableVarchar2(1) >> '||innerTableVarchar2(1)); 
   
  end;
