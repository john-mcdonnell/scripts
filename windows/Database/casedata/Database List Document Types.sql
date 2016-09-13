SELECT
	dt.DocumentTypeDesc,
	dst.subtypedesc
FROM
	dbo.documenttypes dt,
	dbo.documentsubtype dst
WHERE
	dt.DocumentTypeID		= dst.documenttypeid
ORDER BY
	dt.DocumentTypeDesc,
	dst.subtypedesc