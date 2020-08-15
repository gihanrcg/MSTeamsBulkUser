Write-Host "Starting the script..."

$FILE_LOCATION = Read-Host -Prompt 'Enter the path to the emails csv file'
$GROUP_ID = Read-Host -Prompt 'Input Group ID'
$USER_TYPE = Read-Host -Prompt 'User Type(Owner/Member)'
$USER_EMAILS = Import-Csv -Path "$FILE_LOCATION"


if (Get-Module -ListAvailable -Name MicrosoftTeams) {
    Write-Host "Microsoft Teams Module already Installed"
} 
else {
    try {
        Write-Host "Installing Microsoft Teams Module"
        Install-Module -Name MicrosoftTeams -AcceptLicense -AllowClobber -Confirm:$False -Force  
        
    }
    catch [Exception] {
        $_.message 
        exit
    }
}

Connect-MicrosoftTeams

foreach ($email in $USER_EMAILS) {   
    Write-Host "--------------------------------------------------------------"
    Write-Host ("Adding " + $email.email)
    Add-TeamUser -GroupId $GROUP_ID -user $email.email -role $USER_TYPE    
}

Write-Host " "
Write-Host " "
Write-Host "--------------------------------------------------------------"
Write-Host "Users added to the team successfully !"
Write-Host "--------------------------------------------------------------"

CMD /c PAUSE