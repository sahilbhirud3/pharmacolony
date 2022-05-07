<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="pharmacolony.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
    
    <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>PharmaColony</title>
 
   <link rel="icon" href="img/favi1.png" type="png" />
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal" />
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
  <link rel="stylesheet" type="text/css" href="css/style.css" />
   
      <link rel="stylesheet" type="text/css" href="css/imgslider.css" />
    
    <script src="https://kit.fontawesome.com/cf71eb30e3.js" crossorigin="anonymous"></script>
 
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
    <form id="form1" runat="server">
        <div>
  <section id="banner" class="banner" style="width:auto;">
    <div class="bg-color" >
      <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
          <div class="col-md-12">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
                <div class="navbar-brand" style="height:50px;width:50px;padding:unset">
    <img src="img/newlogo.gif" class="img-responsive" /></div><img src="img/newlogo.png" />

				               
            </div>
            <div class="collapse navbar-collapse navbar-right" id="myNavbar">
              <ul class="nav navbar-nav">
                <li class="active"><a href="#banner">Home</a></li>
                <li class=""><a href="#explore">Explore</a></li>
                <li class=""><a href="registration.aspx">Registration</a></li>
                <li class=""><a href="#login">Login</a></li>
                <li class=""><a href="#contact">Contact</a></li>
                  
              </ul>
            </div>
          </div>
        </div>
      </nav>
      <div class="container" >
        <div class="row"  >
          <div class="banner-info" style="justify-content:center;" >
            <div class="banner-logo text-center">
              <img src="img/pharmalogo.gif" height="160" width="200" class="img-responsive" />
            </div>
            <div class="banner-text text-center">
              <h1 class="white">Distributor at your desk!!</h1>
              <p>Login and Place your orders at one click</p>
              <a href="#login" class="btn btn-appoint">LOGIN</a>
            </div>
            <div class="overlay-detail text-center">
              <a href="#explore"><i class="fa fa-angle-down"></i></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ banner-->
  <!--explore-->
  <section id="explore" class="section-padding">
      <br /><br />
      <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-4">
          <h2 class="ser-title">Explore</h2>
          <hr class="botm-line" />
         <p>Get rid from long queues and waiting<br /> Place your orders at one click for multiple distributors<br />Get wider range of company's distributor for drugs/medicines.</br> Use our website and save your precious time</p>
            <br /></br><img src="img/stat.png" width="320px"/>
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="service-info">
            <div class="icon">
              <i class="fa-solid fa-gears"></i>
            </div>
            <div class="icon-info">
              <h4>24 Hour Service</h4>
              <p>Place order at anytime & from anywhere.</p><br /><br />
            </div>
          </div>
          <div class="service-info">
            <div class="icon">
             <i class="fas fa-clinic-medical"></i>
            </div>
            <div class="icon-info">
              <h2><asp:TextBox ID="TextBox1" runat="server" BorderColor="White" BorderStyle="None" Enabled="False">355</asp:TextBox> </h2><br />
              <p>Medical Registered Already</p>
               
            </div>
          </div>
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="service-info">
            <div class="icon">
             <i class="fa-solid fa-briefcase"></i>
            </div>
            <div class="icon-info">
              <h4>Explore more Companies & Distributors</h4>
              <p>Search more options for one medicine,see  more details about medicine. </p><br />
            </div>
          </div>
          <div class="service-info">
            <div class="icon">
             <i class="fa-solid fa-building-circle-arrow-right"></i>
            </div>
            <div class="icon-info">
              <h2><asp:TextBox ID="TextBox2" runat="server" BorderColor="White" BorderStyle="None" Enabled="False">238</asp:TextBox></h2><br />
              <p>Distributors Registered Already</p>
                
            </div>
          </div>
        </div>
      </div>
    </div>

<header>
  

  <div class="row1 small">
    <div class="imagegroup" style="animation-delay: 1s;">
       
        <img src="img/divis.jpg" />
        <img src="img/drreddy.jpg" />
       
        <img src="img/Pfizer-BioNTech.jpg" />
        
        <img src="img/Zydus.jpg" />
        <img src="img/cipla.jpg" />
        <img src="img/biocon-biologics-logo.jpg" />
        <img src="img/cadila.png" />
         <img src="img/lupin.jpg" />
        <img src="img/Torrent_Pharma.jpg" />
    </div>
  </div>
</header>




  </section>
  <!--/ service-->
  <!--cta-->
  <section id="cta-1" class="section-padding">
     
  </section>
  <!--cta-->
  <!--registration-->
 
  <!--/ about-->
 >
  <!--LOGIN-->
  
    <section id="login" class="section-padding"><br />
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="ser-title">Access to Medilife !!!</h2>
          <hr class="botm-line">
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="testi-details text-center">
            <!-- Paragraph -->
<h3><a href="medicalLogin.aspx" class=""> Login &nbsp   <span class="fa-solid fa-arrow-right"></span> </a> </h3> <br /></div>
      
            <div class="testi-info">
            <!-- User Image -->
                <img src="img/medical.png" />
            <!-- User Name -->
            <h3>Medical<span>Login</span></h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="testi-details text-center">
            <!-- Paragraph -->
 <h3><a href="distributorLogin.aspx" class="">Login &nbsp <span class="fa-solid fa-arrow-right"></span></a></h3><br />          </div>
          <div class="testi-info" >
            <!-- User Image -->
              <img src="img/distributor.jpg" />
            <!-- User Name -->
            <h3>Distributor<span>Login</span></h3>
          </div>
        </div>
        <div class="col-md-4 col-sm-4">
          <div class="testi-details text-center">
            <!-- Paragraph -->
          <h3> <a href="adminLogin.aspx" class="">Login &nbsp  <span class="fa-solid fa-arrow-right"></span></a></h3><br />
          </div>
          <div class="testi-info">
            <!-- User Image -->
            <img src="img/admin.jpg" />
            <!-- User Name -->
            <h3>Admin <span>Login</span></h3>
          </div>
        </div>
      </div>
    </div>
  </section>   
  <!--/ testimonial-->
  <!--cta 2-->
  <section id="cta-2" class="section-padding">
    <div class="container">
      <div class=" row">
        <div class="col-md-2"></div>
        <div class="text-right-md col-md-4 col-sm-4">
          <h2 class="section-title white lg-line">« A few words<br> about us »</h2>
        </div>
        <div class="col-md-4 col-sm-5">
        <p style="color:white">Easy order processing between medical store and distributor.
