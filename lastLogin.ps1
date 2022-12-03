# Gives a terminal output with formatted table
Get-ADUser -Filter {(Enabled -eq $True)} -Properties * | Where {($_.LastLogonDate -lt (Get-Date).AddDays(-30) -and ($_.LastLogonDate -ne $NULL))} | FT Name,Givenname,lastlogondate




