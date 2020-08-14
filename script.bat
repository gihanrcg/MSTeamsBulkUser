@echo off

set /p GROUP_ID="Enter Group ID: "
set /p FILE_LOCATION="Enter the path to the emails csv file: "
set /p USER_TYPE="Enter the user type (Owner/Member): "

echo ID %GROUP_ID% 
echo path %FILE_LOCATION%

Powershell.exe -Command "Import-Csv -Path '%FILE_LOCATION%' | foreach{Add-TeamUser -GroupId %GROUP_ID% -user $_.email -role %USER_TYPE%}"

pause