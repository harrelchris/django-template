<#
.SYNOPSIS
    Script to lint Python code in the 'app' directory.

.DESCRIPTION
    This script activates a virtual environment, then runs linting tools
    (Black and Flake8) on Python code within the 'app' directory.
    Black is used for code formatting, and Flake8 is used for static analysis.
    It excludes the 'migrations' directory from linting.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\lint.ps1
    Lints Python code in the 'app' directory.

#>

.venv\Scripts\activate

python -m black app --line-length 120 `
--exclude migrations/

python -m flake8 app --max-line-length 120 `
--max-complexity 10 `
--extend-exclude migrations
