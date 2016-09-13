SELECT 
			table_name,
			column_name,
			data_type,
			character_maximum_length,
			is_nullable 
FROM 
			information_schema.columns 
WHERE
			table_name in 	(SELECT 
											name
							 FROM 
											sysobjects 
							 WHERE 
											xtype='U')
ORDER BY 
			table_name