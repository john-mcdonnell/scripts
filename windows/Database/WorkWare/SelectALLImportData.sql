SELECT
		*
FROM
		dbo.MAPMember
ORDER BY
		MemberId

SELECT
		*
FROM
		dbo.EXTSourceMember
ORDER BY
		IDEXTSourceMember

SELECT
		*
FROM
		dbo.MAPWkgroup
ORDER BY
		WkgroupId

SELECT
		*
FROM
		dbo.EXTSourceWkgroup
ORDER BY
		IDEXTSourceWkgroup

SELECT
		*
FROM
		dbo.MAPCoreTask
ORDER BY
		CoreTaskId

SELECT
		*
FROM
		dbo.EXTSourceCoreTask
ORDER BY
		IDEXTSourceCoreTask

SELECT
		*
FROM
		dbo.TRFCoreTaskWIP
ORDER BY
		WkgroupId

SELECT
		*
FROM
		dbo.TRFCoreTaskWorkDone
ORDER BY
		CoreTaskId
