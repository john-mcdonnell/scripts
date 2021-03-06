/****** Object:  Database SWToWW    Script Date: 02/12/2004 12:34:15 ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWToWW')
	DROP DATABASE [SWToWW]
GO

CREATE DATABASE [SWToWW]  ON (NAME = N'SWToWW_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SWToWW_Data.MDF' , SIZE = 1, FILEGROWTH = 10%) LOG ON (NAME = N'SWToWW_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL\Data\SWToWW_Log.LDF' , SIZE = 1, FILEGROWTH = 10%)
 COLLATE Latin1_General_CI_AS
GO

exec sp_dboption N'SWToWW', N'autoclose', N'true'
GO

exec sp_dboption N'SWToWW', N'bulkcopy', N'false'
GO

exec sp_dboption N'SWToWW', N'trunc. log', N'true'
GO

exec sp_dboption N'SWToWW', N'torn page detection', N'true'
GO

exec sp_dboption N'SWToWW', N'read only', N'false'
GO

exec sp_dboption N'SWToWW', N'dbo use', N'false'
GO

exec sp_dboption N'SWToWW', N'single', N'false'
GO

exec sp_dboption N'SWToWW', N'autoshrink', N'true'
GO

exec sp_dboption N'SWToWW', N'ANSI null default', N'false'
GO

exec sp_dboption N'SWToWW', N'recursive triggers', N'false'
GO

exec sp_dboption N'SWToWW', N'ANSI nulls', N'false'
GO

exec sp_dboption N'SWToWW', N'concat null yields null', N'false'
GO

exec sp_dboption N'SWToWW', N'cursor close on commit', N'false'
GO

exec sp_dboption N'SWToWW', N'default to local cursor', N'false'
GO

exec sp_dboption N'SWToWW', N'quoted identifier', N'false'
GO

exec sp_dboption N'SWToWW', N'ANSI warnings', N'false'
GO

exec sp_dboption N'SWToWW', N'auto create statistics', N'true'
GO

exec sp_dboption N'SWToWW', N'auto update statistics', N'true'
GO

if( ( (@@microsoftversion / power(2, 24) = 8) and (@@microsoftversion & 0xffff >= 724) ) or ( (@@microsoftversion / power(2, 24) = 7) and (@@microsoftversion & 0xffff >= 1082) ) )
	exec sp_dboption N'SWToWW', N'db chaining', N'false'
GO

use [SWToWW]
GO

/****** Object:  Table [dbo].[MAPCoreTask]    Script Date: 02/12/2004 12:34:15 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAPCoreTask]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MAPCoreTask]
GO

/****** Object:  Table [dbo].[MAPMember]    Script Date: 02/12/2004 12:34:15 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAPMember]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MAPMember]
GO

/****** Object:  Table [dbo].[MAPWkgroup]    Script Date: 02/12/2004 12:34:15 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[MAPWkgroup]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[MAPWkgroup]
GO

/****** Object:  Table [dbo].[TRFCoreTaskWIP]    Script Date: 02/12/2004 12:34:15 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TRFCoreTaskWIP]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TRFCoreTaskWIP]
GO

/****** Object:  Table [dbo].[TRFCoreTaskWorkDone]    Script Date: 02/12/2004 12:34:15 ******/
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[TRFCoreTaskWorkDone]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[TRFCoreTaskWorkDone]
GO

/****** Object:  Login casedata    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'casedata')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'casedata', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'casedata', null, @logindb, @loginlang
END
GO

/****** Object:  Login spm    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'spm')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'spm3100', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'spm', null, @logindb, @loginlang
END
GO

/****** Object:  Login swpro    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'swpro')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'staffware', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'swpro', null, @logindb, @loginlang
END
GO

/****** Object:  Login SWToWW    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'SWToWW')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'SWToWW', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'SWToWW', null, @logindb, @loginlang
END
GO

/****** Object:  Login swuser    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from master.dbo.syslogins where loginname = N'swuser')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'staffware', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'swuser', null, @logindb, @loginlang
END
GO

/****** Object:  User dbo    Script Date: 02/12/2004 12:34:15 ******/
/****** Object:  User SWToWW    Script Date: 02/12/2004 12:34:15 ******/
if not exists (select * from dbo.sysusers where name = N'SWToWW' and uid < 16382)
	EXEC sp_grantdbaccess N'SWToWW', N'SWToWW'
GO

/****** Object:  Table [dbo].[MAPCoreTask]    Script Date: 02/12/2004 12:34:15 ******/
CREATE TABLE [dbo].[MAPCoreTask] (
	[CoreTaskId] [varchar] (64) COLLATE Latin1_General_CI_AS NOT NULL ,
	[CoreTaskName] [varchar] (255) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MAPMember]    Script Date: 02/12/2004 12:34:15 ******/
CREATE TABLE [dbo].[MAPMember] (
	[MemberId] [varchar] (64) COLLATE Latin1_General_CI_AS NOT NULL ,
	[MemberName] [varchar] (255) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[MAPWkgroup]    Script Date: 02/12/2004 12:34:15 ******/
CREATE TABLE [dbo].[MAPWkgroup] (
	[WkgroupId] [varchar] (64) COLLATE Latin1_General_CI_AS NOT NULL ,
	[WkgroupName] [varchar] (255) COLLATE Latin1_General_CI_AS NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TRFCoreTaskWIP]    Script Date: 02/12/2004 12:34:16 ******/
CREATE TABLE [dbo].[TRFCoreTaskWIP] (
	[WorkDate] [datetime] NOT NULL ,
	[WkgroupId] [varchar] (64) COLLATE Latin1_General_CI_AS NOT NULL ,
	[CoreTaskId] [varchar] (64) COLLATE Latin1_General_CI_AS NOT NULL ,
	[Items] [int] NOT NULL 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[TRFCoreTaskWorkDone]    Script Date: 02/12/2004 12:34:16 ******/
CREATE TABLE [dbo].[TRFCoreTaskWorkDone] (
	[WorkDate] [datetime] NULL ,
	[WkgroupId] [char] (64) COLLATE Latin1_General_CI_AS NULL ,
	[MemberId] [char] (64) COLLATE Latin1_General_CI_AS NULL ,
	[CoreTaskId] [char] (64) COLLATE Latin1_General_CI_AS NULL ,
	[Items] [int] NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[MAPCoreTask] WITH NOCHECK ADD 
	CONSTRAINT [PK_MAPCoreTask] PRIMARY KEY  CLUSTERED 
	(
		[CoreTaskId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MAPMember] WITH NOCHECK ADD 
	CONSTRAINT [PK_MAPMember] PRIMARY KEY  CLUSTERED 
	(
		[MemberId]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[MAPWkgroup] WITH NOCHECK ADD 
	CONSTRAINT [PK_MAPWkgroup] PRIMARY KEY  CLUSTERED 
	(
		[WkgroupId]
	)  ON [PRIMARY] 
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPCoreTask]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPCoreTask]  TO [SWToWW]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPMember]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPMember]  TO [SWToWW]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPWkgroup]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[MAPWkgroup]  TO [SWToWW]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TRFCoreTaskWIP]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TRFCoreTaskWIP]  TO [SWToWW]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TRFCoreTaskWorkDone]  TO [public]
GO

GRANT  SELECT ,  UPDATE ,  INSERT ,  DELETE  ON [dbo].[TRFCoreTaskWorkDone]  TO [SWToWW]
GO

