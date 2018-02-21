/* Figuring out how to combine columns to make new O ID using PK */
/* Had to go to design table and change PK to varchar and then back to int */

--update Objectives_Test
--Set Objective_Description = Objective_ID + Objective_Description

--select * from Objectives_Test

--update Objectives_Test
--set Objective_ID = substring(Objective_ID, 1, 1) + Objective_Primary_Key

--update Objectives_Test
--set Objective_ID = 'O' + Objective_Primary_Key




/* Changing the old Objective ID values to the new ones */

--select * from Objectives_Test

--update Risks_Test
--set Objective_ID = 'O3059' /* New ID */
--where Objective_ID = 'OT1'  /* Old ID */

--select * from Risks_Test
--where Objective_ID = 'O3032' /* Count the rows to be sure all affects are correct */





/* Making sure our distinct values line up correctly */

--select distinct a.Objective_ID, b.Objective_Description 
--from Risks_Test a,
--Objectives_Test b
--where a.Objective_ID = b.Objective_ID




/* Let's change some Risk IDz to incorporate PKz */
/* Turn PK to varchar for update, then back to int */
/* How do we get the same ID concatenation for the multiple ID's with their own PKs? */

--select * from Risks_Test

--select distinct Risk_ID, Risk_Owner from Risks_Test

--update Risks_Test
--set Risk_ID = 'R' + Risk_Primary_Key

--select distinct Risk_ID, Control_ID, Control_Owner from Controls_Test



--delete from Risks_Test

--select distinct Risk_ID from Risks_Test

--select * from Risks_Test


--select distinct Control_ID, Control_Owner from Controls_Test
--select distinct Control_Owner, Control_ID from Controls_Test
--select distinct Control_Owner from Controls_Test

--select Control_ID, Risk_ID, Control_Owner from Controls_Test
--order by Control_ID

--select * from Controls_Test


--select * from Objectives_Test

--update Risks_Test
--set Risk_ID = 'R' + Risk_Primary_Key

--select * from Risks_Test

--update Controls_Test
--set Control_ID = 'C' + Control_Primary_Key

--select * from Controls_Test

--select a.Control_ID, a.Risk_ID, b.Custom_Risk_ID, b.Risk_ID
--	from Controls_Test a join
--	Risks_Test b
--	on a.Risk_ID = b.Custom_Risk_ID


--select * into #TempControls from Controls_Test

--select * from Controls_Test

/* Changing Risk ID in control table */

--update Controls_Test
--	set Controls_Test.New_Risk_ID = Risks_Test.Risk_ID
--	from Controls_Test join
--	Risks_Test
--	on Controls_Test.Risk_ID = Risks_Test.Custom_Risk_ID

/* Consolidating Columns */
/* Delete Risk_ID column from Control ID, change New_Risk_ID to Risk_ID */

select * from Risks_Test

select * from Risks_Test join Controls_Test on Risks_Test.Risk_ID = Controls_Test.Risk_ID

select * from Controls_Test
where Risk_ID = 'R13556'
