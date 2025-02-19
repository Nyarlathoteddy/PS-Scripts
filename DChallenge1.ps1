#Display the name of your current computer with the message ‘My computer name is: ’ Assign the ENV variable to a session variable and execute the variable in your output statement.
$ComputerName = $env:COMPUTERNAME
"My computer name is: " + $ComputerName

#Display the current username logged into the computer with the message ‘My username is: ‘. Assign the env variable and execute the variable in your output statement.
$username = $env:USERNAME
"My username is: " + $username

#Search through Get-Command to locate cmdlets related to your computer. Display only the OSName property by piping to Select-Object. The output should read ‘my current OS name is: ‘ Assign the command to a variable and execute the variable in your output statement. If your results have weird formatting that's OK.
$OSName = Get-ComputerInfo | Select-Object -Property OsName
"My current OS name is: " + $OSName
$OSNamev2 = (Get-ComputerInfo).OsName
"My current OS name is: " + $OSNamev2

#Search through the Get-Command to locate Cmdlets related to IP addresses. Display the IP address from your Local Area Connection, filter the results to show only the currently used network adaptor. Pipe the results to Select-Object to display only the interface alias (or interface Index) and the ipv4address properties.
$IPInterfaceInfo =  Get-NetIPAddress -InterfaceAlias Ethernet0 -AddressFamily IPv4 | Select-Object -Property IPAddress, InterfaceAlias
"My IP Address and Interface is: "
$IPInterfaceInfo
$IPInterfaceInfov2 = (Get-NetIPAddress -InterfaceAlias Ethernet0 -AddressFamily IPv4).IPAddress
$IPInterfaceAlias = (Get-NetIPAddress -InterfaceAlias Ethernet0 -AddressFamily IPv4).InterfaceAlias
"My IP Address and Interface is: " + $IPInterfaceInfov2 + " and " + $IPInterfaceAlias
#If you have extra time, are there other ways specific properties can be displayed instead of Select-Object? (Hint: . ) To reference an output of a cmdlet you may need to put it in parenthesis when using the .
#You can also display properties with Where-Object as well. Format-Table can also be used to display information, but is not useful if that information is then piped elsewhere.