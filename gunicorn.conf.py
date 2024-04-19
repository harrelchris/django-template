import multiprocessing
import gunicorn

accesslog = "-"
bind = "0.0.0.0:8000"
chdir = "app"
gunicorn.SERVER = ""
max_requests = 1200
max_requests_jitter = 50
preload_app = True
workers = 2 * multiprocessing.cpu_count() + 1
wsgi_app = "core.wsgi"
