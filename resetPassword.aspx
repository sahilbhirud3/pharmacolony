<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="pharmacolony.resetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js" rel="stylesheet" />
    <link href="css/forgotPass.css" rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet" />
    <link rel="icon" href="img/favi1.png" type="png" />
    <script type="text/javascript">
    function Showalert() {
        alert('Your password has been updated successfully');
        window.close();
    }
    function Showalert1() {
        alert('Reset password link has expired.It was for one time use only');
        window.close();
    }
</script>
    <title>pharmacolony</title>
</head>
<body>
    
        <form id="form2" runat="server">
            <div class="container padding-bottom-3x mb-2 mt-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-md-10">
                        <div class="forgot">
                            <h2>Set Up Your New Password </h2>
                        </div>
                        <div class="card-body card mt-4">
                            <div class="form-group">
                                <label for="email-for-pass">Enter New Password</label>
                                <asp:TextBox ID="password" class="form-control" placeholder="Enter Password *" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Required" ControlToValidate="password"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Minimum eight characters, at least one letter and one number:" ValidationExpression='^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$' ControlToValidate="password"></asp:RegularExpressionValidator>

                            </div>
                            <div class="form-group">
                                <label for="email-for-pass">Enter Confirm Password</label>
                                <asp:TextBox ID="cPassword" class="form-control" placeholder="Confirm Password *" TextMode="Password" runat="server"></asp:TextBox>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password not same" ControlToValidate="cPassword" ControlToCompare="password"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Required" ControlToValidate="cPassword"></asp:RequiredFieldValidator>
                            </div>

                        </div>

                        <div class="card-footer">
                            <asp:Button ID="btnChangePwd" class="btn btn-success" runat="server" Text="Change Password" OnClick="btnChangePwd_Click" />

                        </div>
                    </div>
                </div>

            </div>

        </form>

</body>
</html>
