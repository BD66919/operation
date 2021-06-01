::author:JiangZD
::descript:自动映射共享文件夹

@echo off

cd /d %~dp0
for /f "tokens=1,2 delims==" %%i in (config.ini) do (
  if "%%i"=="IP" set IP=%%j
  if "%%i"=="PATH" set PATH=%%j
  if "%%i"=="USER" set USER=%%j
  if "%%i"=="PASSWORD" set PASSWORD=%%j
 )

cd /d c:\windows\system32
::start
::ping -n 1 %IP% |findstr /i "ttl=">nul&&goto :next||goto :start
::goto :start
::next

net use z: %PATH% "%PASSWORD%" /user:"%USER%"

for /d %%i in (Z:/*) do (
set folderName=%%~ni
)


if "%folderNames%"=="" (net use z: %PATH% "%PASSWORD%" /user:"%USER%"
cd /d %~dp0
echo %date% %time% >>log.txt
echo Connect failure >>log.txt
) else (
cd /d %~dp0
echo %date% %time% >>log.txt 
echo Connect success >>log.txt
)

pause






