<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediProfile.aspx.cs" Inherits="pharmacolony.mediProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12">
                    <h4 class="page-title">Profile</h4>
                   <%-- <ol class="breadcrumb">
                        <li><a href="#">Dashboard</a></li>
                        <li class="active">Profile Page</li>
                    </ol>--%>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- row -->
            <div class="row">
                <div class="col-md-4 col-xs-12">
                    <div class="white-box">
                        <div class="user-bg">
                            <div class="overlay-box">
                                <div class="user-content">
                                    <a href="javascript:void(0)"><img src="img/medical.png"
                                            class="thumb-lg img-circle" alt="img"></a>
                                    <h4 class="text-white"><asp:Label ID="medicalName" runat="server"></asp:Label></h4>
                                    <h5 class="text-white"><asp:Label ID="medicalUser" runat="server"></asp:Label></h5>
                                    <h5 class="text-white"><asp:Label ID="licNo" runat="server"></asp:Label></h5>

                                </div>
                            </div>
                        </div>
                       <%-- <div class="user-btm-box">
                            <div class="col-md-4 col-sm-4 text-center">
                                <p class="text-purple"><i class="ti-facebook"></i></p>
                                <h1>258</h1>
                            </div>
                            <div class="col-md-4 col-sm-4 text-center">
                                <p class="text-blue"><i class="ti-twitter"></i></p>
                                <h1>125</h1>
                            </div>
                            <div class="col-md-4 col-sm-4 text-center">
                                <p class="text-danger"><i class="ti-dribbble"></i></p>
                                <h1>556</h1>
                            </div>
                        </div>--%>
                    </div>
                </div>
                <div class="col-md-8 col-xs-12">
                    <div class="form-horizontal form-material white-box">
                        <%--<form class="form-horizontal form-material">--%>
                            <div class="form-group">
                                <label class="col-md-12">First Name</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="fName" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="fName"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="col-md-12">Last Name</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="lName" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="lName"></asp:RequiredFieldValidator>
                                    </div>
                            </div>
                           <div class="form-group">
                                <label class="col-md-12">Contact</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="contact" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="contact"></asp:RequiredFieldValidator>                                    
                                      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]{10}" ControlToValidate="contact"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="col-md-12">Address</label>
                                <div class="col-md-12">
                                    <asp:TextBox ID="address" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="address"></asp:RequiredFieldValidator>                                    
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-12">City</label>
                                <div class="col-sm-12">
                                    <asp:TextBox ID="city" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" ControlToValidate="city"></asp:RequiredFieldValidator>                                    
                                </div>
                            </div>
                        <div class="form-group">
                                <label class="col-sm-12">State</label>
                                <div class="col-sm-12">
                                    <asp:TextBox ID="state" class="form-control form-control-line" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="state"></asp:RequiredFieldValidator>                                    
                                </div>
                            </div>
                           
                            
                            
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:Button ID="update" runat="server" class="btn btn-success" Text="Update Profile" OnClick="update_Click"/>
                                    <asp:Button ID="chngPass" runat="server" class="btn btn-primary" Text="Change Password" PostBackUrl="mediChangePass.aspx" />
                                    
                                </div>
                            </div>
                        <%--</form>--%>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
</asp:Content>
