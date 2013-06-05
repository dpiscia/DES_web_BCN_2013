from deform.widget import Widget
import csv
import json
import random

from colander import (
    Invalid,
    null,
    )






class TimeInputWidget(Widget):
    """
    Renders a a jQuery UI date picker with a JQuery Timepicker add-on
    (http://trentrichardson.com/examples/timepicker/).  Used for
    ``colander.DateTime`` schema nodes.

    **Attributes/Arguments**

    options
        A dictionary of options that's passed to the datetimepicker.

    size
        The size, in columns, of the text input field.  Defaults to
        ``None``, meaning that the ``size`` is not included in the
        widget output (uses browser default size).

    style
        A string that will be placed literally in a ``style`` attribute on
        the text input tag.  For example, 'width:150px;'.  Default: ``None``,
        meaning no style attribute will be added to the input tag.
        
    template
        The template name used to render the widget.  Default:
        ``dateinput``.

    readonly_template
        The template name used to render the widget in read-only mode.
        Default: ``readonly/textinput``.
    """
    template = 'timeinput'
    readonly_template = 'readonly/textinput'
    size = None
    style = None
    requirements = (())
    default_resources = ( ('jqueryui', None), ('timepicker', None), )
    default_options = (
                       ('timeFormat', 'hh:mm   '),
                        ('separator', ':'), ('showMeridian', 'false') )
    
    def __init__(self, *args, **kwargs):
        self.options = dict(self.default_options)
        Widget.__init__(self, *args, **kwargs)
    def serialize(self, field, cstruct, **kw):
        if cstruct in (null, None):
            cstruct = ''
        readonly = kw.get('readonly', self.readonly)
        if len(cstruct) == 25: # strip timezone if it's there
            cstruct = cstruct[:-6]
        options = kw.get('options', self.options)
        kw['options'] = json.dumps(options)
        separator = options.get('separator', ' ')
        
        
        
        cstruct = separator.join(cstruct.split('T'))
        
        values = self.get_template_values(field, cstruct, kw)
        
        template = readonly and self.readonly_template or self.template
        return field.renderer(template, **values)

    def deserialize(self, field, pstruct):

        import datetime
        

        if pstruct in ('', null):
            return null
        tempo = datetime.datetime.strptime(pstruct,"%H:%M")
        pstruct = str(tempo.hour)+":"+str(tempo.minute)
        return pstruct
        #return pstruct.replace(self.options['separator'], 'T')
default_resources = {    'timepicker': {
        None:{
            'js':('scripts/jquery-1.7.2.min.js',
                  ),
            'css':'css/bootstrap-timepicker.min.css',
            },
        },
                     }