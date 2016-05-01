from weppy import response, AppModule
from weppy.handlers import RequireHandler

from <%= app_name %> import app, db
from ..controller_utils import is_admin, not_auth

admin = AppModule(app, 'admin', __name__, template_folder="admin")
admin.common_handlers = [RequireHandler(is_admin, not_auth)]


@admin.route()
def users():
    response.meta.title = "<%= app_title %> | Users"
    users_rows = db(db.User.id > 0).select()
    return dict(users=users_rows)
