<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotPassword.aspx.cs" Inherits="pharmacolony.forgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js" rel="stylesheet" />
    <link href="css/forgotPass.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" />
    <link rel="icon" href="img/favi1.png" type="png" />

    <title>pharmacolony</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container padding-bottom-3x mb-2 mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="forgot">

                            <h2>Forgot your password?</h2>
                            <ol class="list-unstyled">
                                <li><span class="text-primary text-medium">1. </span>Enter your email address below.</li>
                                <li><span class="text-primary text-medium">2. </span>Our System will send you a temporary link</li>
                                <li><span class="text-primary text-medium">3. </span>Use the link to reset your password</li>
                            </ol>

                        </div>


                        <div class="card-body card mt-4">
                            <div class="form-group">
                                <label for="email-for-pass">Enter your email address</label>
                                <asp:TextBox ID="email" class="form-control" placeholder="Email Address *" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="email"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic" ErrorMessage="Invalid Email" ControlToValidate="email" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"></asp:RegularExpressionValidator>

                                <small class="form-text text-muted">Enter the email address you used during the registration on PharmaColony. Then we'll email a link to this address.</small>
                            </div>
                            <div class="form-group">
                                <label for="email-for-pass">Enter your License Number</label>
                                <asp:TextBox ID="licenseNumber" class="form-control" placeholder="License Number *" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Required" Display="Dynamic" ControlToValidate="licenseNumber"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="card-footer">

                            <asp:Button ID="Button1" class="btn btn-success" runat="server" Text="Reset Password" OnClick="Button1_Click" />
                            <asp:Button ID="Button2" class="btn btn-danger" runat="server" Text="Back to Login" CausesValidation="false" PostBackUrl="medicalLogin.aspx" />

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>
