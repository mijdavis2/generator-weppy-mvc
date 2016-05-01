from weppy import response, AppModule
from weppy.handlers import RequireHandler

from <%= app_name %> import app, db, auth
from ..controller_utils import not_auth

user = AppModule(app, 'user', __name__, template_folder="user")
user.common_handlers = [RequireHandler(auth.is_logged_in, not_auth)]


@user.route("/user/<str:userid>")
def profile(userid):
    user_row = db.User(id=userid)
    response.meta.title = "<%= app_title %> | " + user_row.first_name + " " + \
                          user_row.last_name + " profile"
    return dict(user=user_row)
