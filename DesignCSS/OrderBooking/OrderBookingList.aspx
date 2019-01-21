<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="OrderBookingList.aspx.cs" Inherits="OrderBooking_OrderBookingList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <div class="container" style="margin-top:30px;">  
    <div class="row">
      <div class="col-sm-2">
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="#">By Customer Invoice</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">By Invoice No.</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">By Date</a>
                </li>
            </ul> 
        </div>
        <div class="col-sm-10">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-5">
                            <h3>Order Booking</h3>
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-2">
                            <asp:Button ID="btnNewInq" class="btn btn-light" runat="server" Text="+ New Order" OnClick="btnNewInq_Click"  />
                        </div>
                        <div class="col-lg-2">
                            <button type="button" style="margin-left:15px;" class="btn btn-light">+ Generate Report</button>
                        </div>
                        
                        
                    </div>
                
                    <br />
                    <hr />
                    <br />

                    <div class="row">
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Edit</button>
                        </div>
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Delete</button>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-5">
                            <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12" style="overflow:auto;">
                           
                                <asp:GridView ShowHeaderWhenEmpty="true" DataKeyNames="OrderID" Style="overflow: scroll; box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GvOrder" CssClass="table" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"  AllowPaging="True" PageSize="5" Font-Size="Small" OnRowDeleting="GvOrder_RowDeleting" OnRowCommand="GvOrder_RowCommand">
                                    <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                    <Columns>

                                            <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <%-- <asp:LinkButton ID="lnkselect" CommandName="Select" runat="server"  CommandArgument='<%# Eval("SIID" )%>' Text="Select"></asp:LinkButton>--%>
                                               <asp:LinkButton ID="lnlEdit" CommandName="RecordEdit" CommandArgument='<%# Eval("OrderID" )%>' runat="server">Edit</asp:LinkButton>
                                                  <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>

                                            </ItemTemplate>
                                          
                                        </asp:TemplateField>
                                           
                                         <asp:TemplateField Visible="false" HeaderText="SIID">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblSIID" runat="server" Text='<%# Eval("OrderID") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         <asp:TemplateField HeaderText="SalesDate">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblSalesDate" runat="server" Text='<%# Eval("SalesDate") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         <asp:TemplateField HeaderText="OrderNo">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblSaleCode" runat="server" Text='<%# Eval("OrderCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                         <asp:TemplateField HeaderText="YourInvoiceNo">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblYourInvoiceNo" runat="server" Text='<%# Eval("CustInvoiceNo") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                         <asp:TemplateField HeaderText="CustomerName">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblCustomerName" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                         <asp:TemplateField HeaderText="TotalAmount">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                          <asp:TemplateField HeaderText="NetAmount">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblNetAmount" runat="server" Text='<%# Eval("NetAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PaidAmount">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblpaidamount" runat="server" Text='<%# Eval("PaidAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PendingAmount">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblpending" runat="server" Text='<%# Eval("PendingAmount") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ContactPerson">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblContactPerson" runat="server" Text='<%# Eval("ContactPerson") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            
                                         <asp:TemplateField HeaderText="Mobile">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                    <asp:Label ID="lblemail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                       
                                  

                                </Columns>

                                <EditRowStyle BackColor="#999999"></EditRowStyle>

                                <FooterStyle BackColor="#578eea" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" Font-Size="Small"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" ForeColor="#0066ff"></PagerStyle>



                                <RowStyle BackColor="white" ForeColor="Black"></RowStyle>

                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                                <EmptyDataTemplate> <div class="text-left">No records found.</div></EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SaleskitCRMConnectionString %>' SelectCommand="SELECT [SalesCode], [SalesDate], [CustomerID], [TotalAmount], [PaidAmount], [ISCustomer], [IsPaid], [CreditOutstanding], [RemainingCredit], [CustomerBankName], [ContactPerson] FROM [SalesInvoice]"></asp:SqlDataSource>
                        </div>

                    </div>
                </form> 
     </div>
        

        </div>
    </div>
</div>
</asp:Content>

