Write-Host "Starting the script..."

$FILE_LOCATION = Read-Host -Prompt 'Enter the path to the emails csv file'
$GROUP_ID = Read-Host -Prompt 'Input Group ID'
$CHANNEL_NAME = Read-Host -Prompt 'Channel Name)'
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
    Add-TeamChannelUser -GroupId $GROUP_ID -DisplayName $CHANNEL_NAME -User $email.email 
    
}

Write-Host " "
Write-Host " "
Write-Host "--------------------------------------------------------------"
Write-Host "Users added to the channel successfully !"
Write-Host "--------------------------------------------------------------"

CMD /c PAUSE