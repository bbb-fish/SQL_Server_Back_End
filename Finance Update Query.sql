use ermdb
go

--select * from AttResponse

/* Build Finance Update Query */
--They will need to update the records with their comments

--update AttResponse Set Q1fin = 'fincom', Q1fin2 = 'x', Q1finTime = (getdate()),
--	Q2fin = 'fincom', Q2fin2 = 'x', Q2finTime = (getdate()),
--	Q3fin = 'fincom', Q3fin2 = 'x', Q3finTime = (getdate()),
--	Q4fin = 'fincom', Q4fin2 = 'x', Q4finTime = (getdate()),
--	Q5fin = 'fincom', Q5fin2 = 'x', Q5finTime = (getdate()),
--	Q6fin = 'fincom', Q6fin2 = 'x', Q6finTime = (getdate()),
--	Q7fin = 'fincom', Q7fin2 = 'x', Q7finTime = (getdate()),
--	Q8fin = 'fincom', Q8fin2 = 'x', Q8finTime = (getdate()),
--	Q9fin = 'fincom', Q9fin2 = 'x', Q9finTime = (getdate()),
--	Q10fin = 'fincom', Q10fin2 = 'x', Q10finTime = (getdate()),
--	Q11fin = 'fincom', Q11fin2 = 'x', Q11finTime = (getdate()),
--	Q12fin = 'fincom', Q12fin2 = 'x', Q12finTime = (getdate())

----Add Blanks

--Set Q1fin = '', Q1fin2 = '', Q1finTime = '',
--	Q2fin = '', Q2fin2 = '', Q2finTime = '',
--	Q3fin = '', Q3fin2 = '', Q3finTime = '',
--	Q4fin = '', Q4fin2 = '', Q4finTime = '',
--	Q5fin = '', Q5fin2 = '', Q5finTime = '',
--	Q6fin = '', Q6fin2 = '', Q6finTime = '',
--	Q7fin = '', Q7fin2 = '', Q7finTime = '',
--    Q8fin = '', Q8fin2 = '', Q8finTime = '',
--    Q9fin = '', Q9fin2 = '', Q9finTime = '',
--    Q10fin = '', Q10fin2 = '', Q10finTime = '',
--    Q11fin = '', Q11fin2 = '', Q11finTime = '',
--    Q12fin = '', Q12fin2 = '', Q12finTime = ''
--where Emp_Name = 'Fisher, Robert' 



update AttResponse Set Complete = 0
where Emp_Name = 'Fisher, Robert'

select * from AttResponse
where Emp_Name = 'Fisher, Robert'