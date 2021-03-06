use ermdb
go

/* in case you mess up */

--update Objectives
--set Objective_Owner = Objective_Delegate




/* Trim bits base code */

--select * from EMP_MGR

--select rtrim(EMP_Name) from EMP_MGR

--select rtrim(MGR_Name) from EMP_MGR

--update EMP_MGR
	--set EMP_Name = ltrim(rtrim(EMP_Name)),
		--MGR_Name = ltrim(rtrim(MGR_Name))

--select * from CO_SPOC

--update CO_SPOC
--	set CO_Name = ltrim(rtrim(CO_Name)),
--		SPOC = ltrim(rtrim(SPOC))





/* pull values into new tables */

--select *
--into dbo.Objectives
--from Objectives_Test

--select * from Objectives

--select *
--into dbo.Risks
--from Risks_Test

--select * from Risks

--select *
--into dbo.Controls
--from Controls_Test

--select * from Controls_Test






/* changing name format on Objectives*/ 

--select * from Objectives



/* Objective_Owner name format change */

--create table #TempObjOwner
--(
--Objective_Owner_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempObjOwner
--select Objective_Owner_M0, left(Objective_Owner, CHARINDEX(' ', Objective_Owner)) as firstname,
--substring(Objective_Owner, CHARINDEX(' ', Objective_Owner)+1, len(Objective_Owner)-(CHARINDEX(' ', Objective_Owner)-1)) as lastname
--from Objectives


--Update Objectives
--set Objective_Owner = #tempObjOwner.lastname + ', ' + #tempObjOwner.firstname
--from Objectives
--join #tempObjOwner
--on Objectives.Objective_Owner_M0 = #tempObjOwner.Objective_Owner_M0


--if OBJECT_ID('tempdb..#tempObjOwner') Is Not Null drop table #tempObjOwner
--go

--select * from Objectives

--select * from #tempObjOwner





/* Objective_Owner_Delegate name format change */


--create table #TempObjOwner
--(
--Objective_Delegate_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempObjOwner
--select Objective_Delegate_M0, left(Objective_Delegate, CHARINDEX(' ', Objective_Delegate)) as firstname,
--substring(Objective_Delegate, CHARINDEX(' ', Objective_Delegate)+1, len(Objective_Delegate)-(CHARINDEX(' ', Objective_Delegate)-1)) as lastname
--from Objectives


--Update Objectives
--set Objective_Delegate = #tempObjOwner.lastname + ', ' + #tempObjOwner.firstname
--from Objectives
--join #tempObjOwner
--on Objectives.Objective_Delegate_M0 = #tempObjOwner.Objective_Delegate_M0


--if OBJECT_ID('tempdb..#tempObjOwner') Is Not Null drop table #tempObjOwner
--go

--select * from Objectives


--update Objectives
--	set Objective_Owner = ltrim(rtrim(Objective_Owner)),
--		Objective_Delegate = ltrim(rtrim(Objective_Delegate))

/* RISKS */

/* Risk Delegate name format change */


--create table #TempRiskOwner
--(
--Risk_Owner_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempRiskOwner
--select Risk_Owner_M0, left(Risk_Owner, CHARINDEX(' ', Risk_Owner)) as firstname,
--substring(Risk_Owner, CHARINDEX(' ', Risk_Owner)+1, len(Risk_Owner)-(CHARINDEX(' ', Risk_Owner)-1)) as lastname
--from Risks


--Update Risks
--set Risk_Owner = #tempRiskOwner.lastname + ', ' + #tempRiskOwner.firstname
--from Risks
--join #tempRiskOwner
--on Risks.Risk_Owner_M0 = #tempRiskOwner.Risk_Owner_M0


--if OBJECT_ID('tempdb..#tempRiskOwner') Is Not Null drop table #tempRiskOwner
--go

--select * from Risks




/* Risk Owner name format change */

--create table #TempRiskOwner
--(
--Risk_Delegate_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempRiskOwner
--select Risk_Delegate_M0, left(Risk_Delegate, CHARINDEX(' ', Risk_Delegate)) as firstname,
--substring(Risk_Delegate, CHARINDEX(' ', Risk_Delegate)+1, len(Risk_Delegate)-(CHARINDEX(' ', Risk_Delegate)-1)) as lastname
--from Risks


--Update Risks
--set Risk_Delegate = #tempRiskOwner.lastname + ', ' + #tempRiskOwner.firstname
--from Risks
--join #tempRiskOwner
--on Risks.Risk_Delegate_M0 = #tempRiskOwner.Risk_Delegate_M0


--if OBJECT_ID('tempdb..#tempRiskOwner') Is Not Null drop table #tempRiskOwner
--go

--select * from Risks

--update Risks
--	set Risk_Owner = ltrim(rtrim(Risk_Owner)),
--		Risk_Delegate = ltrim(rtrim(Risk_Delegate))


/* CONTROLS */

/* Control Owner name format change */

--select * from Controls

--create table #TempControlOwner
--(
--Control_Owner_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempControlOwner
--select Control_Owner_M0, left(Control_Owner, CHARINDEX(' ', Control_Owner)) as firstname,
--substring(Control_Owner, CHARINDEX(' ', Control_Owner)+1, len(Control_Owner)-(CHARINDEX(' ', Control_Owner)-1)) as lastname
--from Controls


--Update Controls
--set Control_Owner = #tempControlOwner.lastname + ', ' + #tempControlOwner.firstname
--from Controls
--join #tempControlOwner
--on Controls.Control_Owner_M0 = #tempControlOwner.Control_Owner_M0


--if OBJECT_ID('tempdb..#tempControlOwner') Is Not Null drop table #tempControlOwner
--go

--select * from Controls


/* Control Delegate name format change */

--create table #TempControlOwner
--(
--Control_Delegate_M0 varchar(50),
--firstname varchar(50),
--lastname varchar(100)
--)

--insert into #TempControlOwner
--select Control_Delegate_M0, left(Control_Delegate, CHARINDEX(' ', Control_Delegate)) as firstname,
--substring(Control_Delegate, CHARINDEX(' ', Control_Delegate)+1, len(Control_Delegate)-(CHARINDEX(' ', Control_Delegate)-1)) as lastname
--from Controls


--Update Controls
--set Control_Delegate = #tempControlOwner.lastname + ', ' + #tempControlOwner.firstname
--from Controls
--join #tempControlOwner
--on Controls.Control_Delegate_M0 = #tempControlOwner.Control_Delegate_M0


--if OBJECT_ID('tempdb..#tempControlOwner') Is Not Null drop table #tempControlOwner
--go

--select * from Controls

--update Controls
--	set Control_Owner = ltrim(rtrim(Control_Owner)),
--		Control_Delegate = ltrim(rtrim(Control_Delegate))

--select * from Controls


/* CHECK THIS AWESOME STUFF OUT! */

--select * from Objectives

--select * from Risks

select * from Controls
where Control_Owner = 'Emmons, William'
--and control_delegate = 'Allen, Lee' 
--or control_delegate = 'Emmons, William' 
--or control_delegate = 'Bigham, Caleb' 
--or control_delegate = 'Wood, Robert' 
--or control_delegate = 'Rice, Kenneth'
