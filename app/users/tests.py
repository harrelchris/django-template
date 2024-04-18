from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse

User = get_user_model()


class UserModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username="testuser", password="12345")

    def test_user_creation(self):
        self.assertEqual(User.objects.count(), 1)


class LoginViewTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(
            username="testuser",
            password="12345",
        )

    def test_login_view(self):
        response = self.client.post(reverse("account_login"), {"username": "testuser", "password": "12345"})
        self.assertEqual(response.status_code, 200)


class LogoutViewTest(TestCase):
    def setUp(self):
        self.user = User.objects.create_user(username="testuser", password="12345")
        self.client.login(username="testuser", password="12345")

    def test_logout_view(self):
        response = self.client.post(reverse("account_logout"))
        self.assertEqual(response.status_code, 302)
