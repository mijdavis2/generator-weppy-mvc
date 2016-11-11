"""
Usage:   weppy --app=<%= appName %> <command>
Example: weppy --app=<%= appName %> shell
"""
from <%= appName %> import app


@app.cli.command('routes')
def print_routing():
    print(app.route.routes_out)


@app.cli.command('get_users')
def print_users():
    from <%= appName %> import db
    from <%= appName %>.models.user import User
    rows = db(User.email).select()
    for row in rows:
        print(row)
