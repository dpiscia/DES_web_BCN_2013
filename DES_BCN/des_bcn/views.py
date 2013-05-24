# -*- coding: utf-8 -*-

from pyramid.response import Response
from pyramid.view import view_config
import model
import colander
import deform
from colanderalchemy import SQLAlchemySchemaNode
from deform import Form, ValidationFailure






@view_config(route_name='home', renderer='home.mako')
def home_view(request):

    return {'info' : None ,
            'tab' : 'home'}
    
@view_config(route_name='program', renderer='program.mako')
def program_view(request):

    return {'info' : None,
            'tab' : 'program'}
    
@view_config(route_name='participants', renderer='participants.mako')
def participants_view(request):

#    participants = model.session.query(model.User).all()
#    model.session.commit()
    participants = []
    return {'participants':participants ,
            'tab' : 'participants'}
    
@view_config(route_name='venue_accommodation', renderer='venue_accommodation.mako')
def venue_accommodation_view(request):

    return {'info' : None,
            'tab' : 'venue_accommodation'}


@view_config(route_name='travel', renderer='travel.mako')
def travel_view(request):

    return {'info' : None,
            'tab' : 'travel'}

#renderer='templates/form.pt'
#        form = deform.Form(schema, buttons=('submit',), use_ajax=True)
#        return self.render_form(form, success=succeed)


@view_config(route_name='registration', renderer='registration.mako')
def registration_view(request):
    
#       schema = SQLAlchemySchemaNode(model.User) 
#       form = Form(schema, buttons=('submit',) , use_ajax=True  )
#       
#       
#       if 'submit' in request.POST: # detect that the submit button was clicked
#            
#            controls = request.POST.items() # get the form controls
#            
#            try:
#                appstruct = form.validate(controls)  # call validate
#                user = model.User(email = appstruct['email'], name = appstruct['name'], surname = appstruct['surname'])
#                model.session.add(user)
#                model.session.commit()
#            except ValidationFailure, e: # catch the exception:
##TODO update db with registry            
#                return {'form':e.render()  ,'values': False} # re-render the form with an exception
#            except Exception as e:
#                
#                return {'form': 'DB error' ,'values': False}
#    # the form submission succeeded, we have the data
#            return {'form':form.render() , "values": appstruct }
#       return {'form':form.render() , "values": None , 'tab' : 'registration'}
      return {'info' : None,
            'tab' : 'registration'}
       
 
    
@view_config(route_name='contact', renderer='contact.mako')
def contact_view(request):

    return {'contact' : None, 'tab' : 'contact'}


