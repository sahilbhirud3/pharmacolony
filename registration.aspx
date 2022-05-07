<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Async="true" Inherits="pharmacolony.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
     <link rel="icon" href="img/favi1.png" type="png" />
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open+Sans|Raleway|Candal" />
  <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />
  <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link href="css/registration.css" rel="stylesheet"/>

<script src="Scripts/jquery-3.4.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
<!------  HEAD tag ---------->
    <style>
        .form-group{
    margin-bottom:unset !important;
}
        .register {
   /* background: -webkit-linear-gradient(left, #3931af, #00c6ff);*/
   background-image:url("img/homeimg1.jpg");
   background-size:cover;
    margin-top: 8px;
    padding: 3%;
}
        .register-left input {
            margin-top: 10%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       

<div class="container register">
                <div class="row">
    
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h2><b>PharmaColony<br />Welcomes You!!</b></h2>
                        <p><h5>You are 30 seconds away from your orders!</h5></p>
                      <a href="home.aspx#login">  <input name="" value="Login" style="text-align:center"/></a><br/>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Medical</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active"  id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Distributor</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Register as Medical</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                    <asp:TextBox ID="medicalName" class="form-control" placeholder="Medical Name *" runat="server"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="medicalName" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
 <asp:TextBox ID="oFirstName" class="form-control" placeholder="Owner's First Name *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="oFirstName" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                 </div>       
                                        <div class="form-group">

                                        </div>
                                        <div class="form-group">
<asp:TextBox ID="email" class="form-control" placeholder="Email *" runat="server" TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="email" ValidationGroup="medical"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ControlToValidate="email" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                      <asp:TextBox ID="address" class="form-control" placeholder="Address *" runat="server"></asp:TextBox>        
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="address" ValidationGroup="medical"></asp:RequiredFieldValidator>                     
                                        </div>
                                        <div class="form-group">
                                         <asp:TextBox ID="state" class="form-control" placeholder="State *" runat="server"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="state" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                    </div>
                                           <div class="form-group">
                                       <asp:TextBox ID="cPassword" class="form-control" placeholder="Confirm Password *" TextMode="Password" runat="server"></asp:TextBox>   
<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not same" ControlToValidate="cpassword" ControlToCompare="password" ValidationGroup="medical"></asp:CompareValidator>

<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required" ControlToValidate="cPassword" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                             </div>
                                        </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <asp:TextBox ID="licenseNumber" class="form-control" placeholder="License Number *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="licenseNumber" ValidationGroup="medical"></asp:RequiredFieldValidator>                                        </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="oLastName" class="form-control"  placeholder="Owner's Last Name *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="oLastName" ValidationGroup="medical"></asp:RequiredFieldValidator>
    
                                        </div>
                                        <div class="form-group">
                                      <asp:TextBox ID="contactNumber" class="form-control" placeholder="Contact Number *" runat="server" MaxLength="12" TextMode="Phone"></asp:TextBox>  
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="contactNumber" ValidationGroup="medical"></asp:RequiredFieldValidator>  
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" ControlToValidate="contactNumber"></asp:RegularExpressionValidator>
                                            </div>
                                        <div class="form-group">
                                       <asp:TextBox ID="city" class="form-control" placeholder="City *" runat="server"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Required" ControlToValidate="city" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                        </div>
                                         <div class="form-group">
                                       <asp:TextBox ID="password" class="form-control" placeholder="Enter Password *" TextMode="Password" runat="server"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="password" ValidationGroup="medical"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum eight characters, at least one letter and one number:" ValidationExpression='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$' ControlToValidate="password"></asp:RegularExpressionValidator>     
                                             </div>
<asp:Button ID="BtnMedicalReg" class="btnRegister" OnClick="BtnMedicalReg_Click" runat="server" Text="Register" CausesValidation="True" ValidationGroup="medical" UseSubmitBehavior="True" />
                                    
                                        
                                    </div>
                                </div>
                            </div>
 

                            <div class="tab-pane fade show" " id="profile" role="tabpanel" aria-labelledby="profile-tab">
                                <h3  class="register-heading">Register as Distributor</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                    <asp:TextBox ID="distributorName" class="form-control" placeholder="Agency Name *" runat="server"></asp:TextBox>
   <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required" ControlToValidate="distributorName" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="form-group">
 <asp:TextBox ID="doFirstName" class="form-control" placeholder="Owner's First Name *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ErrorMessage="Required" ControlToValidate="doFirstName" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                 </div>       
                                        <div class="form-group">

                                        </div>
                                        <div class="form-group">
<asp:TextBox ID="dEmail" class="form-control" placeholder="Email *" runat="server" TextMode="Email"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Required" ControlToValidate="dEmail" ValidationGroup="distributor"></asp:RequiredFieldValidator>
<asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Email" ControlToValidate="dEmail" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-group">
                      <asp:TextBox ID="dAddress" class="form-control" placeholder="Address *" runat="server"></asp:TextBox>        
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Required" ControlToValidate="dAddress" ValidationGroup="distributor"></asp:RequiredFieldValidator>                     
                                        </div>
                                        <div class="form-group">
                                         <asp:TextBox ID="dState" class="form-control" placeholder="State *" runat="server"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Required" ControlToValidate="dState" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                    </div>
                                           <div class="form-group">
                                       <asp:TextBox ID="dcPassword" class="form-control" placeholder="Confirm Password *" runat="server" TextMode="Password"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ErrorMessage="Required" ControlToValidate="dcPassword" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                             </div>
                                        </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                        <asp:TextBox ID="dlicenseNumber" class="form-control" placeholder="License Number *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ErrorMessage="Required" ControlToValidate="dlicenseNumber" ValidationGroup="distributor"></asp:RequiredFieldValidator>                                        </div>
                                        <div class="form-group">
                                        <asp:TextBox ID="doLastName" class="form-control"  placeholder="Owner's Last Name *" runat="server"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ErrorMessage="Required" ControlToValidate="doLastName" ValidationGroup="distributor"></asp:RequiredFieldValidator>
    
                                        </div>
                                        <div class="form-group">
                                      <asp:TextBox ID="dContactNumber" class="form-control" placeholder="Contact NO *" runat="server" MaxLength="12" TextMode="Phone"></asp:TextBox>  
                                          <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ErrorMessage="Required" ControlToValidate="dContactNumber" ValidationGroup="distributor"></asp:RequiredFieldValidator>  
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" ControlToValidate="dContactNumber"></asp:RegularExpressionValidator>
                                            </div>
                                        <div class="form-group">
                                       <asp:TextBox ID="dCity" class="form-control" placeholder="City *" runat="server"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" ErrorMessage="Required" ControlToValidate="dCity" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                        </div>
                                         <div class="form-group">
                                       <asp:TextBox ID="dPassword" class="form-control" placeholder="Enter Password *" runat="server" TextMode="Password"></asp:TextBox>   
<asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" ErrorMessage="Required" ControlToValidate="dPassword" ValidationGroup="distributor"></asp:RequiredFieldValidator>
                                  <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="Minimum eight characters, at least one letter and one number:" ValidationExpression='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$' ControlToValidate="dPassword"></asp:RegularExpressionValidator>     
                                             </div>
    <asp:Button ID="BtnDistributorReg" class="btnRegister" OnClick="BtnDistributorReg_Click" runat="server" Text="Register" CausesValidation="True" ValidationGroup="distributor" UseSubmitBehavior="True" />
                                    
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        <div>
        </div>
    </form>
</body>
</html>
