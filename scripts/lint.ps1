<#
.SYNOPSIS
    Script to lint Python code in the 'app' directory.

.DESCRIPTION
    This script activates a virtual environment, then runs linting tools
    ruff on Python code within the 'app' directory.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\lint.ps1
    Lints Python code in the 'app' directory.

#>

.venv\Scripts\activate

ruff format
ruff check --fix --select ALL --ignore D
