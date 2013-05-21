<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>DES BCN meeting</title>
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/static/bootstrap_DES_2.css" rel="stylesheet">
    <link href="/static/responsive_DES_2.css" rel="stylesheet">
    <style>
      body {
        
        padding-top: 120px; /* 60px to make the container go all the way to the bottom of the topbar */

background: #4c4c4c; /* Old browsers */
background: -moz-linear-gradient(left,  #4c4c4c 0%, #595959 0%, #666666 0%, #474747 0%, #2c2c2c 19%, #111111 41%, #111111 56%, #2b2b2b 69%, #1c1c1c 86%, #131313 99%, #242424 100%); /* FF3.6+ */
background: -webkit-gradient(linear, left top, right top, color-stop(0%,#4c4c4c), color-stop(0%,#595959), color-stop(0%,#666666), color-stop(0%,#474747), color-stop(19%,#2c2c2c), color-stop(41%,#111111), color-stop(56%,#111111), color-stop(69%,#2b2b2b), color-stop(86%,#1c1c1c), color-stop(99%,#131313), color-stop(100%,#242424)); /* Chrome,Safari4+ */
background: -webkit-linear-gradient(left,  #4c4c4c 0%,#595959 0%,#666666 0%,#474747 0%,#2c2c2c 19%,#111111 41%,#111111 56%,#2b2b2b 69%,#1c1c1c 86%,#131313 99%,#242424 100%); /* Chrome10+,Safari5.1+ */
background: -o-linear-gradient(left,  #4c4c4c 0%,#595959 0%,#666666 0%,#474747 0%,#2c2c2c 19%,#111111 41%,#111111 56%,#2b2b2b 69%,#1c1c1c 86%,#131313 99%,#242424 100%); /* Opera 11.10+ */
background: -ms-linear-gradient(left,  #4c4c4c 0%,#595959 0%,#666666 0%,#474747 0%,#2c2c2c 19%,#111111 41%,#111111 56%,#2b2b2b 69%,#1c1c1c 86%,#131313 99%,#242424 100%); /* IE10+ */
background: linear-gradient(to right,  #4c4c4c 0%,#595959 0%,#666666 0%,#474747 0%,#2c2c2c 19%,#111111 41%,#111111 56%,#2b2b2b 69%,#1c1c1c 86%,#131313 99%,#242424 100%); /* W3C */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#4c4c4c', endColorstr='#242424',GradientType=1 ); /* IE6-9 */


      }
    .navbar-inner {
  background: #8D8D8D; 
 
}
    </style>
   

  
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
             <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
          <a class="brand" > <img src="static/DES_logo_black_transp_small.png"></a>  
          <a class="brand" ">Dark Energy Survey International Collaboration meeting</a>
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

    <div class="container">
        <div class="span12">
             <%block name="main_container"/>

     
         </div>

     

     
    </div> <!-- /container -->
        <div class="navbar navbar-fixed-bottom"></div>
             <div class="navbar-inner">
                <div class="container">
                    <p>&copy; Copyright reserved</p>
                    <a class="brand" > <img src="static/logo_ieec_40.png"></a>
                    <a class="brand pull-right" > <img src="static/logo_ifae_40.png"></a>
                </div>
            </div>
        </div>
    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/jquery.js"></script>
    <script src="/static/bootstrap.js"></script>

  </body>
</html>
