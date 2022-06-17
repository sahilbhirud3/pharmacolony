<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediOrder.aspx.cs" Inherits="pharmacolony.mediOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
.btnLogout{
    margin-top: 10%;
    border: none;
    border-radius: 1rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
     
    cursor: pointer;
    }
            </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12">
                    <h4 class="page-title">My Orders</h4>
                    <br />
                   <%-- <div class="row register-form">
                      
                    <div class="col-md-12">
                        <br />
                        <br />
                        <h4 class="page-title"></h4>
                        <br />--%>
                        
                        <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="7" Style="display: flex;border: 0;" EditRowStyle-HorizontalAlign="Center" ForeColor="#ccffff" GridLines="Both" >

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="id" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Order ID" />
                                <asp:BoundField DataField="datetime" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Order Date & Time" />

                                <asp:BoundField DataField="gtotal" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Grand Total" />
<%--                                <asp:BoundField DataField="status" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Order Status" />--%>

                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

                                      <asp:LinkButton ID="lnkView" CommandArgument='<%#Eval("id")%>' runat="server"  CommandName="View" CssClass="btn btn-primary" OnClick="lnkView_Click">View</asp:LinkButton>

                                  
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
               
                <%--</div>
                </div>--%>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>

</asp:Content>

