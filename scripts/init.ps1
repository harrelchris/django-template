<#
.SYNOPSIS
    Script to set up the Python environment and initialize the Django application.

.DESCRIPTION
    This script sets up the Python virtual environment, upgrades pip, setuptools, and wheel,
    installs or upgrades the required Python packages (black and flake8), creates a .env file
    if it doesn't exist, removes the SQLite database file if it exists, and performs Django
    database migrations. It also creates a superuser for the Django application.

.PARAMETER None
    This script does not accept any parameters.

.EXAMPLE
    .\init.ps1
    Sets up the Python environment and initializes the Django application.

#>

if (-not (Test-Path .venv)) {
    python -m venv .venv
}

.venv\Scripts\activate

python -m pip install pip setuptools wheel --upgrade

pip install ruff -r requirements.txt --upgrade

if (-not (Test-Path .env)) {
    Copy-Item .\.envs\dev.env .env
}

if (Test-Path db.sqlite3) {
    Remove-Item db.sqlite3
}

python app\manage.py makemigrations
python app\manage.py migrate
python app\manage.py createsuperuser --username user --email user@email.com --noinput
