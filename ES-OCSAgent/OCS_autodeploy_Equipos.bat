@echo off
REM ********************************************************************************
REM **** OCSAgentSetup.exe install by GPO                                       ****
REM **** by ragasys                                                             ****
REM **** You must use it in a logon computer script in your Active Directory    ****
REM ********************************************************************************

REM **** Please set here the version of the agent you use. 
REM **** Change it to upgrade the agent on all computer.
set VERSION=2920

REM **** This is the fully qualified domain name of your OCS Inventory ng server.
set OCSSERVER=http://SERVERIP/ocsinventory

REM **** You must put here the address of your file server where OCSAgentSetup.exe is.
REM **** For exemple :
REM **** If OCSAgentSetup.exe is on \\filesserver\public\ocs\OCSAgentSetupx64.exe
REM **** you must put : fileserver\public\ocs
set INSTALLSERVER=GPO PATH\Machine\Scripts\Startup
REM **** Set to ON if you want install the SSL certificat and activate deployement feature
REM **** before enable it : put the file cacert.pem on the sames directory as OCSAgentSetup.exe
set DEPLOYE=OFF


IF NOT EXIST "C:\Program Files\OCS Inventory agent\%VERSION%.txt" goto uninstall
REM **** IF EXIST "C:\Program Files (x86)\OCS Inventory agent\uninst.exe" goto uninstall
IF EXIST "C:\Program Files\OCS Inventory agent\%VERSION%.txt" goto endend

:install 
REM **** \\%INSTALLSERVER%\OCSAgentSetupx64.exe H /NOW /NO_SYSTRAY /SERVER:%OCSSERVER%
if /i "%PROCESSOR_ARCHITECTURE%"=="x86" (
    if not defined PROCESSOR_ARCHITEW6432 (
        \\%INSTALLSERVER%\OCSAgentSetupx86.exe /S /SERVER:http://SERVERIP/ocsinventory /NOSPLASH /NOW /DEBUG
    ) else (
        \\%INSTALLSERVER%\OCSAgentSetupx64.exe /S /SERVER:http://SERVERIP/ocsinventory /NOSPLASH /NOW /DEBUG
    )
) else (
    \\%INSTALLSERVER%\OCSAgentSetupx64.exe /S /SERVER:http://SERVERIP/ocsinventory /NOSPLASH /NOW /DEBUG
)

timeout 60
cd "C:\Program Files (X86)\OCS Inventory agent\"
echo pwouet > %VERSION%.txt
goto endend


:uninstall
cd "C:\PROGRAM Files (x86)\OCS Inventory agent\"
uninst.exe /S
goto install



:endend
