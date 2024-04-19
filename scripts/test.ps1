<#
.SYNOPSIS
    Script to run tests for a Django web application.

.DESCRIPTION
    This script runs tests for a Django web application located in the 'app' directory.
    It activates the virtual environment and runs the tests.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\test.ps1
    Runs tests for the Django web application.

#>

.venv\Scripts\activate

python app\manage.py test app
