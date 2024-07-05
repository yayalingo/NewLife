write-host "collecting information about the domain"
Get-ADDomain
Get-ADDefaultDomainPasswordPolicy

write-host "collecting information about computers:"
Get-ADComputer -filter * | Select-Object Name,Enabled | Export-CSV -Path ./computers.csv

Write-Host "collecting information about users and groups:"
Get-ADUser -filter * | Select-Object Name,SamAccountName,Enabled | Export-CSV -Path ./users.csv
Get-ADGroup -filter * | Where-Object {$_.SamAccountName -like '*admin*'} | Format-Table
Get-ADGroupMember -Identity Administors | Export-CSV -Path ./admins.csv

Write-Host "collecting information about the DC and Forest:"
Get-ADDomainController
Get-ADForest

Write-Host "Done!!"