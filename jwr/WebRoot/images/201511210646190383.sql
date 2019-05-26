-- Create table
create table task_tbl(   --任务分配表
 id int primary key,   
 areacode varchar2(50),  --区域code
 motcode VARCHAR2(50),   --主管机关code
 fileid  varchar2(50)    --专业I
);
-- Create sequence 
create sequence taskid
minvalue 1
maxvalue 9999999999999
start with 1
increment by 1
nocache
order;
--Create Triggers
CREATE OR REPLACE TRIGGER taskidtrigger
before insert on task_tbl
for each row
begin
select taskid.nextval into :new.id from dual;
end ;
