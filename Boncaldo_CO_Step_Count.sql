IF OBJECT_ID('tempdb..#Emp_Info_Table') IS NOT NULL
    DROP TABLE #Emp_Info_Table  
IF OBJECT_ID('tempdb..#Final_Hiearchy_Results') IS NOT NULL
    DROP TABLE #Final_Hiearchy_Results
IF OBJECT_ID('tempdb..#Final_Table') IS NOT NULL
    DROP TABLE #Final_Table

--******************************************************
--Section 1: This checks the Employee and CO Tables for duplicate values.
--If there are duplicates the process stops before the hiearchy loop is ran and a query is ran that returns the duplicate values to be looked in to.
--If there are no duplicate values, the hiearchy query is ran as normal
--******************************************************

declare @stop_process_indicator integer

if (select count([EMP_M0]) from [ERMDB].[dbo].[EMP_MGR]) <> (select distinct count([EMP_M0]) from [ERMDB].[dbo].[EMP_MGR])
	begin
	
	print 'Possible double mapping in EMP table'
	select *
	from
	(
		select * 
		,sum(case when [EMP_M0] = [EMP_M0] then 1 else 0 end) over (partition by [EMP_M0]) as '#Entries EMP_M0'
		from [ERMDB].[dbo].[EMP_MGR]
	) t1
	where [#Entries EMP_M0] > 1
	set @stop_process_indicator = @stop_process_indicator + 1
	
	end;
	
if (select count([CO_M0]) from [ERMDB].[dbo].[CO_SPOC]) <> (select distinct count([CO_M0]) from [ERMDB].[dbo].[CO_SPOC])
	begin
	
	print 'Possible double mapping in CO table'
	select *
	from
	(
		select * 
		,sum(case when [CO_M0] = [CO_M0] then 1 else 0 end) over (partition by [CO_M0]) as '#Entries CO_M0'
		from [ERMDB].[dbo].[CO_SPOC] C
	) t1
	where [#Entries CO_M0] > 1
	set @stop_process_indicator = @stop_process_indicator + 1
	
	end;

if @stop_process_indicator > 0
	goto Skip_To_End_Of_Query;

--******************************************************
--End of Section 1
--******************************************************


--******************************************************
--Section 2: This is where the actual hiearchy mapping takes place
--******************************************************

/*
This table will be used during the loop
*/    
select 
E.[EMP_M0] as 'E'
,case when C.[SPOC_M0] is not null then 1 else 0 end as 'E_is_CO'
,E.[MGR_M0] as 'M'
into #Emp_Info_Table	
from [ERMDB].[dbo].[EMP_MGR] E 
left join [ERMDB].[dbo].[CO_SPOC] C
	on E.[EMP_M0] = C.[CO_M0]    
--**************************************

declare @Mgr_List varchar(300)

declare @Emp varchar(100)
declare @Mgr varchar(100)
declare @Mgr_CO_YN varchar(100)
declare @CO_YN integer

declare @Count integer

CREATE TABLE #Final_Hiearchy_Results
(
   Employee VARCHAR(255)
   ,Managers VARCHAR(255)
)


declare Table_Row cursor 

--**********
for	select * from #Emp_Info_Table 
--**********
		
open Table_Row

fetch next from Table_Row into @Emp,@CO_YN,@Mgr

	while @@fetch_status = 0
	begin
	--***************************
	
	--set @Mgr_List = @Mgr
	
	Set @Count = 0
	
	While @CO_YN = 0 
	begin
	--******
	
	
	set @Mgr_List = (case when @Count=0 then @Mgr
					else concat((select [M] from #Emp_Info_Table where E = case when @Mgr_List like '%,%' then left(@Mgr_List,charindex(',',@Mgr_List)-1) else @Mgr_List end)
								,','
								,@Mgr_List)
					end)
					
	
	
	
	--Look up whether the next manager is a control owner
	set @CO_YN = (select E_is_CO from #Emp_Info_Table where E = case when @Mgr_List like '%,%' then left(@Mgr_List,charindex(',',@Mgr_List)-1) else @Mgr_List end)	
	
	Set @Count = @Count + 1
	
	if @Mgr_List like '%M018A94%'
		Break;
	
	if @Count = 10
		Break;

	end;
	
		INSERT INTO #Final_Hiearchy_Results (Employee, Managers) 
		VALUES (@Emp, @Mgr_List) 

--select * from #GTemp	

	--***************************
		fetch next from Table_Row into @Emp,@CO_YN,@Mgr		
	end;

close Table_Row
deallocate Table_Row

--******************************************************
--End of Section 2
--******************************************************


--******************************************************
--Section 3: This Builds a table that encorporates the Hiearchy Mapping.
--Any Control Owner M0 number that is returned with a * after it belongs
--to an employee that does not have a control owner assigned to them.
--In this case, the query returns that employees manager that is one short of the CEO
--******************************************************



select
[EMP_Name]
,[EMP_M0]
,[Seperation From CO]
,[Control Owner]
,case when [Seperation From CO] = 0 then '' else [Path to CO (Rank from Highest to Lowest)] end as 'Path to CO (Rank from Highest to Lowest)'
into #Final_Table
from(

	select
	[EMP_Name]
	,[EMP_M0]
	,[Seperation From CO]
	,case when [Seperation From CO] = 0 then '' else
	 concat(
		case when [List of Mgrs] like '%,%' then left([List of Mgrs],charindex(',',[List of Mgrs])-1) else [List of Mgrs] end
		,case when [Control Owner Not Listed] = 1 then '*' else '' end	
			)
	 end as 'Control Owner'
	,[List of Mgrs] as 'Path to CO (Rank from Highest to Lowest)' 
	from(

		select 
		E.[EMP_Name]
		,E.[EMP_M0]
		,case when [Managers] like '%M018A94%' then replace([Managers],'M018A94,','') else [Managers] end as 'List of Mgrs' 
		,case when EIT.[E_is_CO] = 1 then 0 
			  else len([Managers])-len(replace([Managers],',','')) 
				   + case when [Managers] like '%M018A94%' then 0 else 1 end 
			  end 'Seperation From CO'
		,case when [Managers] like '%M018A94%' then 1 else '' end as 'Control Owner Not Listed' 
		from [ERMDB].[dbo].[EMP_MGR] E
		left join #Final_Hiearchy_Results FHR
		on E.[EMP_M0] = FHR.[Employee]
		left join #Emp_Info_Table EIT
		on E.[EMP_M0] = EIT.[E]

		) t1
	
	) t2


select * from #Final_Table
order by [Seperation From CO] desc, case when [Control Owner] like '%*%' then 1 else 0 end asc
		 ,[EMP_Name] asc


--******************************************************
--End of Section 3
--******************************************************

--******************************************************
--Section 4: Returns a list of employees that may need to be added to the control owners list.
--This is the list of Mgrs that are assigned as the Control Owners with * in Section 3 
--******************************************************
		 
select distinct FT.[Control Owner],E.*
from #Final_Table FT
left join [ERMDB].[dbo].[EMP_MGR] E
on replace(FT.[Control Owner],'*','')=E.[EMP_M0]
where FT.[Control Owner] like '%*%'

--******************************************************
--End of Section 4
--******************************************************


Skip_To_End_Of_Query:
	print 'Query Stopped Due to Potential Error'
	
GO