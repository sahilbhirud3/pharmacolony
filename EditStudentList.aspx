<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStudentList.aspx.cs" Inherits="Demo1.EditStudentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="form-horizontal" style="margin: 15px;" >
        
        <h2>Edit Student Records</h2>

<%--        <div class="form-horizontal">--%>
         <div class="form-group">

             <div class="form-group">
            <label class="control-label col-sm-2" for="MainContent_id">ID:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" ID="txtid" runat="server" Enabled="False"></asp:TextBox>
            </div>
         </div>

        <div class="form-group col-sm-12">
            <label class="control-label col-sm-2" for="MainContent_fname">First Name<span style="color:red;">*</span>:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="First Name" ID="fname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="fname"></asp:RequiredFieldValidator>
            </div>
         </div>

       <%-- <div class="form-group col-sm-12">
            <label class="control-label col-sm-2" for="MainContent_mname">Middle Name<span style="color:red;">*</span>:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Middle Name" ID="mname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="mname"></asp:RequiredFieldValidator>
            </div>
        </div>--%>

        <div class="form-group col-sm-12">
            <label class="control-label col-sm-2" for="MainContent_lname">Last Name<span style="color:red;">*</span>:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Last Name" ID="lname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="lname"></asp:RequiredFieldValidator>
                </div>
        </div>

         <div class="form-group">
            <label class="control-label col-sm-2" for="MainContent_email">Email<span style="color:red;">*</span>:</label>
             <div class="col-sm-10">
             <asp:TextBox CssClass="form-control" placeholder="Email" ID="email" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"  ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="email"></asp:RequiredFieldValidator> </div>
        </div>
        </div>

        <div class="form-group col-sm-12">
            <label class="control-label col-sm-2" for="MainContent_contact">Contact No<span style="color:red;">*</span>:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Contact No" ID="contact" runat="server" TextMode="Phone"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="contact"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group col-sm-12">
            <label class="control-label col-sm-2" for="MainContent_salary" >Salary:</label>
            <div class="control-label col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Salary" ID="salary" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="MainContent_bmale" class="control-label col-sm-2">Gender:</label>
            <div class="col-sm-10">
                <asp:RadioButton ID="bmale" GroupName="gender" runat="server" Text="Male" />
                <asp:RadioButton ID="bfemale" GroupName="gender" runat="server" Text="Female" />
            </div>
        </div>

        <%--<div class="form-group">
            <label for="MainContent_address" class="control-label col-sm-2">Address:</label>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" ID="address" placeholder="Address" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
        </div>--%>

        <div class="form-group">
            <label for="MainContent_citylist" class="control-label col-sm-2" runat="server">City:</label>
            <div class="col-sm-10"> 
            <asp:DropDownList ID="citylist" runat="server" CssClass="form-control">
                    <%--  <asp:ListItem Value="Nashik"></asp:ListItem>
                    <asp:ListItem Value="Pune"></asp:ListItem>
                    <asp:ListItem Value="Mumbai"></asp:ListItem>
                    <asp:ListItem Value="Nagpur"></asp:ListItem>
                    <asp:ListItem Value="Thane"></asp:ListItem>--%>
                </asp:DropDownList>
            </div>
        </div>

        <div class="form-group">
            <label for="MainContent_countrylist" class="control-label col-sm-2">Country:</label>
            <div class="col-sm-10">
                <asp:DropDownList ID="countrylist" runat="server" CssClass="form-control">
                    <asp:ListItem Value="India"></asp:ListItem>
                    <asp:ListItem Value="America"></asp:ListItem>
                    <asp:ListItem Value="Australia"></asp:ListItem>
                    <asp:ListItem Value="Brazil"></asp:ListItem>
                    <asp:ListItem Value="Israil"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

       <%-- <div class="form-group">
            <label for="MainContent_pin" class="control-label col-sm-2">Pincode:</label>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" ID="pin" placeholder="Pincode" MaxLength="6" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="MainContent_aadhar" class="control-label col-sm-2">Aadhar No.<span style="color:red;">*</span>:</label>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" ID="aadhar" placeholder="Aadhar No." MaxLength="12" runat="server"></asp:TextBox>
                </div>
        </div>--%>

        <div class="form-group">
            <label for="MainContent_date" class="control-label col-sm-2">Birth Date:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="date" cssclass="form-control" placeholder="Date of Birth" MaxLength="6" TextMode="Date" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <label for="MainContent_courses" class="control-label col-sm-2">Courses:</label>
            <div class="col-sm-10">
                <asp:CheckBoxList ID="courses" runat="server">
                    <%--<asp:ListItem Value="BCS"></asp:ListItem>
                    <asp:ListItem Value="MCA"></asp:ListItem>
                    <asp:ListItem Value="BCOM"></asp:ListItem>
                    <asp:ListItem Value="MCOM"></asp:ListItem>
                    <asp:ListItem Value="MXS"></asp:ListItem>
                    <asp:ListItem Value="MCA"></asp:ListItem>--%>
                </asp:CheckBoxList>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary" Font-Bold="true" text="Update" type="submit" onclick="btnsubmit_Click"/>
                <asp:Button ID="btnback" runat="server" class="btn btn-default"  Font-Bold="true" text="Back" OnClick="btnback_Click" CausesValidation="False" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Label ID="lblmessage" runat="server" CssClass="text-center" ForeColor="Black" ></asp:Label>  
            </div>
        </div>

        </div>
<%--        </div>--%>

</asp:Content>
