"""
Usage:   weppy --app=<%= app_name %> <command>
Example: weppy --app=<%= app_name %> shell
"""
from <%= app_name %> import app


@app.cli.command('routes')
def print_routing():
    print(app.route.routes_out)


@app.cli.command('get_users')
def print_users():
    from <%= app_name %> import db
    from <%= app_name %>.models.user import User
    rows = db(User.email).select()
    for row in rows:
        print(row)
