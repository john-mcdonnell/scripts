/*
To determine which version of SQL Server 2000 is running, connect to SQL Server 2000 by using Query Analyzer, and then run the following code: -
*/
SELECT  SERVERPROPERTY('productversion'), SERVERPROPERTY ('productlevel'), SERVERPROPERTY ('edition')
