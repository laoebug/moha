::https://www.google.la/search?q=how+to+save+5+days+backup+file+on+windows&ei=bOPGWqCADoKcvQTYm76gBg&start=10&sa=N&biw=1427&bih=635
@echo off

:: make sure to change the settings from line 4-9
set dbUser=root
set dbPassword="root2wsx@WSX"
set backupDir="D:\moha_db_backup"
set mysqldump="D:\xampp\mysql\bin\mysqldump.exe"
set mysqlDataDir="D:\xampp\mysql\data"
set zip="C:\Program Files\7-Zip\7z.exe"

:: get date
for /F "tokens=1,2,3 delims=/ " %%i in ('date /t') do (
	set mm=%%j
	set dd=%%i
	set yy=%%k
)

if %mm%==01 set Month="01"
if %mm%==02 set Month="02"
if %mm%==03 set Month="03"
if %mm%==04 set Month="04"
if %mm%==05 set Month="05"
if %mm%==06 set Month="06"
if %mm%==07 set Month="07"
if %mm%==08 set Month="08"
if %mm%==09 set Month="09"
if %mm%==10 set Month="10"
if %mm%==11 set Month="11"
if %mm%==12 set Month="12"
::echo %dd%
::echo %mm%
::echo %yy%
set dirName=%yy%_%mm%_%dd%
set fileSuffix=%yy%_%mm%_%dd%

:: remove echo here if you like
echo "dirName"="%dirName%"

:: switch to the "data" folder
:: pushd "%mysqlDataDir%"

:: create backup folder if it doesn't exist
:: if not exist %backupDir%\%dirName%\   mkdir %backupDir%\%dirName%
 if not exist %backupDir% mkdir %backupDir%
:: iterate over the folder structure in the "data" folder to get the databases

:: 	%mysqldump% --host="localhost" --user=%dbUser% --password=%dbPassword%  --routines moha > %backupDir%\%dirName%\moha_%fileSuffix%.sql

%mysqldump% --host="localhost" --user=%dbUser% --password=%dbPassword%  --routines moha > %backupDir%\moha_%fileSuffix%.sql
popd

:: Delete the files if it is is 7 days old or older:

:: forfiles /p %backupDir%  /m  *.*  /c "cmd /c Del *.* " /d -7

::forfiles /p %backupDir% /m *.sql /c "cmd /c Del *.sql " /d -7
forfiles /p %backupDir%  /s /m *.* /c "cmd /c Del @path" /d -7
