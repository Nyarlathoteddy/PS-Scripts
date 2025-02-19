#Gage Rotz, Section 1, 2/1/2024.

# Using Write-Host in script to be more verbose.
try {
    # Create a variable for a prompt and then calls variable.
    $pprompt = "What service do you want to change the state of?: "
    $pprompt
    # Use Read-Host because it is the simplest way to gather input from a user.
    $panswer = Read-Host
    # Use Get-Service because it is the only Powershell command that gathers service information.
    # Use the -ErrorAction Stop parameter because it allows the catch statement to successfully execute. Done because it is the proper way of error handling instead of using other decision structures.
    Get-Service -ErrorAction Stop $panswer
}
catch {
    Write-Host "This is not the name of a valid service."
    # Need to break here, otherwise the script would continue after the catch statement.
    break
}

$changestate = "Would you like to change the service's state? yes/no: "
$changestate
$changeAnswer = Read-Host
# Using switch statement, as it requires basic comparisons. Would use if/elseif/else if comparisons had to be more specific or complex.
switch ($changeAnswer) {
    "yes" {

        # Switch statement used because the Status is a simple comparison, reasoning outlined in previous comment.
        switch ((Get-Service $panswer).Status) {
            'Running' {
                $stopPrompt = "Service is currently running. Would you like to stop it? yes/no: "
                $stopPrompt
                $stopAnswer = Read-Host

                # Same reasoning for the first switch statement, simple yes/no question that does not require complex comparison.
                switch ($stopAnswer) {

                    "yes" {

                        Write-Host "Stopping service."
                        #Use try/catch here just in case the switch statement doesn't catch that the service is actually stopped or that the script is not run as admin.
                        try {
                            # Using Set-Service because Stop-Service gave an odd erro about not being able to find the service on the computer.
                            Get-Service $panswer | Set-Service -Status Stopped
                        }
                        catch {
                            # Added administrator line to the end of this statement because stopping a service typically requires admin access.
                            Write-Host "This service is already stopped or you are not running the script as an administrator."
                        }

                        # Provides user with information that service has changed, then ends script.
                        Get-Service $panswer
                        break
                    }

                    "no" {
                        # User did not want to stop the service, so ending script.
                        Write-Host "Stopping script."
                        break
                    }

                    Default { Write-Host "Please rerun the script and answer yes or no on this step." }
                }

            }

            'Stopped' {

                $runPrompt = "Service is currently stopped. Would you like to start it? yes/no: "
                $runPrompt
                $runAnswer = Read-Host
                # Same reasoning for the first switch statement, simple yes/no question that does not require complex comparison.
                switch ($runAnswer) {

                    "yes" {
                        #Use try/catch here just in case the switch statement doesn't catch that the service is actually running or that the script is not run as admin.
                        try {
                            # Changed to Set-Service so that both the Stop and Run commands are the same.
                            Get-Service $panswer | Set-Service -Status Running -ErrorAction Stop
                        }
                        catch {
                            # Added administrator line in case the service requires admin access and script was not run as admin.
                            Write-Host "This service is already started or you are not running the script as an administrator."
                        }
                        # Provides user with information that service has changed, then ends script.
                        Get-Service $panswer
                        break
                    }

                    "no" {
                        # User did not want to start the service, so ending script.
                        Write-Host "Stopping script."
                        break
                    }

                    Default { Write-Host "Please rerun the script and answer yes or no on this step." }
                }
            }

            Default { Write-Host "Service is not running or stopped." }
        }

    }

    "no" {
        Write-Host "Stopping script."
        break
    }

    Default { Write-Host "Please rerun the script and answer yes or no on this step." }
}