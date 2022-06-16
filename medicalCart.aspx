<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="medicalCart.aspx.cs" Inherits="pharmacolony.medicalCart" %>
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
                    <h4 class="page-title">Cart</h4>
                    <br />
                   <%-- <div class="row register-form">
                      
                    <div class="col-md-12">
                        <br />
                        <br />
                        <h4 class="page-title"></h4>
                        <br />--%>
                        
                        <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="7" Style="display: flex" EditRowStyle-HorizontalAlign="Center" ForeColor="#ccffff" GridLines="Both" >

                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:BoundField DataField="id" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="ID" />
                                <asp:BoundField DataField="distributorName" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Distributor" />

                                <asp:BoundField DataField="name" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Item Name" />
                                <asp:BoundField DataField="price" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Price" />
                                <asp:BoundField DataField="manufacturer" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Manufacturer" />
                                <asp:BoundField DataField="category" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Category" />
                                <asp:BoundField DataField="gst" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="GST" />
                                <asp:BoundField DataField="packaging" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Packaging" />
                                 <asp:BoundField DataField="quantity" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Quantity" />
                                <asp:BoundField DataField="total" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Total" />

                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>

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
                    
                  <div class="row"> 
                    <div style="float:right;margin-right:30px; ">
                      
                        <asp:Label ID="Grtotal" runat="server" Font-Bold="True"></asp:Label>
                       
                        </div><br /><br /> <div style="float:right;margin-right:25px;width: 170px; ">
                    <asp:LinkButton id="btnPlace" OnClick="btnPlace_Click" class="btn btn-info btn-block btn-rounded waves-effect waves-light" Text="Place Order"  runat="server"/>
                </div>
                      </div>
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
