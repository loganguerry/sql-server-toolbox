#There is a Windows Scheduled task on my machine that runs
#PowerShell -File "E:\OneDrive\toolbox\zip toolbox.ps1"

#Full toolbox
cd E:\OneDrive\toolbox
get-childitem .\* -Recurse | Where-Object {$_.FullName -notlike '*\.git*' }  | Where-Object {$_.FullName -notlike "*.zip" } | Compress-Archive -DestinationPath .\toolbox.zip -Force 

#Stable state checklist files only
$stablestate  = (
    '*autogrow*',
    'Backup History*', 
    '*Configuration Changes History*',
    '*CPU Utilization*', 
    '*Database Owner*',
    '*Database Mail Diag*', 
    '*Database Settings*', 
    '*Error Log.sql*', 
    '*Find Memory Mini Dumps*', 
    '*Fix Orphaned SID*', 
    '*Gather Log Events*', 
    '*Job Owners*', 
    '*Public Permissions*',
    '*Page Life Expectancy*', 
    '*Sharepoint databases*', 
    'Space in files*', 
    '*Stats out of Date', 
    '*TempDB*', 
    '*VLFs*',
    'Volume Stats*' );

get-childitem .\* -Recurse -include $stablestate | Compress-Archive -DestinationPath .\toolbox-stablestate.zip -Force 
