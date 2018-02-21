

/** Designate Database **/

USE ERMDB
GO

/** create test table for data **/

create table [ERMDB].[dbo].[Objectives_Mini2]
(
 Objective_ID integer Identity(1,1) primary key,
 Objective varchar(50),
 Objective_Comments varchar(100)
)

/** create audit table for data changes **/

create table [ERMDB].[dbo].[Objectives_Mini2_Audit]
(
 Objective_Audit_ID integer Identity(1,1) primary key,
 Objective_ID integer,
 Objective varchar(50),
 Objective_Comments varchar(100),
 UpdatedBy nvarchar(128),
 UpdatedOn datetime
)
go

/** create trigger to capture changes made on data table **/


create trigger Objectives_Audit_Trigger_Test1 
on [ERMDB].[dbo].[Objectives_Mini2]
after update, insert
as

DECLARE @Operation char(1)

if exists(select * from Deleted)
  set @Operation = 'U'
else
  set @Operation = 'I'

if update (Objective_ID)
	insert [ERMDB].[dbo].[Objectives_Mini2_Audit]
		(AuditDate, SysUser, Application, TableName, Operation,
		  PrimaryKey, RowDescription, SecondaryRow, [Column], 
		  OldValue, NewValue)

begin
  insert into [ERMDB].[dbo].[Objectives_Mini2_Audit]
   (Objective_ID, Objective, Objective_Comments, UpdatedBy, UpdatedOn)
    select i.Objective_ID, i.Objective, i.Objective_Comments, SUSER_SNAME(), getdate()
    from [ERMDB].[dbo].[Objectives_Mini2] O
    inner join inserted i on O.Objective_ID = i.Objective_ID
end
go

/** insert data into data table to see if trigger captures date **/

insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test1')
insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test2')
insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test3')

/** review data in both data table and audit table to see if changes are captured **/

select * from [ERMDB].[dbo].[Objectives_Mini2]

select * from [ERMDB].[dbo].[Objectives_Mini2_Audit]

/** create view to play with data without changing it **/

create view [dbo].[Test_Audit_View]
as select * from [ERMDB].[dbo].[Objectives_Mini2_Audit]


/** select data for view using date function to show previous values **/
/** WHERE UpdatedOn >= '2017-09-03 00:00:00.000'
  AND UpdatedOn < '2017-09-15 00:00:00.000'**/

Select * 
from [dbo].[Test_Audit_View]
WHERE UpdatedOn >= '2017-09-05 00:00:00.000'
  AND UpdatedOn < '2017-09-06 00:00:00.000'


/** Insert new data in table to add new date values to play with **/

insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test4')
insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test5')
insert into [ERMDB].[dbo].[Objectives_Mini2] values (NULL, 'Test6')

/** selecting data based on new date values **/

Select * 
from [dbo].[Test_Audit_View]
WHERE UpdatedOn >= '2017-09-06 00:00:00.000'
  AND UpdatedOn < '2017-09-07 00:00:00.000'

/** It totally works, be amazed. **/
/** Start to wonder about what a maxdate() where maxdate < XDATE works **/
/** It's kind of like a paradox or oxymoron because then maxdate isn't maxdate **/

Select Objective_ID, Objective, Objective_Comments, max(UpdatedOn)
from [dbo].[Test_Audit_View]
where UpdatedOn < '2017-09-06 00:00:00.000'
Group by Objective_ID, Objective, Objective_Comments


