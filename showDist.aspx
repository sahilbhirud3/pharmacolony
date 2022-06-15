<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="showDist.aspx.cs" Inherits="pharmacolony.showDist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-12">
                        <h4 class="page-title">All Distributor Details</h4>
                        <br />

                           <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="7" EditRowStyle-HorizontalAlign="Center" ForeColor="#ccffff" GridLines="Both" >  
     
                               <AlternatingRowStyle BackColor="White"/>  
      <Columns>
               
                <asp:BoundField DataField="distributorName" HeaderText="Distributor Name" />
           <asp:BoundField DataField="licNo" HeaderText="License No" />
                <asp:BoundField DataField="firstName" HeaderText="First Name" />
                <asp:BoundField DataField="lastName" HeaderText="Last Name" />
            <asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="contact" HeaderText="Contact No" />
                <asp:BoundField DataField="address" HeaderText="Address" />
          <asp:BoundField DataField="state" HeaderText="State" />
                <asp:BoundField DataField="city" HeaderText="City" />
                
           
               
        
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                   
                     
                        <asp:LinkButton ID="lnkDelete" OnClientClick="return confirm('Are you sure you want to delete this student ? ')"
                            CommandArgument='<%#Eval("licNo")%>' runat="server" 
                            CommandName="Delete" CssClass="btn-danger" OnClick="lnkDelete_Click">Delete</asp:LinkButton>
                      
                    </ItemTemplate>
                </asp:TemplateField>
        
                </Columns>
     <EditRowStyle BackColor="#2461BF" Height="50px"/>  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#ccffff" Font-Bold="True" ForeColor="White" Height="30px" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" Height="50px" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
                            
 </asp:GridView> 

                       
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
             
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div> 
</asp:Content>