Medical stores will easily order medicines through this system effectively and efficiently.
From this system, medical stores take advantage of placing orders for multiple distributors in one order place.
Distributor will process orders received from medical stores through this system.</p>  

          <p class="text-right text-primary" style="color:aqua">— PharmaColony</p>
        </div>
        <div class="col-md-2"></div>
      </div>
    </div><br />
  </section>
  <!--cta-->
  <!--contact-->
  <section id="contact" class="section-padding">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="ser-title">Contact us</h2>
          <hr class="botm-line">
        </div>
        <div class="col-md-4 col-sm-4">
          <h3>Contact Info</h3>
          <div class="space"></div>
          <p><i class="fa fa-map-marker fa-fw pull-left fa-2x"></i>KTHM College<br> Gangapur Road, Nashik 422002</p>
          <div class="space"></div>
          <p><i class="fa fa-envelope-o fa-fw pull-left fa-2x"></i>chaitanyabhavar2021@gmail.com<br />sahilbhirud3@gmail.com</p>
          <div class="space"></div>
          <p><i class="fa fa-phone fa-fw pull-left fa-2x"></i>+91 9579213171 <br /> +91 8600386608</p>
        </div>
        <div class="col-md-8 col-sm-8 marb20">
          <div class="contact-info">
            <h3 class="cnt-ttl">Having Any Query! </h3>
            <div class="space"></div>
            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form action="" method="post" role="form" class="contactForm">
              <div class="form-group">
                  <asp:TextBox ID="TextBox3" class="form-control br-radius-zero" placeholder="Your Name" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox3"></asp:RequiredFieldValidator><div class="validation"></div>
              </div>
              <div class="form-group">
                  <asp:TextBox ID="TextBox4" class="form-control br-radius-zero" placeholder="Your Email" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredField" Font-Overline="False" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                  <div class="validation"></div>
              </div>
              <div class="form-group">
                  <asp:TextBox ID="TextBox5" class="form-control br-radius-zero" placeholder="Subject" runat="server"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox5"></asp:RequiredFieldValidator>
                  <div class="validation"></div>
              </div>
              <div class="form-group">
                  <asp:TextBox ID="TextBox6" class="form-control br-radius-zero" placeholder="Message" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
                  <div class="validation"></div>
              </div>

              <div class="form-action">
                  <asp:Button ID="Button1" class="btn btn-form" runat="server" Text="Send Message" />
             
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ contact-->
  <!--footer-->
  <footer id="footer">
    <div class="top-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-4 marb20">
            <div class="ftr-tle">
              <h4 class="white no-padding">About Us</h4>
            </div>
            <div class="info-sec">
              <p>This website built to handle medical stores orders and also distributors order processing<br /> in effective manner.<br /><br />
              </p>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 marb20">
            <div class="ftr-tle">
              <h4 class="white no-padding">Quick Links</h4>
            </div>
            <div class="info-sec">
              <ul class="quick-info">
                <li><a href="#banner"><i class="fa-solid fa-house fa-fa-4x" style="font-size:medium"></i>&nbsp Home</a></li><br />
                <li><a href="#explore"><i class="fa-brands fa-wpexplorer" style="font-size:medium"></i>&nbsp Explore</a></li><br />
                <li><a href="#contact"><i class="fa-solid fa-address-card" style="font-size:medium"></i>&nbsp Contact</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 marb20">
            <div class="ftr-tle">
              <h4 class="white no-padding">Follow us</h4>
                <h4 class="white no-padding">Build by :<br /><span style="margin-left:80px">Bhavar Chaitanya Sitaram</h4>
                 <div class="info-sec">
              <ul class="social-icon" style="margin-left:80px">
                <a href="https://instagram.com/chaitanya_s_bhavar96k?igshid=YmMyMTA2M2Y="><li><img src="img/instagram.png" /></li></a> 
                <a href="https://www.linkedin.com/in/chaitanyabhavar246"><li><img src="img/linkedin.png" /></li></a>
              </ul>
            </div></span><br /><br />
  <Br /><h4 class="white no-padding" style="margin-left:80px">Bhirud Sahil Chudaman</h4>
            
            <div class="info-sec">
              <ul class="social-icon" style="margin-left:80px">
                  
                <a href="https://instagram.com/sahil.bhirud__sb?igshid=YmMyMTA2M2Y="><li><img src="img/instagram.png" /></li></a> 
                <a href="https://www.linkedin.com/in/sahil-bhirud-scb712"><li><img src="img/linkedin.png" /></li></a>
              </ul>
            </div>
                </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer-line">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center">
         PharmaColony  &nbsp &nbsp  A Better access to medilife  &nbsp &nbsp @2022    
            
          </div>
        </div>
      </div>
    </div>
  </footer>
  <!--/ footer-->

  <script src="js/jquery.min.js"></script>
  <script src="js/jquery.easing.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/custom.js"></script>
  <script src="contactform/contactform.js"></script>


        </div>
    </form>
</body>
</html>
