use ERMDB
go


/* Example Query to upload responses from Excel Attestation Book to SQL Server */
/* John Holt Example */


INSERT INTO AttResponse (EMP_Name, Emp_M0, TemplateID, Q1, Q1yn, Q1com, Q1fin, Q2, Q2yn, Q2com, Q2fin, 
							Q3, Q3yn, Q3com, Q3fin, Q4, Q4yn, Q4com, Q4fin, Q5, Q5yn, Q5com, Q5fin, Q6, Q6yn, Q6com, Q6fin, 
							Q7, Q7yn, Q7com, Q7fin, Q8, Q8yn, Q8com, Q8fin, Q9, Q9yn, Q9com, Q9fin, Q10, Q10yn, Q10com, Q10fin, 
							Q11, Q11yn, Q11com, Q11fin, Q12, Q12yn, Q12com, Q12fin, Complete, [TimeStamp], UploadTimeStamp, QtrID )
VALUES ('Goodwin, William', 'M011245', '2018-01-03-13:4:2:370', 'Have there been any significant changes (products, processes, or people) that would impact the internal control environment within your area of responsibility?', 'Yes', 'Significant Changes Made', NULL, 
		'If yes to Q1, have you assessed the potential risks and identified remediation steps to address these risks?', 'No',	NULL, NULL,	
		'If there have been changes in your internal control environment, have those changes been reflected in the Risk and Control Library?', 'Yes', 'Always up to date', NULL, 
		'Within your area, are all SOX controls appropriately designed to provide reasonable assurance regarding the reliability of financial reporting and were they operating as designed during the quarterly reporting period?', 'Yes',	'Always works appropriately', NULL, 
		'Are all non-SOX controls in your area operating as designed to mitigate the risk they were intended to address?', 'Yes', 'We are the best risk mitigators. Flawless mitigators of risk we are.', NULL,	
		'Is the appropriate documentation available to support your assessments in questions 4 and 5?',	'Yes', 'I said yes, but please do not try to follow up on it. That was a lie.',	NULL, 
		'Are you aware of any events that could materially impact the financial statement that have not been reported to the Chief Accounting Officer, Chief Financial Officer, or through the Risk Reporting Hotline?', 'No', 'As a top risk mitigator, we mitigate all risks and no other mitigator need to mitigate.', NULL, 
		NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', DEFAULT,	NULL, '1q18')




/* '2018-01-03-17:11:24:865' */


select * from AttResponse


delete from AttResponse
where Emp_Name = 'Holt, John'
--where Emp_Name = 'Semple, Robert'
where Emp_Name = 'Fisher, Robert'


/* '2018-01-03-17:11:24:865' */


select * from Emp_Mgr
where EMP_Name like 'Semple, %'
