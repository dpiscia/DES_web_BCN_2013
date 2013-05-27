# -*- coding: utf-8 -*-

from pyramid.response import Response
from pyramid.view import view_config
import model
import colander
import deform
from colanderalchemy import SQLAlchemySchemaNode
from deform import Form, ValidationFailure
from pyramid.renderers import render_to_response
from pyramid.renderers import get_renderer
from deform import ZPTRendererFactory
from pkg_resources import resource_filename
from colander import Range
import datetime

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

@view_config(route_name='prova', renderer='prova.mako')
def prova_view(request):
        
        deform_templates = resource_filename('deform', 'templates')
#TODO search_path independent way of setting        
        search_path = ('/Users/dpiscia/python_projects/bootstrap_dir/demo_bootstrap/deform_bootstrap/deform_bootstrap/templates', deform_templates)

        renderer = ZPTRendererFactory(search_path)
        widget_email = deform.widget.CheckedInputWidget(
            subject='Email',
            confirm_subject='Confirm Email',
            size=40)
        arrival_choices = ((0, 'On my own'), (1, 'BUS 1'),
                   (2, 'BUS 2'))
        bus_stop =       ((0, 'From Airport'), (1, 'From City'))     
        class Mapping(colander.Schema):
            name = colander.SchemaNode(
                colander.String(),
                description='Content Name')
            Surname = colander.SchemaNode(
                colander.String(),
                description='Content Surname')   
            email = colander.SchemaNode(
                colander.String(),
                title='Email Address',
                description='Type your email address and confirm it',
                validator=colander.Email(),
                widget=widget_email)
            Institution = colander.SchemaNode(
                colander.String(),
                description='Content Insitution name')                
                
            Expected_Arrival_date = colander.SchemaNode(
                colander.DateTime(),
                
                description='Content date')
            Expected_arrival_time = colander.SchemaNode(
                colander.Time(),
                description='Content arrival time')     
            Arrival_BUS_option = colander.SchemaNode(
                colander.String(),
                validator=colander.OneOf([x[0] for x in arrival_choices]),
                widget=deform.widget.RadioChoiceWidget(values=arrival_choices , inline=True),
                title='Choose your option',
                description='')  
            BUS_option_1_1 = colander.SchemaNode(
                colander.Boolean(),
                widget = deform.widget.HiddenWidget(),
                default=True,
                )
            BUS_option_1_1 = colander.SchemaNode(
                colander.String(),
                validator=colander.OneOf([x[0] for x in bus_stop]),
                widget=deform.widget.RadioChoiceWidget(values=bus_stop , inline=True),
                title='Choose your option',
                description='') 
            Vegetarian = colander.SchemaNode(
                colander.Boolean(),
                description='',
                widget=deform.widget.CheckboxWidget(),
                title='Vegetarian meals')
            Student = colander.SchemaNode(
                colander.Boolean(),
                description='',
                widget=deform.widget.CheckboxWidget(),
                title='Are you a Student')
                               
        class Schema(colander.Schema):
            number = colander.SchemaNode(
                colander.Integer())
            mapping = Mapping()

        schema = Schema()
        
        form = deform.Form(schema, buttons=('submit',) , renderer=renderer )
        when = datetime.time(14, 35)
        return render_to_response('templates/prova.pt',  render_form(request, form ,appstruct={'date':when} ) , request )
       
def render_form(request, form, appstruct=colander.null, submitted='submit',
                    success=None, readonly=False):

        captured = None

        if submitted in request.POST:
            # the request represents a form submission
            try:
                # try to validate the submitted values
                controls = request.POST.items()
                captured = form.validate(controls)
                if success:
                    response = success()
                    if response is not None:
                        return response
                html = form.render(captured)
            except deform.ValidationFailure as e:
                # the submitted values could not be validated
                html = e.render()

        else:
            # the request requires a simple form rendering
            html = form.render(appstruct, readonly=readonly)

        if request.is_xhr:
            return Response(html)


        reqts = form.get_widget_resources()

        # values passed to template for rendering
        return {
            'form':html,
            'captured':repr(captured),
            'demos':[],
            'showmenu':False,
            'title': "prova",
            'css_links':reqts['css'],
            'js_links':reqts['js'],
            }
