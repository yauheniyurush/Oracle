  -- ��������� ������� ������ ���� �������� ��� ���  
  -- create or replace type innerTableTypeOfInteger  is table of integer;        -- ��������� ������� � ���������� ���� �������
  -- create or replace type innerTableTypeOfVarchar2 is table of varchar2(4000); -- ��������� ������� � ���������� ���� ������
  
  -- ����� ��� ��������� ������� ����� ������������
  declare  
    
    innerTable         innerTableTypeOfInteger  := innerTableTypeOfInteger();--��������� ������� ����������� ���� ���������������� ����� ������������
    innerTableVarchar2 innerTableTypeOfVarchar2 := innerTableTypeOfVarchar2();
    
  begin
   
    innerTable.extend();--��������� ������� ���� ������� ��������� ����� ��� ��� ����������� �� �������� 
    innerTable(1):= 111;     
    dbms_output.put_line('innerTable(1) >> '||innerTable(1)); 
    
    innerTableVarchar2.extend();--
    innerTableVarchar2(1):= 'aaa';     
    dbms_output.put_line('innerTableVarchar2(1) >> '||innerTableVarchar2(1)); 
   
  end;
