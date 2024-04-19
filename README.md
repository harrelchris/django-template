# Django Template

Django web application template

### Requirements

1. Python
1. Docker Desktop

### Setup

Clone the repo and run initialization script

```shell
.\scripts\init.ps1
```

# Content

1. [Scripts](#scripts)
1. [Docker](#docker)

## Scripts

Scripts and commands for common development tasks

### Alias

Set persistent aliases for scripts

```shell
.\scripts\alias.ps1
```

### Init

Initialize development environment

```shell
init
```

### Lint

Reformat code using Black and lint with Flake8

```shell
lint
```

### Test

Run included test suite

```shell
test
```

### Run

Start development server

```shell
run
```

To listen on all network devices

```shell
run -lan
```

---

## Docker

### Build

```shell
docker build -t app .
```

### Run

```shell
docker run -d -p 8000:8000 --name app --env-file ./.env app
```

### Exec

Migrate

```shell
docker exec -it app python app/manage.py migrate
```

Create Super User

```shell
docker exec -it app python app/manage.py createsuperuser --username user --email user@email.com --noinput
```

Collect Static

```shell
docker exec -it app python app/manage.py collectstatic --noinput
```

### Stop

```shell
docker stop app
```

### Remove

Container

```shell
docker rm app
```

Image

```shell
docker rmi app
```
