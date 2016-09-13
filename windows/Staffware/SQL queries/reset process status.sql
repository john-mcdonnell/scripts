select logical_process_name, last_known_status from jfv10.swpro.process_config
select logical_process_name, logical_process_instance from jfv10.swpro.running_processes

update jfv10.swpro.process_config set last_known_status = 'STOPPED'
delete from jfv10.swpro.running_processes
