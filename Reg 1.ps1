Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

# Define the URL  
$url = "https://helgeklein.com/downloads/SetACL/current/SetACL%203.1.2%20(executable%20version).zip"
  
# Define the output path  
$output = "C:\SetACL.zip"
  
# Use Invoke-WebRequest to download the file  
Invoke-WebRequest -Uri $url -OutFile $output

# Define the path to the ZIP file  
$zipPath = "C:\SetACL.zip"  
  
# Define the path where you want to extract the ZIP file  
$extractPath = "C:\"  
  
# Use Expand-Archive to extract the ZIP file  
Expand-Archive -Path $zipPath -DestinationPath $extractPath  


cd "C:\SetACL (executable version)\64 bit\"

.\SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\IdentityStore\LogonCache\B16898C6-A148-4967-9171-64D755DA8520\SubPkgs\UNXT" -ot reg -actn setowner -ownr "n:Administrators" -rec Yes
.\SetACL.exe -on "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\IdentityStore\LogonCache\B16898C6-A148-4967-9171-64D755DA8520\SubPkgs\UNXT" -ot reg -actn setowner -ownr "n:Administrators" -ot reg -actn ace -ace "n:Administrators;p:full" -rec Yes

reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\IdentityStore\LogonCache\B16898C6-A148-4967-9171-64D755DA8520\SubPkgs\UNXT" /f