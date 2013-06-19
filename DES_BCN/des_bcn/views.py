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
import widget
from sqlalchemy import  or_
import sqlalchemy

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

    participants = model.session.query(model.User).filter(or_(model.User.student == True,model.User.paid == True)).all()
    model.session.commit()

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
        bootstrap_templates = resource_filename('des_bcn','bootstrap_deform_templates')
        #search_path = ('/Users/dpiscia/python_projects/bootstrap_dir/demo_bootstrap/deform_bootstrap/deform_bootstrap/templates', deform_templates)
        search_path = (bootstrap_templates,deform_templates)
        renderer = ZPTRendererFactory(search_path)
        widget_email = deform.widget.CheckedInputWidget(
            subject='Email',
            confirm_subject='Confirm Email',
            size=40)
        arrival_choices = (("0", 'On my own'), ("1", 'BUS Morning'),
                   ("2", 'BUS Afternoon'))
        departure_choices = (("0", 'On my own'), ("1", 'BUS Afternoon'))                   
        bus_stop_morning =       (("0", 'From Airport (11:00) '), ("1", 'From City (11:30)')) 
        bus_stop_afternoon =       (("0", 'From Airport (16:30)'), ("1", 'From City (17:00)'))
        bus_stop_departure =       (("0", 'To Airport'), ("1", 'To City'))
        hotel_choices =       (("0", 'Eden Roc'), ("1", 'On my own'))
        occ_choices =       (("0", 'Single'), ("1", 'Double'))
        double_choices =       (("0", 'Accompanying person'), ("1", 'other DES participant'))
        gender_choices =       (("0", 'Male'), ("1", 'Female'))

                
        class Personal_information(colander.Schema):        
            name = colander.SchemaNode(
                colander.String(),
                description='')
            Surname = colander.SchemaNode(
                colander.String(),
                description='')   
            email = colander.SchemaNode(
                colander.String(),
                title='Email Address',
                description='',
                validator=colander.Email(),
                widget=widget_email)
            Institution = colander.SchemaNode(
                colander.String(),
                description='')    
            Student = colander.SchemaNode(
                colander.Boolean(),
                description='',
                widget=deform.widget.CheckboxWidget(),
                title='Student')   
            Vegetarian = colander.SchemaNode(
                colander.Boolean(),
                description='',
                widget=deform.widget.CheckboxWidget(),
                title='Vegetarian meals')
         
        class Arrival_information(colander.Schema):         
            Expected_Arrival_date = colander.SchemaNode(
                colander.Date(),
                 #widget = deform.widget.DatePartsWidget(),
                description='')
            Expected_arrival_time = colander.SchemaNode(
                colander.Time(),
                widget = widget.TimeInputWidget(),
                description='')     
            Arrival_BUS_option = colander.SchemaNode(
                colander.String(),
                validator=colander.OneOf([x[0] for x in arrival_choices]),
                widget=deform.widget.RadioChoiceWidget(values=arrival_choices , inline=True),
                title='Choose your option',
                description='')  
         
            BUS_option_arrival_morning = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                widget=deform.widget.RadioChoiceWidget(values=bus_stop_morning , inline=True),
                title='Choose your option',
                description=''
                ) 
            BUS_option_arrival_afternoon = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                widget=deform.widget.RadioChoiceWidget(values=bus_stop_afternoon , inline=True),
                title='Choose your option',
                description=''
                )                 
        class Hotel_information(colander.Schema):                  
  
            Occupancy = colander.SchemaNode(
                colander.String(),
                widget=deform.widget.RadioChoiceWidget(values=occ_choices , inline=True),
                title='Room type',
                description='') 
            Double_use = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                widget=deform.widget.RadioChoiceWidget(values=double_choices , inline=True),
                title='Sharing with',
                description='') 
            Gender_double_use = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                widget=deform.widget.RadioChoiceWidget(values=gender_choices , inline=True),
                title='Your gender',
                description='') 
            Proposed_name = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                title='To share with (optional)',
                description='') 
        class Departure_information(colander.Schema):                  
            Expected_departure_date = colander.SchemaNode(
                colander.Date(),
                description='')
                
            Expected_departure_time = colander.SchemaNode(
                colander.Time(),
                widget = widget.TimeInputWidget(),
                description='') 
                
            Departure_BUS_option = colander.SchemaNode(
                colander.String(),
                validator=colander.OneOf([x[0] for x in departure_choices]),
                widget=deform.widget.RadioChoiceWidget(values=departure_choices , inline=True),
                title='Choose your option',
                description='')  
         
            BUS_option_departure = colander.SchemaNode(
                colander.String(),
                missing=unicode(''),
                widget=deform.widget.RadioChoiceWidget(values=bus_stop_departure , inline=True),
                title='Choose your option',
                description=''
                ) 
        def validator_bus_arrival(form, value):
            if (value['Arrival_BUS_option'] in ['1'] and not (value['BUS_option_arrival_morning'] in [x[0] for x in bus_stop_morning] ) ):
                exc = colander.Invalid(form, 'Must select one option')
                exc['BUS_option_arrival_morning'] = 'Must select one option '
                raise exc
            if (value['Arrival_BUS_option'] in ['2'] and not value['BUS_option_arrival_afternoon'] in [x[0] for x in bus_stop_afternoon] ):
                exc = colander.Invalid(form, 'Must select one option')
                exc['BUS_option_arrival_afternoon'] = 'Must select one option '
                raise exc
        def validator_bus_departure(form, value):
            if (value['Departure_BUS_option'] in ['1'] and not ( value['BUS_option_departure'] in [x[0] for x in  bus_stop_departure] ) ):
                exc = colander.Invalid(form, 'Must select one option')
                exc['BUS_option_departure'] = 'Must select one option '
                raise exc
        def validator_hotel_stay(form, value):
   
                if (value['Occupancy'] in ['1']):
                    if not ( value['Double_use'] in [x[0] for x in double_choices]):
                        exc = colander.Invalid(form, 'Must select one option')
                        exc['Double_use'] = 'Must select one option '
                        raise exc
                    elif (value['Double_use'] in ['1']):
                        if not ( value['Gender_double_use'] in [x[0] for x in gender_choices] ):
                            exc = colander.Invalid(form, 'Must select one option')
                            exc['Gender_double_use'] = 'Must select one option '
                            raise exc                   
        
        
                #validator=colander.OneOf([x[0] for x in bus_stop]), 
        def succeed(id_reg=None):
            return Response('<div id="thanks"><h3>Thanks! You have  </h3></div>')
        class Schema(colander.Schema):
            
            personal_information = Personal_information()
            hotel_information = Hotel_information( title = "Eden Rock Hotel Information", validator=validator_hotel_stay)
            arrival_information = Arrival_information(validator=validator_bus_arrival)
            departure_information = Departure_information(validator=validator_bus_departure)

        schema = Schema()
        
        form = deform.Form(schema, buttons=('submit',) , renderer=renderer   )
        when_date_arr = datetime.date(2013, 9, 29)
        when_time_arr = datetime.time(10, 35)
        when_date_dep = datetime.date(2013, 10, 4)
        when_time_dep = datetime.time(14, 35)        
        return render_to_response('templates/prova.pt',  render_form(request, form ,
                                                                     appstruct={'arrival_information': {'Expected_Arrival_date' :when_date_arr, 'Expected_arrival_time':when_time_arr }, 
                                                                                'departure_information' : {'Expected_departure_date' :when_date_dep, 'Expected_departure_time':when_time_dep } }
                                                                                , success=succeed ) , request )
       
