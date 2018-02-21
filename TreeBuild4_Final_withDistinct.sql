
use ermdb
go



create table #tempID (
	Delegate nvarchar(100),
	M0 nvarchar(100)
);



insert into #tempID
	select distinct Control_Delegate, Control_Delegate_M0 
	from Controls

;


with EmployeeCTE as
( 
select EMP_M0, EMP_Name, MGR_M0, MGR_Name as ORIG_EMP_M0, 1 as ORDER_NO
from EMP_MGR
where EMP_M0 in (select M0 from #TempID)

union all

select EMP_MGR.EMP_M0, EMP_MGR.EMP_Name, EMP_MGR.MGR_M0, EmployeeCTE.ORIG_EMP_M0, EmployeeCTE.ORDER_NO + 1
from EMP_MGR
join EmployeeCTE
on EMP_MGR.EMP_M0 = 
EmployeeCTE.MGR_M0
)

select distinct E2.EMP_Name as Mgr_Name, 
E1.EMP_Name
from EmployeeCTE E1
left join EmployeeCTE E2
on E1.MGR_M0 = E2.EMP_M0 and E1.ORIG_EMP_M0 = E2.ORIG_EMP_M0
order by Mgr_Name
option (maxrecursion 0)


drop table #tempID


--select mgr_name, emp_name 
--	from emp_mgr
--	where emp_name in (select distinct Control_Delegate 
--						from controls)
--	group by mgr_name, emp_name


--select distinct control_delegate from controls
--order by control_delegate

--select distinct control_owner 
--from controls
--where control_owner not in (select distinct Control_delegate
--							from controls)


--select * from #tempID


--select * from controls
--where control_Delegate = 'Holt, John'

select * from attresponse

select * from emp_mgr
where EMP_Name = 'Holt, John'

insert into emp_mgr
values ('Holt, John', 'M018988', 'jholt@bokf.com', 'Martin, Derek', 'M018559', 'dmartin@bokf.com');




