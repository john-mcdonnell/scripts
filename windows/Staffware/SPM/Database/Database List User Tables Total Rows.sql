SELECT 
			'SELECT ''' + name + ' Table contains '' + CONVERT(VARCHAR(5), COUNT(*)) + '' rows(s).'' from ' + name AS Table_Row_Count
FROM 
			sysobjects 
WHERE 
			xtype		=	'U'
GROUP BY
			name
ORDER BY
			Table_Row_Count
