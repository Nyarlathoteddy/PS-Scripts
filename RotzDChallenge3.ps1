<# Assign different cmdlets to a local variable. 
Locate 4 different cmdlets that return arrays and show what method you used to determine this/print the results. #>
$commands = Get-Command
($commands).GetType()
$ips = Get-NetIPAddress
($ips).GetType()
$dns = Get-DnsClient
($dns).GetType()
$localusers = Get-LocalUser
($localusers).GetType()

#Assign the results of ipconfig to a local variable. Return only the IPv4 address. (Remember blank lines count as elements)
$ipinfo = ipconfig.exe
" "
$ipinfo[8]
<# Create a script to display local user data from your computer. 
Return the name of the first and second local user and their descriptions in the format with context like “The username is: “ “With a description of” #>
" "
$users = Get-LocalUser
"The username of the first account is: " + $users[0].Name
"The description of the first account is: " + $users[0].Description
"The username of the second account is: " + $users[1].Name
"The description of the second account is: " + $users[1].Description
" "
# Use a loop to gather ALL local usernames and descriptions into a sentence format like above.
foreach($user in $users){
    "The username of the account is: " + $user.Name
    "The description of the account is: " + $user.Description
}
" "
<# Use the random cmdlet to generate a random number between 1 – 100. 
Use a loop to output the results of that number until it is equal to 100. Format the results to say “The number is: “ “Still not 100!”. 
Once it reaches 100 output “The number is now 100!” #>

for($i = Get-Random -Minimum 1 -Maximum 100; $i -le 100; $i++){
    if ($i -lt 100) {
        "The number is: " + $i + " still not 100!"   
    } else {
        "The number is now " + $i
    }
}
" "
<# Use the random cmdlet to generate a random number between 1 – 10. 
Use a loop to output the results of the number until it does not equal 5, make sure the script runs at least once.
Regenerate the random number for each iteration. #>
do {
    $j = Get-Random -Minimum 1 -Maximum 10
    "Number is currently: " + $j
} while ($j -ne 5)