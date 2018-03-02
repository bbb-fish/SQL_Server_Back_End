use ermdb
go




/* Pull all button grabs all available responses stored in AttResponse */

select * from AttResponse




/* Insert based on test throughput from sheet */

insert into AttStorage (EMP_Name, Emp_M0, TemplateID, Q1, Q1yn, Q1com, Q1fin, Q1fin2, Q1finTime, Q2, Q2yn, Q2com, Q2fin, Q2fin2, Q2finTime,
						Q3, Q3yn, Q3com, Q3fin, Q3fin2, Q3finTime, Q4, Q4yn, Q4com, Q4fin, Q4fin2, Q4finTime, Q5, Q5yn, Q5com, Q5fin, Q5fin2, Q5finTime,
						Q6, Q6yn, Q6com, Q6fin, Q6fin2, Q6finTime, Q7, Q7yn, Q7com, Q7fin, Q7fin2, Q7finTime, Q8, Q8yn, Q8com, Q8fin, Q8fin2, Q8finTime,
						Q9, Q9yn, Q9com, Q9fin, Q9fin2, Q9finTime, Q10, Q10yn, Q10com, Q10fin, Q10fin2, Q10finTime, Q11, Q11yn, Q11com, Q11fin, Q11fin2, Q11finTime,
						Q12, Q12yn, Q12com, Q12fin, Q12fin2, Q12finTime, Complete, [TimeStamp], UploadTimeStamp, QtrID)
values ('Fisher, Robert', 'M0185RK', '2018-01-03-13:4:2:370', 
		'Have there been any significant changes (products, processes, or people) that would impact the internal control environment within your area of responsibility?', 'Yes', 'Significant Changes Made', NULL, NULL, NULL,
		'If yes to Q1, have you assessed the potential risks and identified remediation steps to address these risks?', 'No',	NULL, NULL, NULL, NULL,
		'If there have been changes in your internal control environment, have those changes been reflected in the Risk and Control Library?', 'Yes', 'Always up to date', NULL, NULL, NULL,
		'Within your area, are all SOX controls appropriately designed to provide reasonable assurance regarding the reliability of financial reporting and were they operating as designed during the quarterly reporting period?', 'Yes',	'Always works appropriately', NULL, NULL, NULL,
		'Are all non-SOX controls in your area operating as designed to mitigate the risk they were intended to address?', 'Yes', 'We are the best risk mitigators. Flawless mitigators of risk we are.', NULL,	NULL, NULL,
		'Is the appropriate documentation available to support your assessments in questions 4 and 5?',	'Yes', 'I said yes, but please do not try to follow up on it. That was a lie.',	NULL, NULL, NULL,
		'Are you aware of any events that could materially impact the financial statement that have not been reported to the Chief Accounting Officer, Chief Financial Officer, or through the Risk Reporting Hotline?', 'No', 'As a top risk mitigator, we mitigate all risks and no other mitigator need to mitigate.', NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		'1', DEFAULT, NULL, '1q18')




/* Cleaned up version to make it easier to understand */

insert into AttStorage (EMP_Name, Emp_M0, TemplateID, 
						Q1, Q1yn, Q1com, Q1fin, Q1fin2, Q1finTime, 
						Q2, Q2yn, Q2com, Q2fin, Q2fin2, Q2finTime,
						Q3, Q3yn, Q3com, Q3fin, Q3fin2, Q3finTime, 
						Q4, Q4yn, Q4com, Q4fin, Q4fin2, Q4finTime, 
						Q5, Q5yn, Q5com, Q5fin, Q5fin2, Q5finTime,
						Q6, Q6yn, Q6com, Q6fin, Q6fin2, Q6finTime, 
						Q7, Q7yn, Q7com, Q7fin, Q7fin2, Q7finTime, 
						Q8, Q8yn, Q8com, Q8fin, Q8fin2, Q8finTime,
						Q9, Q9yn, Q9com, Q9fin, Q9fin2, Q9finTime, 
						Q10, Q10yn, Q10com, Q10fin, Q10fin2, Q10finTime, 
						Q11, Q11yn, Q11com, Q11fin, Q11fin2, Q11finTime,
						Q12, Q12yn, Q12com, Q12fin, Q12fin2, Q12finTime, 
						Complete, [TimeStamp], UploadTimeStamp, QtrID)
