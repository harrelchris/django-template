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
1. [Compose](#docker-compose)

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

Collect Static

```shell
docker exec -it app python app/manage.py collectstatic --noinput
```

Create Super User

```shell
docker exec -it app python app/manage.py createsuperuser --username user --email user@email.com
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

---

## Docker Compose

### Build

```shell
docker compose build
```

### Run

```shell
docker compose up -d
```

### Exec

Migrate

```shell
docker compose exec web python app/manage.py migrate
```

Collect Static

```shell
docker compose exec web python app/manage.py collectstatic --no-input
```

Create Super User

```shell
docker compose exec web python app/manage.py createsuperuser --username user --email user@email.com --noinput
```

### Stop

```shell
docker compose down
```

### Remove

Web

```shell
docker rmi "web"
```

NGINX

```shell
docker rmi "nginx"
```

Postgres

```shell
docker rmi "postgres"
```

Volumes

```shell
docker volume rm django-template_static
```

```shell
docker volume rm django-template_db
```

## Shell

```shell
docker compose exec web bash
```
