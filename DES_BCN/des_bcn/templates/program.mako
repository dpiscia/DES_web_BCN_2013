<%inherit file="base.mako"/>
<%block name="main_container">
  <link rel='stylesheet' type='text/css' href='static/jquery-ui-1.8.11.custom.css' />
  <link rel='stylesheet' type='text/css' href='static/jquery.weekcalendar.css' />
  <style type='text/css'>
  div.body {
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    margin: 0;
	color:#FFF;

  }

  h1 {
    margin: 0 0 1em;
    padding: 0.5em;
  }

  p.description {
    font-size: 0.8em;
    padding: 1em;
    position: absolute;
    top: 3.2em;
    margin-right: 400px;
  }

  #message {
    font-size: 0.7em;
    position: absolute;
    top: 1em;
    right: 1em;
    width: 350px;
    display: none;
    padding: 1em;
    background: #ffc;
    border: 1px solid #dda;
	color:#222;
  }
  
  </style>

  <script type='text/javascript' src='static/jquery-1.4.4.min.js'></script>
  <script type='text/javascript' src='static/jquery-ui-1.8.11.custom.min.js'></script>

  <script type="text/javascript" src="static/date.js"></script>
  <script type='text/javascript' src='static/jquery.weekcalendar.js'></script>
  <script type='text/javascript'>


  var eventData = {
    events : [
      {'id':1,  'start': new Date(2013, 8, 29, 11, 00), 'end': new Date(2013, 8, 29, 11, 30),'title':'Bus from Airport T1 to BCN', 'classname': "Transp"},
      {'id':1,  'start': new Date(2013, 8, 29, 11, 30), 'end': new Date(2013, 8, 29, 13, 00),'title':'Bus from BCN to Eden Roc', 'classname': "Transp"},
      {'id':1,  'start': new Date(2013, 8, 29, 16, 30), 'end': new Date(2013, 8, 29, 16, 30),'title':'Bus from Airport T1 to BCN', 'classname': "Transp"},
      {'id':1,  'start': new Date(2013, 8, 29, 17, 00), 'end': new Date(2013, 8, 29, 18, 30),'title':'Bus from BCN to Eden Roc', 'classname': "Transp"},
      {'id':1,  'start': new Date(2013, 8, 29, 19, 00), 'end': new Date(2013, 8, 29, 21, 00),'title':'Reception at Eden Roc*', 'classname': "social"},
      {'id':2,  'start': new Date(2013, 8, 30, 8, 00), 'end': new Date(2013, 8, 30, 9, 00),'title':'Breakfast Buffet*', 'classname': "LC"},
      {'id':3,  'start': new Date(2013, 8, 30, 9, 00), 'end': new Date(2013, 8, 30, 10, 30),'title':'Plenary', 'classname': "plenary"},
      {'id':4,  'start': new Date(2013, 8, 30, 10, 30), 'end': new Date(2013, 8, 30, 11, 00),'title':'Coffee break', 'classname': "LC"},
      {'id':5,  'start': new Date(2013, 8, 30, 11, 00), 'end': new Date(2013, 8, 30, 12, 30),'title':'Plenary', 'classname': "plenary"},
      {'id':6,  'start': new Date(2013, 8, 30, 12, 30), 'end': new Date(2013, 8, 30, 14, 30),'title':'Lunch', 'classname': "LC"},
      {'id':7,  'start': new Date(2013, 8, 30, 14, 30), 'end': new Date(2013, 8, 30, 16, 00),'title':'Plenary', 'classname': "plenary"},
      {'id':8,  'start': new Date(2013, 8, 30, 16, 00), 'end': new Date(2013, 8, 30, 16, 30),'title':'Coffee break', 'classname': "LC"},
      {'id':9,  'start': new Date(2013, 8, 30, 16, 30), 'end': new Date(2013, 8, 30, 18, 00),'title':'Plenary', 'classname': "plenary"},
      {'id':10, 'start': new Date(2013, 8, 30, 18, 00), 'end': new Date(2013, 8, 30, 19, 00),'title':'Free Meetings', 'classname': "FM"},
	  {'id':2,  'start': new Date(2013, 9, 1, 8, 00),  'end': new Date(2013, 9, 1, 9, 00),'title':'Breakfast Buffet*', 'classname': "LC"},
      {'id':3,  'start': new Date(2013, 9, 1, 9, 00),  'end': new Date(2013, 9, 1, 10, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':4,  'start': new Date(2013, 9, 1, 10, 30), 'end': new Date(2013, 9, 1, 11, 00),'title':'Coffee break', 'classname': "LC"},
      {'id':5,  'start': new Date(2013, 9, 1, 11, 00), 'end': new Date(2013, 9, 1, 12, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':6,  'start': new Date(2013, 9, 1, 12, 30), 'end': new Date(2013, 9, 1, 14, 30),'title':'Lunch', 'classname': "LC"},
      {'id':7,  'start': new Date(2013, 9, 1, 14, 30), 'end': new Date(2013, 9, 1, 16, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':8,  'start': new Date(2013, 9, 1, 16, 00), 'end': new Date(2013, 9, 1, 16, 30),'title':'Coffee break', 'classname': "LC"},
      {'id':9,  'start': new Date(2013, 9, 1, 16, 30), 'end': new Date(2013, 9, 1, 18, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':10, 'start': new Date(2013, 9, 1, 18, 00), 'end': new Date(2013, 9, 1, 19, 00),'title':'Free Meetings', 'classname': "FM"},
      {'id':10, 'start': new Date(2013, 9, 1, 19, 00), 'end': new Date(2013, 9, 1, 21, 00),'title':'Conference dinner (buffet)', 'classname': "social"},
	  {'id':2,  'start': new Date(2013, 9, 2, 8, 00),  'end': new Date(2013, 9, 2, 9, 00),'title':'Breakfast Buffet*', 'classname': "LC"},
      {'id':3,  'start': new Date(2013, 9, 2, 9, 00),  'end': new Date(2013, 9, 2, 10, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':4,  'start': new Date(2013, 9, 2, 10, 30), 'end': new Date(2013, 9, 2, 11, 00),'title':'Coffee break', 'classname': "LC"},
      {'id':5,  'start': new Date(2013, 9, 2, 11, 00), 'end': new Date(2013, 9, 2, 12, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':6,  'start': new Date(2013, 9, 2, 12, 30), 'end': new Date(2013, 9, 2, 14, 30),'title':'Lunch', 'classname': "LC"},
      {'id':7,  'start': new Date(2013, 9, 2, 14, 30), 'end': new Date(2013, 9, 2, 16, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':8,  'start': new Date(2013, 9, 2, 16, 00), 'end': new Date(2013, 9, 2, 16, 30),'title':'Coffee break', 'classname': "LC"},
      {'id':9,  'start': new Date(2013, 9, 2, 16, 30), 'end': new Date(2013, 9, 2, 18, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':10, 'start': new Date(2013, 9, 2, 18, 00), 'end': new Date(2013, 9, 2, 19, 00),'title':'Free Meetings', 'classname': "FM"},
	  {'id':2,  'start': new Date(2013, 9, 3, 8, 00),  'end': new Date(2013, 9, 3, 9, 00),'title':'Breakfast Buffet*', 'classname': "LC"},
      {'id':3,  'start': new Date(2013, 9, 3, 9, 00),  'end': new Date(2013, 9, 3, 10, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':4,  'start': new Date(2013, 9, 3, 10, 30), 'end': new Date(2013, 9, 3, 11, 00),'title':'Coffee break', 'classname': "LC"},
      {'id':5,  'start': new Date(2013, 9, 3, 11, 00), 'end': new Date(2013, 9, 3, 12, 30),'title':'Parallel', 'classname': "parallel"},
      {'id':6,  'start': new Date(2013, 9, 3, 12, 30), 'end': new Date(2013, 9, 3, 14, 30),'title':'Lunch', 'classname': "LC"},
      {'id':7,  'start': new Date(2013, 9, 3, 14, 30), 'end': new Date(2013, 9, 3, 16, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':8,  'start': new Date(2013, 9, 3, 16, 00), 'end': new Date(2013, 9, 3, 16, 30),'title':'Coffee break', 'classname': "LC"},
      {'id':9,  'start': new Date(2013, 9, 3, 16, 30), 'end': new Date(2013, 9, 3, 18, 00),'title':'Parallel', 'classname': "parallel"},
      {'id':10, 'start': new Date(2013, 9, 3, 18, 00), 'end': new Date(2013, 9, 3, 19, 00),'title':'Free Meetings', 'classname': "FM"},
	  {'id':2,  'start': new Date(2013, 9, 4, 8, 00),  'end': new Date(2013, 9, 4, 9, 00),'title':'Breakfast Buffet*', 'classname': "LC"},
      {'id':3,  'start': new Date(2013, 9, 4, 9, 00),  'end': new Date(2013, 9, 4, 10, 30),'title':'Plenary', 'classname': "plenary"},
      {'id':4,  'start': new Date(2013, 9, 4, 10, 30), 'end': new Date(2013, 9, 4, 11, 00),'title':'Coffee break', 'classname': "LC"},
      {'id':5,  'start': new Date(2013, 9, 4, 11, 00), 'end': new Date(2013, 9, 4, 12, 30),'title':'Plenary', 'classname': "plenary"},
      {'id':6,  'start': new Date(2013, 9, 4, 12, 30), 'end': new Date(2013, 9, 4, 14, 30),'title':'Lunch', 'classname': "LC"},
      {'id':1,  'start': new Date(2013, 9, 4, 15, 00), 'end': new Date(2013, 9, 4, 17, 00),'title':'Bus from Eden Roc to T1', 'classname': "Transp"},
      {'id':1,  'start': new Date(2013, 9, 4, 17, 00), 'end': new Date(2013, 9, 4, 17, 30),'title':'Bus T1 to BCN', 'classname': "Transp"},
    ]
  };

 $(document).ready(function() {
    $('#calendar').weekCalendar({
	  date: new  Date(2013, 8, 29),
      timeslotsPerHour: 2,
      timeslotHeigh: 30,
	  daysToShow:7,
	  use24Hour: false,
	  timeFormat: "G:i",
	  timeSeparator: "/",
	  businessHours: {start: 8, end: 21, limitDisplay: true},
      hourLine: true,
	  readonly: true,
      data: eventData,
	  allowEventCreation: false,
      height: function($calendar) {
        
        return $(window).height() - $('h1').outerHeight(true);
      },
	  draggable : function(calEvent, $event) {
         return calEvent.readOnly != true;
	  },
	  resizable : function(calEvent, $event) {
			 return calEvent.readOnly != true;
	  },
      eventRender : function(calEvent, $event) {
        
		if (calEvent.classname == "social") {
          $event.css('backgroundColor', '#FFBE72');
          $event.find('.wc-time').css({'backgroundColor': '#FF9E2E', 'border':'1px solid #888'});
        }
		if (calEvent.classname == "Transp") {
          $event.css('backgroundColor', '#FE8A8A');
          $event.find('.wc-time').css({'backgroundColor': '#FE4444', 'border':'1px solid #888'});
        }
		if (calEvent.classname == "LC") {
          $event.css('backgroundColor', '#AAA');
          $event.find('.wc-time').css({'backgroundColor': '#888', 'border':'1px solid #888'});
        }
		if (calEvent.classname == "plenary") {
          $event.css('backgroundColor', '#49F');
          $event.find('.wc-time').css({'backgroundColor': '#27F', 'border':'1px solid #888'});
        }
		if (calEvent.classname == "parallel") {
          $event.css('backgroundColor', '#AD86DF');
          $event.find('.wc-time').css({'backgroundColor': '#8F55DB', 'border':'1px solid #888'});
        }
		if (calEvent.classname == "FM") {
          $event.css('backgroundColor', '#9D7');
          $event.find('.wc-time').css({'backgroundColor': '#6C4', 'border':'1px solid #888'});
        }
		if (calEvent.end.getTime() < new Date().getTime()) {
          $event.css('backgroundColor', '#aaa');
          $event.find('.wc-time').css({'backgroundColor': '#999', 'border':'1px solid #888'});
        }
      },
      eventClick: function(calEvent, $event) {
        displayMessage('<strong>' + calEvent.title + '</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventMouseover: function(calEvent, $event) {
        displayMessage('<strong>' + calEvent.title + '</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      eventMouseout: function(calEvent, $event) {
        displayMessage('<strong>' + calEvent.title + '</strong><br/>Start: ' + calEvent.start + '<br/>End: ' + calEvent.end);
      },
      noEvents: function() {
        displayMessage('There are no events for this week');
      }
    });

    function displayMessage(message) {
      $('#message').html(message).fadeIn();
    }

    $('<div id="message" class="ui-corner-all"></div>').prependTo($('body'));
  });


</script>
</head>
<div id="body" style="bgcolor=#333333; ">
 <p class="style1">WEB CALENDAR</p>
<p class="style1">Find detailed program  and book <span class="style12">Free Meetings</span> rooms in redmine wiki: <em>Not ready yet</em></p>
<p class="style1">Upload your talks to docdb events:  <em>Not ready yet</em></p>

  <h1>DES Collaboration Meeting Program</h1>

  <p class="description">
    General program view.
</p>

  <div id='calendar' style="height:600px;"></div>
</div>
*For participants staying in Eden Roc Hotel
</%block>