values ('Fisher, Robert', 'M0185RK', '2018-01-03-13:4:2:370',
		'Question1', 'Yes/No', 'Comment', NULL, NULL, NULL,
		'Question2', 'Yes/No', 'Comment', NULL, NULL, NULL,
		'Question3', 'Yes/No', 'Comment', NULL, NULL, NULL,
		'Question4', 'Yes/No', 'Comment', NULL, NULL, NULL,
		'Question5', 'Yes/No', 'Comment', NULL,	NULL, NULL,
		'Question6', 'Yes/No', 'Comment', NULL, NULL, NULL,
		'Question7', 'Yes/No', 'Comment', NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,		
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		NULL, NULL, NULL, NULL, NULL, NULL,
		'1', DEFAULT, NULL, '1q18')




/* Even easier version to understand */

insert into AttStorage (EMP_Name, Emp_M0, TemplateID, 
						Q1, Q1yn, Q1com, Q1fin, Q1fin2, Q1finTime, 
						Q2, Q2yn, Q2com, Q2fin, Q2fin2, Q2finTime,
						Q3, Q3yn, Q3com, Q3fin, Q3fin2, Q3finTime, 
						Q4, Q4yn, Q4com, Q4fin, Q4fin2, Q4finTime, 
						Q5, Q5yn, Q5com, Q5fin, Q5fin2, Q5finTime,
						Q6, Q6yn, Q6com, Q6fin, Q6fin2, Q6finTime, 
						Q7, Q7yn, Q7com, Q7fin, Q7fin2, Q7finTime, 
						Q8, Q8yn, Q8com, Q8fin, Q8fin2, Q8finTime,
						Q9, Q9yn, Q9com, Q9fin, Q9fin2, Q9finTime, 
						Q10, Q10yn, Q10com, Q10fin, Q10fin2, Q10finTime, 
						Q11, Q11yn, Q11com, Q11fin, Q11fin2, Q11finTime,
						Q12, Q12yn, Q12com, Q12fin, Q12fin2, Q12finTime, 
						Complete, TimeStamp, UploadTimeStamp, QtrID)
values ('EMP_Name', 'Emp_M0', 'TemplateID', 
		'Q1', 'Q1yn', 'Q1com', 'Q1fin', 'Q1fin2', 'Q1finTime', 
		'Q2', 'Q2yn', 'Q2com', 'Q2fin', 'Q2fin2', 'Q2finTime',
		'Q3', 'Q3yn', 'Q3com', 'Q3fin', 'Q3fin2', 'Q3finTime', 
		'Q4', 'Q4yn', 'Q4com', 'Q4fin', 'Q4fin2', 'Q4finTime', 
		'Q5', 'Q5yn', 'Q5com', 'Q5fin', 'Q5fin2', 'Q5finTime',
		'Q6', 'Q6yn', 'Q6com', 'Q6fin', 'Q6fin2', 'Q6finTime', 
		'Q7', 'Q7yn', 'Q7com', 'Q7fin', 'Q7fin2', 'Q7finTime', 
		'Q8', 'Q8yn', 'Q8com', 'Q8fin', 'Q8fin2', 'Q5finTime',
		'Q9', 'Q9yn', 'Q9com', 'Q9fin', 'Q9fin2', 'Q9finTime', 
		'Q10', 'Q10yn', 'Q10com', 'Q10fin', 'Q10fin2', 'Q10finTime', 
		'Q11', 'Q11yn', 'Q11com', 'Q11fin', 'Q11fin2', 'Q11finTime',
		'Q12', 'Q12yn', 'Q12com', 'Q12fin', 'Q12fin2', 'Q12finTime', 
		'1', '8:01:02', '8:01:02', 'QtrID')




/* Check the inserts to make sure they work */

select * from AttStorage




/* Delete the test */

--delete from AttStorage

