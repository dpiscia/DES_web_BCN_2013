from pyramid.config import Configurator
from sqlalchemy import engine_from_config
import model



def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    init_db(settings)
    config = Configurator(settings=settings)
    config.add_static_view('static', '/static', cache_max_age=3600)
    
    config.add_static_view('deform_static', 'deform:static')
    config.add_route('program', '/program')
    config.add_route('home', '/')
    config.add_route('participants', '/participants')
    config.add_route('venue_accommodation', '/venue_accommodation')
    config.add_route('travel', '/travel')
    config.add_route('registration', '/registration')
    config.add_route('contact', '/contact')


    config.scan()
    return config.make_wsgi_app()
    
def init_db(settings):
    # TODO: Add logging
    # Create DB structure if needed
    print settings['sqlalchemy.url']
#    print settings[sqlalchemy.url]
    model.init(settings['sqlalchemy.url'])
