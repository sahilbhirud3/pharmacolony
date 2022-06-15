<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediDash.aspx.cs" Inherits="pharmacolony.mediDash" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <link href="select2-4.1.0-rc.0/select2-4.1.0-rc.0/dist/css/select2.css" rel="stylesheet" />
    <link href="select2-4.1.0-rc.0/select2-4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <script src="select2-4.1.0-rc.0/select2-4.1.0-rc.0/dist/js/select2.js"></script>
    <script src="select2-4.1.0-rc.0/select2-4.1.0-rc.0/dist/js/select2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                
                   


                    <div class="col-md-12">
                        <br />
                        <br />
                        <h4 class="page-title">All Items Details</h4>
                        <br />
                        <asp:DropDownList ID="DropDownList1"  runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="name"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:connectionString %>" SelectCommand="SELECT [name] FROM [item]"></asp:SqlDataSource>
                       <script type="text/javascript">
                           $(document).ready(function () { $('#DropDownlist1').select2(); });

                       </script>
    
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
                                            CommandName="Edit" CssClass="btn btn-warning" >Edit</asp:LinkButton>

                                        &nbsp;
                        <asp:LinkButton ID="lnkDelete" OnClientClick="return confirm('Are you sure you want to delete this item ? ')"
                            CommandArgument='<%#Eval("id")%>' runat="server"
                            CommandName="Delete" CssClass="btn btn-danger" >Delete</asp:LinkButton>
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
            
            <!-- /.row -->

            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    
</asp:Content>
