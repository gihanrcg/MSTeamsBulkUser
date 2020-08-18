$GROUP_ID = Read-Host -Prompt 'Input Group ID'

Connect-MicrosoftTeams     

$global:TeamGuests = Get-TeamUser -GroupId $GROUP_ID -Role Member | select name
$global:Owner = Get-TeamUser -GroupId $GROUP_ID -Role Owner | select name

Write-Output $global:TeamGuests

foreach ($item in $global:TeamGuests) {
    $item.name | Out-File -Encoding Ascii -append TeamMembers.txt 
}

foreach ($item in $global:Owner) {
    $item.name | Out-File -Encoding Ascii -append TeamOwners.txt 
}
