from django.conf import settings
from django.contrib import admin
from django.urls import include, path
from django.views.generic import TemplateView
from django.views import defaults

urlpatterns = [
    path("", TemplateView.as_view(template_name="index.html"), name="index"),
    path("admin/", admin.site.urls),
]

if settings.DEBUG:
    urlpatterns.extend(
        [
            path("__debug__/", include("debug_toolbar.urls")),
            path("400/", defaults.bad_request, kwargs={"exception": Exception("Bad Request")}),
            path("403/", defaults.permission_denied, kwargs={"exception": Exception("Permission Denied")}),
            path("404/", defaults.page_not_found, kwargs={"exception": Exception("Not Found")}),
            path("500/", defaults.server_error),
        ]
    )
