DECLARE @proc_id	INTEGER
DECLARE @object_guid	VARCHAR(36)

SELECT @proc_id= proc_id from jfv10.swpro.proc_index where proc_name='fred'

DELETE FROM jfv10.swpro.procedure_lock WHERE proc_id=@proc_id

SELECT @object_guid= object_guid FROM jfv10.swpro.pm_objects where proc_id= @proc_id

DELETE FROM jfv10.swpro.pm_objects_lock where object_guid= @object_guid

