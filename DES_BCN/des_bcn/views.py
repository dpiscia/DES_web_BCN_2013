from pyramid.response import Response
from pyramid.view import view_config

from sqlalchemy.exc import DBAPIError




@view_config(route_name='home', renderer='home.mako')
def home_view(request):

    return {'info' : None}
    
@view_config(route_name='program', renderer='program.mako')
def program_view(request):

    return {'info' : None}
    
@view_config(route_name='participants', renderer='participants.mako')
def participants_view(request):

    return {'info' : None}
    
@view_config(route_name='venue_accommodation', renderer='venue_accommodation.mako')
def venue_accommodation_view(request):

    return {'info' : None}


@view_config(route_name='travel', renderer='travel.mako')
def travel_view(request):

    return {'info' : None}

@view_config(route_name='registration', renderer='registration.mako')
def registration_view(request):

    return {'registration' : None}
    
@view_config(route_name='contact', renderer='contact.mako')
def contact_view(request):

    return {'contact' : None}
