/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [EMP_Name]
      ,[EMP_M0]
      ,[EMP_Email]
      ,[MGR_Name]
      ,[MGR_M0]
      ,[MGR_Email]
  FROM [ERMDB].[dbo].[EMP_MGR]

  --where EMP_Name = 'Andrew Kowaalski'
  --where EMP_Name = 'James Downes'
  --where EMP_Name = 'Ashlee Yocum'
  --where EMP_Name = 'Nieve Furcoy'
  where EMP_Name = 'Jordan Phillips'

 --delete from ERMDB.dbo.EMP_MGR
 --where EMP_Name = 'Andrew Kowalski'
 --where EMP_Name = 'James Downes'
 --where EMP_Name = 'Ashlee Yocum'
 --where EMP_Name = 'Nieves Furcoy'

select EMP_Name, EMP_M0
 FROM [ERMDB].[dbo].[EMP_MGR]
 where EMP_M0 = 'NULL'

