#Gage Rotz, Section 1, 2/29/2024.

# Variable that controls if the while loop will keep running.
$running = $true

# Put all prompts outside of while loop, otherwise they would constantly redeclare themselves, which is unnecessary.
$startPrompt = "Local User Management (Use number to select): 
    1. Create Local User
    2. Rename Local User
    3. Delete Local User
    4. Exit
    Enter your choice"
$newNamePrompt = "Enter new username"
$fullNamePrompt = "Enter full name"
$DescriptionPrompt = "Enter description for new user"
$passwordPrompt = "Enter password for new user"
$renamePrompt = "Enter username for user that will be renamed"
$deletePrompt = "Enter username for user that will be deleted"
#Using a while loop because loop needs to run as long as user wants it to, so while loop is easiest and most viable loop to use.
while ($running) {
    $answer = Read-Host -Prompt $startPrompt
    # Using switch because there are simple answers and logic is not complicated.
    switch ($answer) {
        1{
            try {
                # Put prompt into Read-Host because that allows the input to be on the same line as the prompt, making things look nicer.
                $newUserName = Read-Host -Prompt $newNamePrompt
                $fullName = Read-Host -Prompt $fullNamePrompt
                $Description = Read-Host -Prompt $DescriptionPrompt
                # Need -asSecureString otherwise creating password will not work.
                $password = Read-Host -AsSecureString -Prompt $passwordPrompt
                $NewUserTable = @{
                    Name = $newUserName;
                    FullName = $fullName;
                    Description = $Description;
                    Password = $password
                }
                # Learned from Microsoft article on New-LocalUser that Hash table can just be inputted like this.
                # Using Out-Null because I have Get-LocalUser already there and the output from New-LocalUser requires an enter prompt sometimes to progress.
                New-LocalUser @NewUserTable -ErrorAction Stop | Out-Null
                # Blank spaces are newlines to make output look nice.
                ""
                "User " + $NewUserTable.Name + " successfully created."
                # Faced weird issue where Get-LocalUser alone would sometimes stop output until I pressed enter, putting Format-Table in stopped this.
                Get-LocalUser | Format-Table -Property Name, FullName, Description, Enabled
                ""
            }
            catch {
                Write-Output "Error creating new user. Please ensure that the user does not already exist or that the password fits the Windows password requirements."
            }
            # Breaks out of switch.
            break;
        }
        2{
            try {
                # Simple prompt and Read-Host and passing variables into Rename-LocalUser, keeping this part simple.
                $oldName = Read-Host -Prompt $renamePrompt
                $newName = Read-Host -Prompt $newNamePrompt
                Rename-LocalUser -ErrorAction Stop -Name $oldName -NewName $newName
                # Blank spaces are newlines to make output look nice.
                ""
                "User " + $oldName + " successfully renamed to " + $newName + "."
                # Faced weird issue where Get-LocalUser alone would sometimes stop output until I pressed enter, putting Format-Table in stopped this.
                Get-LocalUser | Format-Table -Property Name, FullName, Description, Enabled
                ""
            }
            catch {
                Write-Output "Error renaming user. Ensure that the user you are attempting to rename exists and that the new username does not conflict with a current username."
            }
            # Breaks out of switch.
            break;
        }
        3{
            try {
                # Only requires the username, so this part just requires one prompt and response.
                $deleteUser = Read-Host -Prompt $deletePrompt
                Remove-LocalUser -ErrorAction Stop -Name $deleteUser
                # Blank spaces are newlines to make output look nice.
                ""
                "User " + $deleteUser + " successfully deleted."
                # Faced weird issue where Get-LocalUser alone would sometimes stop output until I pressed enter, putting Format-Table in stopped this.
                Get-LocalUser | Format-Table -Property Name, FullName, Description, Enabled
                ""
            }
            catch {
                "Failed to delete user. Please check that the user exists or that the script is run as Administrator."
            }
            # Breaks out of switch.
            break;
        }
        4{
            # End while loop by turning running variable to false, therefore meaning the while loop hits false.
            "Ending Local User Management!"
            $running = $false;
            break;
        }
        Default {
            # Simple error message if input does not match any other switch cases.
            "Please input a number based on what you want to do."
        }
    }
}