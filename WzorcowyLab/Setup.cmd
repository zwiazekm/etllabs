@Echo Off
ECHO Preparing the lab environment...

REM - Get current directory
SET SUBDIR=%~dp0

REM - Restart SQL Server Service to force closure of any open connections
NET STOP MSSQLLaunchpad
NET STOP SQLSERVERAGENT
NET STOP MSSQLSERVER
NET START MSSQLSERVER
NET START SQLSERVERAGENT
NET START MSSQLLaunchpad

REM - Run SQL Script to prepare the database environment
ECHO Preparing databases...
SQLCMD -E -i %SUBDIR%SetupFiles\Setup.sql

REM - Reset files and folders used in labs
ECHO Preparing lab files...
RMDIR D:\Accounts /S /Q
RMDIR D:\ETL /S /Q
MD D:\ETL
XCOPY %SUBDIR%SetupFiles\Accounts D:\Accounts /E /C /I /Q

ECHO Deleting SMTP email drop folder...
DEL C:\inetpub\mailroot\Drop\*.* /Q

