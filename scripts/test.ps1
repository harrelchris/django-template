<#
.SYNOPSIS
    Script to run tests for a Django web application.

.DESCRIPTION
    This script runs tests for a Django web application located in the 'app' directory.
    It activates the virtual environment, sets environment variables, runs collectstatic,
    and then runs the tests.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\test.ps1
    Runs tests for the Django web application.

#>

$env = Get-Content -Path .\envs\test.env

foreach ($line in $env) {
    if ($line.Trim() -eq "" -or $line.StartsWith("#")) {
        continue
    }

    $key, $value = $line -split '=', 2
    Set-Variable -Name "env:$key" -Value $value
}

.venv\Scripts\activate

python app\manage.py collectstatic --noinput
python app\manage.py test app
