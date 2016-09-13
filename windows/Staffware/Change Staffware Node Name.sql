USE XXX
GO

BEGIN TRANSACTION

--Get the lowest Case Number of the most recent (i.e. biggest) 1000 Case Numbers
DECLARE @minimum_case_number numeric(13)
SET @minimum_case_number = (SELECT max(casenum) from swpro.case_information where casenum not in (SELECT top 1000 casenum from swpro.case_information order by casenum desc))
SELECT count(*) AS 'Total Cases' from swpro.case_information
SELECT @minimum_case_number AS 'Minimum Case Number'
SELECT count(*) AS 'Total Casesto Delete' from swpro.case_information where casenum <= @minimum_case_number

DECLARE @case_number numeric(13)
DECLARE cases_to_delete CURSOR FOR 
	SELECT 	
		ci.casenum
	FROM 	
		swpro.case_information ci
	WHERE 	
		ci.casenum				<= @minimum_case_number
FOR READ ONLY

--Delete swpro.case_information records
OPEN cases_to_delete
--FETCH FIRST FROM cases_to_delete INTO @case_number
FETCH NEXT FROM cases_to_delete INTO @case_number
IF @@FETCH_STATUS <> 0
	BEGIN
		SELECT 'No Case records less than "' + LTRIM(RTRIM(CAST(@minimum_case_number AS char(13)))) + '"...' AS 'Status'
	END
			
WHILE @@FETCH_STATUS = 0
	BEGIN
		DELETE FROM SELECT swpro.case_information WHERE casenum = @case_number
		FETCH NEXT FROM cases_to_delete INTO @case_number
	END
CLOSE cases_to_delete
DEALLOCATE cases_to_delete

DECLARE @old_node_name varchar(30)
SET @old_node_name = 'lvswprod'
DECLARE @new_node_name varchar(30)
SET @new_node_name = 'staffw_nod1'
DECLARE @old_machine_name varchar(30)
SET @old_machine_name = 'UKEXSCMS014'
DECLARE @new_machine_name varchar(30)
SET @new_machine_name = 'W2HZGBJS01'

--Update audit_trail table
update swpro.audit_trail set user_name = REPLACE(user_name, @old_node_name, @new_node_name)

--Update case_data table
update swpro.case_data set field_value = REPLACE(field_value, @old_node_name, @new_node_name)
update swpro.case_data set field_value_n = REPLACE(field_value_n, @old_node_name, UPPER(@new_node_name))

--Update case_information table
update swpro.case_information set starter = REPLACE(starter, @old_node_name, @new_node_name)

--update eai_registry table
update swpro.eai_registry set plugin_library = REPLACE(plugin_library, @old_node_name, @new_node_name)
update swpro.eai_registry set init_params = REPLACE(init_params, @old_node_name, @new_node_name)

--update node_cluster table
update swpro.node_cluster set physical_machine_name = REPLACE(physical_machine_name, @old_machine_name, @new_machine_name)
update swpro.node_cluster set machine_comment = REPLACE(machine_comment, @old_machine_name, @new_machine_name)

--update nodes table
update swpro.nodes set node_name = REPLACE(node_name, @old_node_name, @new_node_name)
update swpro.nodes set dir_name = REPLACE(dir_name, @old_node_name, @new_node_name + '.n')

--update outstanding_addr table
update swpro.outstanding_addr set user_name = REPLACE(user_name, @old_node_name, @new_node_name)

--update qaccess table
update swpro.qaccess set queue_name = REPLACE(queue_name, @old_node_name, @new_node_name)
update swpro.qaccess set access_str = REPLACE(access_str, @old_node_name, @new_node_name)

--update role_users table
update swpro.role_users set usernode_name = REPLACE(usernode_name, @old_node_name, @new_node_name)

--update staffo table
update swpro.staffo set o_username = REPLACE(o_username, @old_node_name, @new_node_name)
update swpro.staffo set o_startname = REPLACE(o_startname, @old_node_name, @new_node_name)
update swpro.staffo set o_host = REPLACE(o_host, @old_node_name, @new_node_name)
update swpro.staffo set o_reqidhost = REPLACE(o_reqidhost, @old_node_name, @new_node_name)

--update tsys_role_users table
update swpro.tsys_role_users set usernode_name = REPLACE(usernode_name, @old_node_name, @new_node_name)

ROLLBACK

DBCC SHRINKDATABASE (XXX, 1)
GO