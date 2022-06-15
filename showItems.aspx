<%@ Page Title="" Language="C#" MasterPageFile="~/distMaster.Master" AutoEventWireup="true" CodeBehind="showItems.aspx.cs" Inherits="pharmacolony.showItems" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12">
                    <h4 class="page-title">Add Items</h4>
                    <br />
                    <div class="row register-form">
                        <div class="col-md-5">
                            <div class="form-group">
                                <asp:TextBox ID="item" class="form-control" placeholder="Item Name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="item" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="price" class="form-control" placeholder="Price" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="Price" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="manufacturer" class="form-control" placeholder="Manufacturer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9" runat="server" ErrorMessage="Required" ControlToValidate="manufacturer" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="category" class="form-control" placeholder="Category" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator12" runat="server" ErrorMessage="Required" ControlToValidate="category" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>

                            <div class="form-group">
                                <asp:TextBox ID="gst" class="form-control" placeholder="GST" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="gst" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:TextBox ID="packaging" class="form-control" placeholder="Packaging" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="packaging" ValidationGroup="additem"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                    <asp:Button ID="btnadditem" CssClass="btn btn-default" runat="server" OnClick="lnkadd_Click" Text="Add Item" CausesValidation="True" ValidationGroup="additem" UseSubmitBehavior="True" />



                    <div class="col-md-12">
                        <br />
                        <br />
                        <h4 class="page-title">All Items Details</h4>
                        <br />
                        
                        <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="7" Style="display: flex" EditRowStyle-HorizontalAlign="Center" ForeColor="#ccffff" GridLines="Both">

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="id" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="ID" />

                                <asp:BoundField DataField="name" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Item Name" />
                                <asp:BoundField DataField="price" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Price" />
                                <asp:BoundField DataField="manufacturer" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Manufacturer" />
                                <asp:BoundField DataField="category" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Category" />
                                <asp:BoundField DataField="gst" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="GST" />
                                <asp:BoundField DataField="packaging" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Packaging" />





                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                        
                                        <asp:LinkButton ID="lnkEdit" CommandArgument='<%#Eval("id")%>' runat="server"
                                            CommandName="Edit" CssClass="btn btn-warning" OnClick="lnkEdit_Click">Edit</asp:LinkButton>

                                        &nbsp;
                        <asp:LinkButton ID="lnkDelete" OnClientClick="return confirm('Are you sure you want to delete this item ? ')"
                            CommandArgument='<%#Eval("id")%>' runat="server"
                            CommandName="Delete" CssClass="btn btn-danger" OnClick="lnkDelete_Click">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                            <EditRowStyle BackColor="#2461BF" Height="50px" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                            <HeaderStyle BackColor="#ccffff" Font-Bold="True" ForeColor="White" Height="30px" HorizontalAlign="Center" Wrap="false" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" Height="50px" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F5F7FB" />
                            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                            <SortedDescendingCellStyle BackColor="#E9EBEF" />
                            <SortedDescendingHeaderStyle BackColor="#4870BE" />

                        </asp:GridView>

                    </div>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>


</asp:Content>
