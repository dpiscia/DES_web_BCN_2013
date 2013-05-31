# import unittest
# import transaction
# from pyramid import testing
# from des_bcn import model
# 
# captured =  {'hotel_information': {'Double_use': u'', 'Vegetarian': False, 'Hotel': u'1', 'Occupancy': u'', 'Student': False, 'Gender_double_use': u''}, 
#                         'personal_information': {'Institution': u'ice', 'Surname': u'piscia', 'name': u'davide', 'email': u'davidepiprova79@gmail.com'}, 
#                         'departure_information': {'Expected_departure_date': datetime.date(2013, 10, 4), 'Expected_departure_time': datetime.time(14, 35), 'Departure_BUS_option': u'0', 'BUS_option_departure': u''}, 
#                         'arrival_information': {'BUS_option_arrival_afternoon': u'', 'BUS_option_arrival_morning': u'', 'Expected_Arrival_date': datetime.date(2013, 9, 29), 'Arrival_BUS_option': u'0', 'Expected_arrival_time': datetime.time(14, 35)}}
# def _initTestingDB():
#     model.init('sqlite:////Users/dpiscia/.sqlite/DES_BCN.db')
#     with transaction.manager:
#         user = model.User(name = captured['personal_information']['name'],
#                                           surname = captured['personal_information']['Surname'],
#                                           email = captured['personal_information']['email'],
#                                           institution = captured['personal_information']['Institution'], 
#                                           arrival_datetime = datetime.datetime.combine(captured['arrival_information']['Expected_Arrival_date'],
#                                                                     captured['arrival_information']['Expected_arrival_time']),
#                                           arrival_busoption = captured['arrival_information']['Arrival_BUS_option'],
#                                           arrival_bus_morning =  captured['arrival_information']['BUS_option_arrival_morning'], 
#                                           departure_datetime = datetime.datetime.combine(captured['departure_information']['Expected_departure_date'],
#                                                                     captured['departure_information']['Expected_departure_time']),
#                                           departure_busoption = captured['departure_information']['Departure_BUS_option'],
#                                           departure_bus = captured['departure_information']['BUS_option_departure'],  
#                                           vegeterian = captured['hotel_information']['Vegetarian'],
#                                           student = captured['hotel_information']['Student'],
#                                           hotel = captured['hotel_information']['Hotel'], 
#                                           Occupancy = captured['hotel_information']['Occupancy'],
#                                           Double_use = captured['hotel_information']['Double_use'],
#                                           Gender_double_use = captured['hotel_information']['Gender_double_use'])   
#         DBSession.add(model)
#     return DBSession
# 
# def _registerRoutes(config):
#     config.add_route('prova', '/prova')
#     
# class Registration(unittest.TestCase):
#     def setUp(self):
#         self.session = _initTestingDB()
#         
#     def tearDown(self):
#         self.session.remove()
#         