@echo off
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set mydate=%%c%%a%%b)
for /f "tokens=1-2 delims=/:" %%a in ("%TIME%")  do (set mytime=%%a%%b)

mysqldump -u root -p sams > C:\mysql_backup\C_%mydate%_%mytime%.sql