<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editItem.aspx.cs" MasterPageFile="~/distMaster.Master" Inherits="pharmacolony.addItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12">
                    <h4 class="page-title">Edit Items</h4>
                    <br />
                    <div class="row register-form">
                        <div class="col-md-6">


                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_id">ID:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" ID="txtid" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_id">DLIC:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" ID="txtdLic" runat="server" Enabled="False"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_name">Item Name<span style="color: red;">*</span>:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" ID="name" placeholder="Item Name" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator6" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="name"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_price">Price<span style="color: red;">*</span>:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" placeholder="Price" ID="price" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator5" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="price"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_manufacturer">Manufacturer<span style="color: red;">*</span>:</label>                                     
                                <div class="control-label col-sm-8"> 
                                    <asp:TextBox CssClass="form-control" placeholder="Manufacturer" ID="manufacturer" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="manufacturer"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_category">Category<span style="color: red;">*</span>:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" placeholder="Category" ID="category" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="category"></asp:RequiredFieldValidator>
                                </div>
                            </div>


                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_contact">GST<span style="color: red;">*</span>:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" placeholder="GST" ID="gst" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="gst"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                            <div class="form-group col-sm-12">
                                <label class="control-label col-sm-4" for="MainContent_contact">Packaging<span style="color: red;">*</span>:</label>
                                <div class="control-label col-sm-8">
                                    <asp:TextBox CssClass="form-control" placeholder="Packaging" ID="packaging" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ForeColor="red" ErrorMessage="RequiredFieldValidator" ControlToValidate="packaging"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>


                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button ID="btnsubmit" runat="server" class="btn btn-primary" Font-Bold="true" Text="Update" type="submit" OnClick="btnsubmit_Click" />
                                <asp:Button ID="btnback" runat="server" class="btn btn-default" Font-Bold="true" Text="Back" OnClick="btnback_Click" CausesValidation="False" />
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Label ID="lblmessage" runat="server" CssClass="text-center" ForeColor="Black"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>
