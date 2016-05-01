from weppy import response

from <%= app_name %> import app, auth


@app.route("/")
def welcome():
    response.meta.title = "<%= app_title %>"
    return dict()


@app.route('/account(/<str:f>)?(/<str:k>)?')
def account(f, k):
    response.meta.title = "<%= app_title %> | Account"
    form = auth(f, k)
    return dict(req=f, form=form)
