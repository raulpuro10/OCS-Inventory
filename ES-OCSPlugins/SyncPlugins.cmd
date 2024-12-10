@echo off

If exist "%programfiles%\OCS Inventory Agent\Plugins" xcopy /d /e /s /y "\\newrest.corp\SysVol\newrest.corp\Policies\{AB1AE6D7-CC7C-46BB-8FD9-6F65498A5659}\Machine\Scripts\Startup\Plugins\*.*" "%programfiles%\OCS Inventory Agent\Plugins"


If exist "%programfiles(x86)%\OCS Inventory Agent\Plugins" xcopy /d /e /s /y "\\newrest.corp\SysVol\newrest.corp\Policies\{AB1AE6D7-CC7C-46BB-8FD9-6F65498A5659}\Machine\Scripts\Startup\Plugins\*.*" "%programfiles(x86)%\OCS Inventory Agent\Plugins"