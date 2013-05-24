<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>DES BCN meeting</title>
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="/static/bootstrap_DES_2.min.css" rel="stylesheet">
    
    <style>
      body {
        
      
background: #4c4c4c; /* Old browsers */




      }
    .navbar-inner {
  background: #8D8D8D; 
   
 
}

/* styles for layout */
html,body
{
    height:100%;

}
 
#wrap
{
  min-height: 100%; 
  height : auto !important;
 height: 100%;
  
}
 
#main
{
    overflow:auto;
    padding-top: 150px; /* 60px to make the container go all the way to the bottom of the topbar */
    
    padding-bottom:165px; /* this needs to be bigger than footer height*/
}
 
.footer 
{
    position: relative;
    margin-top: -60px; /* negative value of footer height */
    padding-top: 10px;
    clear:both;
    height: 60px;
    color:#8D8D8D;
} 


.DES {font-size : 18px;}

<!--
.style1 {
	font-family: Arial, Helvetica, sans-serif;
	color:#FFF;
	border-color: #FFFFFF;
	border-width: 11;
	}
.style2 {
	color: #FF9900;
	font-weight: bold;
}

.style3 {font-family: Arial, Helvetica, sans-serif}
.style4 {color: #0066FF; font-weight: bold; font-family: Arial, Helvetica, sans-serif; }
.style8 {font-family: Arial, Helvetica, sans-serif; color: #333333; border-color: #FFFFFF; border-width: 11; font-weight: bold; }
.style9 {font-family: Arial, Helvetica, sans-serif; color: #FFF; border-color: #FFFFFF; border-width: 11; font-size: small; }
.style10 {font-size: small}
.style11 {
	color: #FFCC00;
	font-weight: bold;
	font-size: large;
}
.style12 {
	color: #66CC33;
	font-weight: bold;
}
.style13 {font-family: Arial, Helvetica, sans-serif; color: #FFF; border-color: #FFFFFF; border-width: 11; font-size: x-large; }
.style14 {font-size: medium}
-->

    </style>
   

  
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="../assets/ico/favicon.png">
  </head>

  <body>
  
    <div  class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container ">
             <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
          <a class="brand" > <img src="static/DES_logo_black_transp_small.png"></a>  
          <a class="brand" >Dark Energy Survey (DES) International Collaboration Operations Meeting</a>
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

<div id="wrap">
<div id="main" class="container clear-top">
    <div class="row"> 
        <div class="span12">
            <%block name="main_container"/>       
        </div>
    </div>
</div>
</div>

                    
<footer class="footer" style="background-color:#c2c2c2;">

    <div class="container" style="margin:0 auto"; >
        
        
             
            
              <a class="brand"  > <img src="static/logo_ieec_40.png" ></a>
              <a class="brand pull-right" > <img src="static/logo_ifae_40.png"></a>
             
          
            
        
    </div>
</footer>


  </body>
</html>
