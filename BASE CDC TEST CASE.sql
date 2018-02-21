
-- checks to see if cdc is enabled on specified DB

select is_cdc_enabled
from sys.databases
where name = 'ERMDB'




-- enables cdc on database

EXEC sys.sp_cdc_enable_db
--EXEC sys.sp_cdc_disable_db


-- enables cdc on specific tables

EXEC sys.sp_cdc_enable_table
--EXEC sys.sp_cdc_disable_table
@source_schema = 'dbo'
@source_name = 'tblMyNewTable'



select *
from cdc.changes_tables