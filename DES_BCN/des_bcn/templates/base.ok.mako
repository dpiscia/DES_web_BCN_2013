!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sticky footer &middot; Twitter Bootstrap</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link href="/static/bootstrap_DES_2.css" rel="stylesheet">
    <style type="text/css">

      /* Sticky footer styles
      -------------------------------------------------- */

      html,
      body {
        height: 100%;
        /* The html and body elements cannot have any padding or margin. */
background: #4c4c4c; /* Old browsers */
background: -moz-linear-gradient(top,  #4c4c4c 0%, #595959 0%, #1c1c1c 0%, #5b5b5b 100%, #111111 100%, #131313 100%, #2b2b2b 100%, #2c2c2c 100%, #111111 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4c4c4c), color-stop(0%,#595959), color-stop(0%,#1c1c1c), color-stop(100%,#5b5b5b), color-stop(100%,#111111), color-stop(100%,#131313), color-stop(100%,#2b2b2b), color-stop(100%,#2c2c2c), color-stop(100%,#111111)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(top,  #4c4c4c 0%,#595959 0%,#1c1c1c 0%,#5b5b5b 100%,#111111 100%,#131313 100%,#2b2b2b 100%,#2c2c2c 100%,#111111 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(top,  #4c4c4c 0%,#595959 0%,#1c1c1c 0%,#5b5b5b 100%,#111111 100%,#131313 100%,#2b2b2b 100%,#2c2c2c 100%,#111111 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(top,  #4c4c4c 0%,#595959 0%,#1c1c1c 0%,#5b5b5b 100%,#111111 100%,#131313 100%,#2b2b2b 100%,#2c2c2c 100%,#111111 100%); /* IE10+ */
background: linear-gradient(to bottom,  #4c4c4c 0%,#595959 0%,#1c1c1c 0%,#5b5b5b 100%,#111111 100%,#131313 100%,#2b2b2b 100%,#2c2c2c 100%,#111111 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4c4c4c', endColorstr='#111111',GradientType=0 ); /* IE6-9 */
      }

      /* Wrapper for page content to push down footer */
      #wrap {
        min-height: 100%;
        height: auto !important;
        height: 100%;
        /* Negative indent footer by it's height */
        margin: 0 auto -60px;
      }

      /* Set the fixed height of the footer here */
      #push,
      #footer {
        height: 60px;
      }
      #footer {
            padding-top: 10px;
    clear:both;
    height: 60px;
    color:#8D8D8D;
background-color:#c2c2c2;
      }

      /* Lastly, apply responsive CSS fixes as necessary */
      @media (max-width: 767px) {
        #footer {
          margin-left: -20px;
          margin-right: -20px;
          padding-left: 20px;
          padding-right: 20px;
        }
      }



      /* Custom page CSS
      -------------------------------------------------- */
      /* Not required for template or sticky footer method. */

      #wrap > .container {
        padding-top: 130px;
      }
      .container .credit {
        margin: 20px 0;
      }

      code {
        font-size: 80%;
      }

    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>


    <!-- Part 1: Wrap all page content here -->
    <div id="wrap">

    <div  class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container ">
             <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
          <a class="brand" > <img src="static/DES_logo_black_transp_small.png"></a>  
          <a class="brand" >Dark Energy Survey International Collaboration meeting</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li ${'class= active' if (tab == 'home') else ''} ><a href="${request.route_url('home')}">  Home</a></li>
              <li ${'class= active' if (tab == 'program') else ''}><a href="${request.route_url('program')}">Program</a></li>
              <li ${'class= active' if (tab == 'participants') else ''}><a href="${request.route_url('participants')}">Participants</a></li>
              <li ${'class= active' if (tab == 'venue_accommodation') else ''}><a href="${request.route_url('venue_accommodation')}">Venue & Accommodation</a></li>
              <li ${'class= active' if (tab == 'travel') else ''}><a href="${request.route_url('travel')}">Travel</a></li>
              <li ${'class= active' if (tab == 'registration') else ''}><a href="${request.route_url('registration')}">Registration
</a></li>
              <li ${'class= active' if (tab == 'contact') else ''}><a href="${request.route_url('contact')}">Contact</a></li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

      <!-- Begin page content -->
      <div class="container">
    <%block name="main_container"/> 
      </div>

      <div id="push"></div>
    </div>

    <div id="footer">
    <div class="container" style="margin:0 auto"; >
        
        
             
            
              <a class="brand"  > <img src="static/logo_ieec_40.png" ></a>
              <a class="brand pull-right" > <img src="static/logo_ifae_40.png"></a>
             
          
            
        
    </div>
    </div>




  </body>
</html>