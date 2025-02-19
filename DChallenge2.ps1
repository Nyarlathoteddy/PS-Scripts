#Locate a cmdlet to view the current date
Get-Date

#Use a statement to evaluate the date on the following criteria:
#date is Saturday – output ‘It’s the weekend baby!’
#date is Monday – output ‘The week’s just starting!’
#date is Tuesday – output ‘Getting closer to the weekend!’
#date is none of those days – output ‘It’s not Saturday, Monday, or Tuesday!’
switch (Get-Date -Format "dddd") {
    "Saturday" {"It's the weekend baby!"}
    "Monday" {"The week's just starting!"}
    "Tuesday" {"Getting close to the weekend!"}
    Default {"It's not Saturday, Monday, or Tuesday!"}
}

#Locate the cmdlet/a method to change the date to Saturday. Rerun the script and view results
#Note this can be done several ways, does not need to take place inside the script
$CurrentDate = Get-Date # Get the current date before I change to a different one.
$Saturday = Get-Date -Day 6 -Month 1 -Year 2024
Set-Date -Date $Saturday # This sets the date to the 6th of January 2024, which is a Saturday.
switch (Get-Date -Format "dddd") {
    "Saturday" {"It's the weekend baby!"}
    "Monday" {"The week's just starting!"}
    "Tuesday" {"Getting close to the weekend!"}
    Default {"It's not Saturday, Monday, or Tuesday!"}
}

#Change the date back to correct date
Set-Date -Date $CurrentDate
switch (Get-Date -Format "dddd") {
    "Saturday" {"It's the weekend baby!"}
    "Monday" {"The week's just starting!"}
    "Tuesday" {"Getting close to the weekend!"}
    Default {"It's not Saturday, Monday, or Tuesday!"}
}
#Submit the script and let me know what method you used to change the date and change it back.

#I used a combination of Set-Date to actually change the date and the Get-Date command with some parameters to set my date.
#Could make a loop to change the date to whatever the user wants, but it is beyond the scope of this assignment.