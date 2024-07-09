USE [master]
GO
 
CREATE DATABASE [xxx]
GO
 
RESTORE DATABASE [xxx]
FROM DISK = N'/var/opt/mssql/data/yyy.bak' 
WITH   
MOVE N'zzz' TO N'/var/opt/mssql/data/yyy.mdf',  
MOVE N'zzz_log' TO N'/var/opt/mssql/data/yyy_log.ldf',  
NOUNLOAD,  REPLACE,  STATS = 5
 
GO