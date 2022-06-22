<%@ Page Language="C#"  MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="distributorLogin.aspx.cs" Inherits="pharmacolony.distributorLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="icon" href="img/favi1.png" type="png" />
      <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" />

      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />

    <link href="css/login.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
      <section class="vh-100">
  <div class="container-fluid h-custom">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-md-9 col-lg-6 col-xl-5">
        <img src="img/distLogin.jpg"  class="img-fluid" />

      </div>
      <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
          <div class="divider d-flex align-items-center my-4">
            <h2><p class="text-center fw-bold mx-3 mb-0">Sign In</p></h2>
          </div>

          <!-- Email input -->
          <div class="form-outline mb-4">
          
              <asp:TextBox ID="email" class="form-control form-control-lg"
              placeholder="Enter a valid email address" runat="server" TextMode="Email"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="email"></asp:RequiredFieldValidator>
              
          </div>

          <!-- Password input -->
          <div class="form-outline mb-3">
            
              <asp:TextBox ID="password" class="form-control form-control-lg"
              placeholder="Enter password" runat="server" TextMode="Password"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="password"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum eight characters, at least one letter and one number:" ValidationExpression='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$' ControlToValidate="password"></asp:RegularExpressionValidator>     

          </div>

          <div class="d-flex justify-content-between align-items-center">
            <!-- Checkbox -->
            
            <a href="distForgotPassword.aspx" class="text-body">Forgot password?</a>
          </div>

          <div class="text-center text-lg-start mt-4 pt-2">
           
              <asp:Button ID="Button1" class="btn btn-primary btn-lg"
              style="padding-left: 2.5rem; padding-right: 2.5rem;" runat="server" OnClick="Button1_distLogin" Text="Login" />
            <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="registration.aspx"
                class="link-danger">Register</a></p>
          </div>

      
      </div>
    </div>
  </div>
  <div
    class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-4 px-4 px-xl-5 bg-primary">
    <!-- Copyright -->
    <div class="text-white mb-3 mb-md-0">
         PharmaColony  &nbsp &nbsp  A Better access to medilife  &nbsp &nbsp @2022    
    </div>
  
  </div>
</section>
    </form>
</asp:Content>