def render_form(request, form, appstruct=colander.null, submitted='submit',
                    success=None, readonly=False):
                      
        captured = None

        if submitted in request.POST:
            # the request represents a form submission
            try:
                # try to validate the submitted values
                
                controls = request.POST.items()
                
                captured = form.validate(controls)
                
                print captured
                if success:
                    try:
                        # call validate
                        user = model.User(name = captured['personal_information']['name'],
                                          surname = captured['personal_information']['Surname'],
                                          email = captured['personal_information']['email'],
                                          institution = captured['personal_information']['Institution'], 
                                          arrival_datetime = datetime.datetime.combine(captured['arrival_information']['Expected_Arrival_date'],
                                                                    captured['arrival_information']['Expected_arrival_time']),
                                          arrival_busoption = captured['arrival_information']['Arrival_BUS_option'],
                                          arrival_bus_morning =  captured['arrival_information']['BUS_option_arrival_morning'], 
                                          departure_datetime = datetime.datetime.combine(captured['departure_information']['Expected_departure_date'],
                                                                    captured['departure_information']['Expected_departure_time']),
                                          departure_busoption = captured['departure_information']['Departure_BUS_option'],
                                          departure_bus = captured['departure_information']['BUS_option_departure'],  
                                          vegeterian = captured['personal_information']['Vegetarian'],
                                          student = captured['personal_information']['Student'],
                                          hotel = 1, 
                                          Occupancy = captured['hotel_information']['Occupancy'],
                                          Double_use = captured['hotel_information']['Double_use'],
                                          Gender_double_use = captured['hotel_information']['Gender_double_use'],
                                          Proposed_name = captured['hotel_information']['Proposed_name'])                      
                        model.session.add(user)
                        model.session.commit()
                        id_reg = user.id
                    except sqlalchemy.exc.IntegrityError, exc:
                        reason = exc.message
                        if reason.endswith('is not unique'):
                            
                            err_msg = "%s already exists" % exc.params[0]
                            model.session.rollback()
                            return {'form' : err_msg}
                          
                            
                    except sqlalchemy.exc.SQLAlchemyError:
                            err_msg = "DB connection problems, plase try again or contact with administrator"
                            model.session.rollback()
                            return {'form' : err_msg}
                          
                    response = success()
                    if response is not None:
                        import mailer
         
                        mailer.send_email("smtp.gmail.com",587,"DESBarcelona2013@gmail.com","20DESBCN13",captured['personal_information']['email'], form , "DES-BCN ID registration "+str(id_reg))
                        
                        if captured['personal_information']['Student'] == True:
                            msg = '<h3> Thanks! your registration number is '+str(id_reg)+'  <br>  As you registered as student you do not have to pay the registration fee </h3>'
                        else :
                            msg = '<h3> Thanks! your registration number is '+str(id_reg)+' <br> Please take note of this registration ID because it is required for the payment process</h3> <br> <a href= "https://tp.ifae.es/cgi-bin/des.cgi" button class="btn-large btn-primary"> Proceed to payment</a>'
                        return {'form' : msg }
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
