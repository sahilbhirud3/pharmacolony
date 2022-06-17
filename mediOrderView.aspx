<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediOrderView.aspx.cs" Inherits="pharmacolony.mediOrderView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.btnBack{
    margin-top: 5%;
    margin-right:1%;
    border: none;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
     width: 120px;
    cursor: pointer;
    }
            </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-12">
                    <h4 class="page-title">Order Details</h4>
                    <br /> <div class="col-md-12"  >
                   <div class="col-md-2"> <h5><asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Order ID" ></asp:Label></h5></div>
                    <div class="col-md-2"><h6><asp:Label ID="order_details" runat="server" ></asp:Label></h6></div>
                    <div class="col-md-2"> <h5><asp:Label ID="Label3" runat="server" Font-Bold="true" Text="Date Time"></asp:Label></h5> </div>        
                    <div class="col-md-2"><h6><asp:Label ID="order_details1" runat="server" ></asp:Label></h6></div>
                    </div>
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

                                <asp:BoundField DataField="id" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Item ID" />
                                <asp:BoundField DataField="name" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Item Name" />
                                <asp:BoundField DataField="distributorName" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Distributor" />
                                <asp:BoundField DataField="manufacturer" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Manufacturer" />
                                <asp:BoundField DataField="category" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Category" />
                                <asp:BoundField DataField="packaging" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Packaging" />
                                <asp:BoundField DataField="gst" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="GST" />
                                <asp:BoundField DataField="price" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Price" />
                                <asp:BoundField DataField="quantity" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Quantity" />
                                <asp:BoundField DataField="total" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Total" />
                                <asp:BoundField DataField="status" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Status" />

                                
                              

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
                       
                        </div><br /><br /> <div style="float:right;MARGIN-RIGHT: inherit;width: 170px; ">
                    <asp:Button id="btnBack" class="btnBack" Text="Back" PostBackUrl="~/mediOrder.aspx" runat="server"/>
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