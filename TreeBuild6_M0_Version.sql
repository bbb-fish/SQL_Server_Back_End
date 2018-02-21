
use ermdb
go

--------------------------------------------------------------------------------------

/* create temp ID table to have distinct delegates from controls table */

create table #tempID (
	Delegate nvarchar(100),
	M0 nvarchar(100)
)
;

/* insert distinct delegate values from controls table */
/* also grabs control owners who are their won delegate */

insert into #tempID
	select distinct Control_Delegate, Control_Delegate_M0 
	from Controls
;


--drop table #tempID

------------------------------------------------------------------------------------

/* store Parent/Child columns in temp table from EmployeeCTE */

create table #depthID (
	MGR_M0 nvarchar(100),
	EMP_M0 nvarchar(100)
)
;

--drop table #depthID

-----------------------------------------------------------------------------------

/* Recursion to get parent child relationships for entire hierarchy */
/* Runs on distinct control delegates to create approval paths */


with EmployeeCTE as
( 
select EMP_M0, EMP_Name, MGR_M0, EMP_M0 as ORIG_EMP_M0, 1 as ORDER_NO
from EMP_MGR
where EMP_M0 in (select M0 from #TempID)

union all

select EMP_MGR.EMP_M0, 
EMP_MGR.EMP_Name, EMP_MGR.MGR_M0, EmployeeCTE.ORIG_EMP_M0, EmployeeCTE.ORDER_NO + 1
from EMP_MGR
join EmployeeCTE
on EMP_MGR.EMP_M0 = 
EmployeeCTE.MGR_M0
)

/* insert into temp table for reference and to make depth counts in future CTE */

insert into #depthID (MGR_M0, EMP_M0)
select distinct E2.EMP_M0 as Mgr_M0, 
E1.EMP_M0
from EmployeeCTE E1
left join EmployeeCTE E2
on E1.MGR_M0 = E2.EMP_M0 and E1.ORIG_EMP_M0 = E2.ORIG_EMP_M0
order by Mgr_M0
option (maxrecursion 0)

/* Look at values */

select * from #depthID

---------------------------------------------------------------------------------------

/* Delete tempID table at end so rebuilt in future runs */

drop table #tempID

/* Delete depthID table at end so rebuilt in future runs */

drop table #depthID
