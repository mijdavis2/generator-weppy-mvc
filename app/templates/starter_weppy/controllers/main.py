from weppy import response

from <%= appName %> import app, auth


@app.route("/")
def welcome():
    response.meta.title = "<%= appTitle %>"
    return dict()


@app.route('/account(/<str:f>)?(/<str:k>)?')
def account(f, k):
    response.meta.title = "<%= appTitle %> | Account"
    form = auth(f, k)
    return dict(req=f, form=form)
