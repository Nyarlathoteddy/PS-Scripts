<#Create a PowerShell Object called Person that contains the properties:
a. Name

b. Age

c. Major

d. YearBorn (calculate using Age and current date and pass the info into the property value) #>
$Person = New-Object System.Object
Add-Member -MemberType NoteProperty -Name Name -Value "Teddy" -InputObject $Person
Add-Member -MemberType NoteProperty -Name Age -Value 20 -InputObject $Person
Add-Member -MemberType NoteProperty -Name Major -Value "Degree" -InputObject $Person
$yearBorn = (Get-Date -Format yyyy) - $Person.Age
if ((Get-Date -Format ddMM) -lt (Get-Date -Day 16 -Month 6 -Format ddMM)) {
    $yearborn--
}
Add-Member -MemberType NoteProperty -Name YearBorn -Value $yearBorn -InputObject $Person

#Create a method called Greeting that returns the Name, Age, Major and YearBorn properties of your object in a sentence format.
Add-Member -MemberType ScriptMethod -Name Greeting -InputObject $Person -Value {"Hello, I am " + $Person.Name + ". I am " + $Person.Age + " years old and was born in " + $Person.YearBorn + ". I am currently going to Penn College for " +  $Person.Major + "."}

#Call the Method
$Person.Greeting()

<#Locate a cmdlet to export this custom object to a file that can be used to import the object back in later.
Look into cmdlets related to JSON format or CSV format#>
ConvertTo-Json -InputObject $Person | Out-File -FilePath .\Object.json

#Optionally, can you delete the object and add it back in using your new file??
$json = Get-Content -Path .\Object.json | ConvertFrom-Json
$Person2 = New-Object System.Object
Add-Member -MemberType NoteProperty -Name Name -Value $json.Name -InputObject $Person2
Add-Member -MemberType NoteProperty -Name Age -Value $json.Age -InputObject $Person2
Add-Member -MemberType NoteProperty -Name Major -Value $json.Major -InputObject $Person2
Add-Member -MemberType NoteProperty -Name YearBorn -Value $json.YearBorn -InputObject $Person2
$Person2