from weppy import App
from weppy.orm import Database
from weppy.sessions import SessionCookieManager
from weppy.tools import Auth

app = App(__name__, template_folder="./views")

# Config
app.config.url_default_namespace = "main"
app.config.templates_auto_reload = True

# Language settings
app.languages = ['en']
app.language_default = 'en'
app.language_force_on_url = True
app.language_write = True

# init database and auth
from <%= appName %>.models.user import User

# init auth before passing db models due to dependencies
# on auth tables in the other models
db = Database(app)
auth = Auth(
        app, db, user_model=User
)

# adding sessions and authorization pipelines
from late_gen.utils import get_cryptogen_string
app.pipeline = [
    SessionCookieManager(get_cryptogen_string(16)), db.pipe, auth.pipe
]

# Extensions
from weppy_haml import Haml
app.config.Haml.set_as_default = True
app.config.Haml.auto_reload = True
app.use_extension(Haml)

# Expose controllers
from <%= appName %>.controllers import *

# Commands
from <%= appName %> import cli

auth_routes = auth.module(__name__)
