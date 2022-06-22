<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediChangePass.aspx.cs" Inherits="pharmacolony.mediChangePass" %>
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
                                <label class="col-md-12">Current Password</label>
                                <div class="col-md-12">
                                        <asp:TextBox ID="password" class="form-control form-control-line" TextMode="Password" runat="server" ValidationGroup="pass"></asp:TextBox>   
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="password" ></asp:RequiredFieldValidator>

                                 </div>
                            </div>
                        <div class="form-group">
                                <label class="col-md-12">New Password</label>
                                <div class="col-md-12">
                                       <asp:TextBox ID="newPassword" class="form-control form-control-line" placeholder="New Password *" TextMode="Password" runat="server" ValidationGroup="pass"></asp:TextBox>   
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="newPassword" ></asp:RequiredFieldValidator>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum eight characters, at least one letter and one number:" ValidationExpression='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$' ControlToValidate="newPassword"></asp:RegularExpressionValidator>     
                                    </div>
                            </div>
                           <div class="form-group">
                                <label class="col-md-12">Reenter Password</label>
                                <div class="col-md-12">
                                       <asp:TextBox ID="newCpassword" class="form-control form-control-line" placeholder="New Password *" TextMode="Password" runat="server" ValidationGroup="pass"></asp:TextBox>   
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="newCpassword" ></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not same" ControlToValidate="newCpassword" ControlToCompare="newPassword" ></asp:CompareValidator>
                                </div>
                            </div>
   
                            
                            
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <asp:Button ID="chngPass" runat="server" class="btn btn-success" Text="Change Password" OnClick="chngPass_Click" OnClientClick="return confirm('Are you sure want to update password');" CausesValidation="True" ValidationGroup="pass" />
                                    
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
