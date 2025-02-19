#Create a function called Get-Day that takes the age in years and returns the age in days (doesn’t need to factor in leap years).
function Get-Day {
    param (
        [int]$age
    )
    $days = $age * 365
    return "You said you were " + $age +  " years old, which equals " + $days + " days old."
}
$prompt = "How old are you in years?"
$prompt
$age = Read-Host
Get-Day($age)

#Create a function in PowerShell called Invert-Color that takes 3 arguments (The R, G, B values which range from 0 – 255).
#When you put () around your arguments that changes the datatype. If you get stuck trying to accomplish this, you can try without the () in the argument list.
#Invert-Color (255,255,255)
# (255,255,255) is the color white.
# The opposite is (0, 0, 0), which is black.
function Invert-Color {
    param (
        [int]$red,
        [int]$green,
        [int]$blue
    )
    $red = 255 - $red
    $green = 255 - $green
    $blue = 255 - $blue
    Write-Host $red", "$green", "$blue
}
$black = Invert-Color 255 255 255
$black
$white = Invert-Color 0 0 0
$white
$randomColor = Invert-Color 150 25 50
$randomColor

#Create a custom file sort called File_Details that shows the Name, Length, CreationTime, and LastWriteTime of all files inside the C:\Windows directory.
function File-Details {
    Get-ChildItem C:\Windows | Format-Table -Property Name, Length, CreationTime, LastWriteTime
}
File-Details

