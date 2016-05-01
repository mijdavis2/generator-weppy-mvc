from weppy import AppModule
from weppy.tools import ServiceHandler
from <%= app_name %> import app

api = AppModule(app, 'api', __name__, url_prefix='api')
api.common_handlers = [ServiceHandler('json')]


@api.route()
def version():
    json = {
        'version': 'v1'
    }
    return dict(status='OK', data=json)
