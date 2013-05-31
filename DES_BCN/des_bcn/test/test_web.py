
from des_bcn import main
from webtest import TestApp
import unittest


class FunctionalTests(unittest.TestCase):
    
    settings = { 'sqlalchemy.url': 'sqlite:////Users/dpiscia/.sqlite/DES_BCN.db',
                'mako.directories' : 'des_bcn:templates'}
    app = main({}, **settings)
    testapp = TestApp(app)
    def test_page_exist(self):
        res = self.testapp.get('/prova', status=200)
        self.assertEqual(res.status,'200 OK')
        res = self.testapp.get('/', status=200)
        self.assertEqual(res.status,'200 OK')
    def test_form(self):
        res = self.testapp.get('/prova')
        form = res.form
        print(form.id)
        print(form.action)
        print(form.method)
        form['Institution']="ice"
        res = form.submit()
        print(res)

        #self.assertEqual(res.location, 'prova')