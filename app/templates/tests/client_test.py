from <%= app_name %> import User, db
from <%= app_name %> import utils
from .fixtures import client, admin_client, logged_client, TEST_USER


def test_welcome_page_access(client):
    resp = client.get('/')
    assert 'Welcome to <%= app_title %>' in resp.data


def test_error_404(client):
    resp = client.get(utils.get_cryptogen_string())
    assert "<title><%= app_title %>-404</title>" in resp.data


def test_account_page_access(client):
    resp = client.get('/account/login')
    assert "<%= app_title %> | Account" in resp.data


def test_users_page_access(client):
    resp = client.get('/users/')
    assert "<%= app_title %>-403" in resp.data


def test_admin_users_page_access(admin_client):
    resp = admin_client.get('/users/')
    assert "<%= app_title %> | Users" in resp.data


def test_login_page(logged_client):
    resp = logged_client.get('/account/profile')
    assert 'Profile' in resp.data


def test_profile_page(logged_client):
    db._adapter.reconnect()
    rows = db(User.email == TEST_USER.email).select()
    test_user_id = rows[0].id
    resp = logged_client.get('/user/{}'.format(test_user_id))
    assert TEST_USER.first_name in resp.data
    assert TEST_USER.last_name in resp.data


def test_maintenance_page(client):
    resp = client.get("/maintenance_check")
    assert "<%= app_title %> | Maintenance" in resp.data
