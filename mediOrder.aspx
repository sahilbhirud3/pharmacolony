<%@ Page Title="" Language="C#" MasterPageFile="~/mediMaster.Master" AutoEventWireup="true" CodeBehind="mediOrder.aspx.cs" Inherits="pharmacolony.mediOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .btnLogout {
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

                    <asp:GridView ID="grid1" runat="server" AutoGenerateColumns="False" CellPadding="7" Style="display: flex; border: 0;" EditRowStyle-HorizontalAlign="Center" ForeColor="#ccffff" GridLines="Both" OnRowCommand="grid1_RowCommand" OnRowDataBound="grid1_RowDataBound">

                        <AlternatingRowStyle BackColor="White" />
                        <Columns>

                            <asp:BoundField DataField="id" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Order ID" />
                            <asp:BoundField DataField="datetime" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Order Date & Time" />

                            <asp:BoundField DataField="gtotal" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Grand Total" />
                            <asp:BoundField DataField="status" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center" HeaderText="Payment Status" />

                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>

                                    <asp:LinkButton ID="lnkView" CommandArgument='<%#Eval("id")%>' runat="server" CommandName="View" CssClass="btn btn-primary" OnClick="lnkView_Click">View</asp:LinkButton>


                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment" ItemStyle-Width="150px" ItemStyle-Wrap="false" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <%--                                    <asp:LinkButton ID="lnkPay" CommandArgument='<%#Eval("id")%>' runat="server" CommandName="View" CssClass="btn btn-primary" OnClick="lnkPay_Click">Pay</asp:LinkButton>--%>
                                    <asp:LinkButton ID="lnkPay" CommandArgument='<%#Container.DataItemIndex%>' runat="server"
                                        CommandName="Pay" CssClass="btn btn-success">Pay</asp:LinkButton>

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
        <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

        <script>
            function OpenPaymentWindow(key, amountInSubunits, currency, name, descritpion, imageLogo, orderId, profileName, profileEmail, profileMobile, notes, id) {
                notes = $.parseJSON(notes);
                var options = {
                    "key": key, // Enter the Key ID generated from the Dashboard
                    "amount": amountInSubunits, // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                    "currency": currency,
                    "name": name,
                    "description": descritpion,
                    "image": imageLogo,
                    "order_id": orderId, //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
                    "handler": function (response) {
                        window.location.href = "Success.aspx?id=" + id + "&orderId=" + response.razorpay_order_id + "&paymentId=" + response.razorpay_payment_id;


                        //alert(response.razorpay_payment_id);
                        //alert(response.razorpay_order_id);
                        //alert(response.razorpay_signature)
                    },
                    "prefill": {
                        "name": profileName,
                        "email": profileEmail,
                        "contact": profileMobile
                    },
                    "notes": notes,
                    "theme": {
                        "color": "#F37254"
                    }
                };
                var rzp1 = new Razorpay(options);
                rzp1.open();
                rzp1.on('payment.failed', function (response) {
                    console.log(response.error);
                    alert("Oops, something went wrong and payment failed. Please try again later");
                });
            }

    </script>
</asp:Content>

