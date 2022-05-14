<%@ Page Title="" Language="C#"  MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="approveMed.aspx.cs" Inherits="pharmacolony.approveMed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  

 <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-12">
                        
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />

         <%--                  <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" >  
     <AlternatingRowStyle BackColor="White" />  
     <columns>  
         <asp:TemplateField HeaderText="Licence Number">  
             <ItemTemplate>  
                 <asp:Label ID="licno" runat="server" Text='<%#Bind("licno") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Medical Name">  
             <ItemTemplate>  
                 <asp:Label ID="name" runat="server" Text='<%#Bind("name") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="First Name">  
             <ItemTemplate>  
                 <asp:Label ID="fname" runat="server" Text='<%#Bind("fname") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="Last Name">  
             <ItemTemplate>  
                 <asp:Label ID="lname" runat="server" Text='<%#Bind("lname") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
          <asp:TemplateField HeaderText="Email">  
             <ItemTemplate>  
                 <asp:Label ID="email" runat="server" Text='<%#Bind("email") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
          <asp:TemplateField HeaderText="Contact">  
             <ItemTemplate>  
                 <asp:Label ID="contact" runat="server" Text='<%#Bind("contact") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
          <asp:TemplateField HeaderText="Address">  
             <ItemTemplate>  
                 <asp:Label ID="address" runat="server" Text='<%#Bind("address") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
         <asp:TemplateField HeaderText="City">  
             <ItemTemplate>  
                 <asp:Label ID="city" runat="server" Text='<%#Bind("city") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
          <asp:TemplateField HeaderText="State">  
             <ItemTemplate>  
                 <asp:Label ID="state" runat="server" Text='<%#Bind("state") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
          <asp:TemplateField HeaderText="status">  
             <ItemTemplate>  
                 <asp:Label ID="status" runat="server" Text='<%#Bind("status") %>'></asp:Label>  
             </ItemTemplate>  
         </asp:TemplateField>  
    </columns>
     <EditRowStyle BackColor="#2461BF" />  
     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
     <RowStyle BackColor="#EFF3FB" />  
     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
     <SortedAscendingCellStyle BackColor="#F5F7FB" />  
     <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
     <SortedDescendingCellStyle BackColor="#E9EBEF" />  
     <SortedDescendingHeaderStyle BackColor="#4870BE" />  
 </asp:GridView> --%>

                        <h4 class="page-title">Welcome to My Admin</h4>
                        <ol class="breadcrumb">
                            <li><a href="#">Dashboard</a></li>
                        </ol>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="white-box">
                            <div class="row row-in">
                                <div class="col-lg-3 col-sm-6">
                                    <div class="col-in text-center">
                                        <h5 class="text-danger">Chrome</h5>
                                        <h3 class="counter">5645</h3>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="col-in text-center b-r-none">
                                        <h5 class="text-muted text-warning">Mozila</h5>
                                        <h3 class="counter">4250</h3>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="col-in text-center">
                                        <h5 class="text-muted text-purple">Safari</h5>
                                        <h3 class="counter">3450</h3>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-sm-6">
                                    <div class="col-in text-center b-0">
                                        <h5 class="text-info">Explorer</h5>
                                        <h3 class="counter">2500</h3>
                                    </div>
                                </div>
                            </div>
                            <div id="morris-area-chart" style="height: 345px;"></div>
                        </div>
                    </div>
                </div>
                <!-- row -->
                <div class="row">
                    <div class="col-md-6 col-xs-12 col-sm-12">
                        <div class="white-box">
                            <h3>To Do List</h3>
                            <ul class="list-task list-group" data-role="tasklist">
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputSchedule" name="inputCheckboxesSchedule">
                                        <label for="inputSchedule"> <span>Schedule meeting</span> </label>
                                    </div>
                                </li>
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputCall" name="inputCheckboxesCall">
                                        <label for="inputCall"> <span>Call clients for follow-up</span> <span
                                                class="label label-danger">Today</span> </label>
                                    </div>
                                </li>
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputBook" name="inputCheckboxesBook">
                                        <label for="inputBook"> <span>Book flight for holiday</span> </label>
                                    </div>
                                </li>
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputForward" name="inputCheckboxesForward">
                                        <label for="inputForward"> <span>Forward important tasks</span> <span
                                                class="label label-warning">2 weeks</span> </label>
                                    </div>
                                </li>
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputRecieve" name="inputCheckboxesRecieve">
                                        <label for="inputRecieve"> <span>Recieve shipment</span> </label>
                                    </div>
                                </li>
                                <li class="list-group-item" data-role="task">
                                    <div class="checkbox checkbox-info">
                                        <input type="checkbox" id="inputForward2" name="inputCheckboxesd">
                                        <label for="inputForward2"> <span>Important tasks</span> <span
                                                class="label label-success">2 weeks</span> </label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6 col-xs-12 col-sm-12">
                        <div class="white-box">
                            <h3>You have 5 new messages</h3>
                            <div class="message-center">
                                <a href="#">
                                    <div class="user-img">
                                        <img src="images/users/pawandeep.jpg" alt="user" class="img-circle"> <span
                                            class="profile-status online pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Pavan kumar</h5>
                                        <span class="mail-desc">Just see the my admin!</span> <span class="time">9:30
                                            AM</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="user-img"> <img src="images/users/sonu.jpg" alt="user"
                                            class="img-circle"> <span class="profile-status busy pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Sonu Nigam</h5>
                                        <span class="mail-desc">I've sung a song! See you at</span> <span
                                            class="time">9:10 AM</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="user-img"> <img src="images/users/arijit.jpg" alt="user"
                                            class="img-circle"> <span class="profile-status away pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Arijit Sinh</h5>
                                        <span class="mail-desc">I am a singer!</span> <span class="time">9:08 AM</span>
                                    </div>
                                </a>
                                <a href="#">
                                    <div class="user-img"> <img src="images/users/genu.jpg" alt="user"
                                            class="img-circle"> <span class="profile-status online pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Genelia Deshmukh</h5>
                                        <span class="mail-desc">I love to do acting and dancing</span> <span
                                            class="time">9:08 AM</span>
                                    </div>
                                </a>
                                <a href="#" class="b-none">
                                    <div class="user-img"> <img src="images/users/pawandeep.jpg" alt="user"
                                            class="img-circle"> <span class="profile-status offline pull-right"></span>
                                    </div>
                                    <div class="mail-contnet">
                                        <h5>Pavan kumar</h5>
                                        <span class="mail-desc">Just see the my admin!</span> <span class="time">9:02
                                            AM</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div> 

</asp:Content>


