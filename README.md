This simple batch script uses Microsoft Teams module for powershell to add people to teams using a csv.  

# Update  15.08.2020 #

Now you can run the **powershell.ps1** script which will take care of the module installation and login for you. Or else you can use the same **script.bat** file.

# #

## Prerequisites ##

- In your search bar in Windows 10 or in your Start button, search for PowerShell. Select the Windows PowerShell app and right click and **Run as administrator**.

- Then you need to install Microsoft Teams module in Powershell. This allows us to manipulate teams with command lines. Type following command in your powershell window.

        Install-Module -Name MicrosoftTeams

- Command will prompt for installation confirmation. Select **yes to all** and proceed.

- If you do not see any errors, you are good to go.

- Then, we need to login to MS Teams using Powershell. 
    
        Connect-MicrosoftTeams

    This will popup an login window and you need to login with the correct teams account.


## Running the Script ##

You need following information before running the script.

- ### Group ID of the team. ###
    You can run 
        
        Get-Team    
    command to find all the group IDs of your teams.
    
    Else you can get the teams invite link from teams UI. You can find the group Id in the URL parameters. 

- ### Create a csv (comma seperated values) file. ###

    The simplest way to achieve this is to open a notepad and type following

    > email    
    > abc@test.com <br />
    > cde@test.com <br />
    > fgh@test.com

then save that in **.csv** format. For this example I am going to save it as **myemails.csv**

## You can run the script.bat now ##
