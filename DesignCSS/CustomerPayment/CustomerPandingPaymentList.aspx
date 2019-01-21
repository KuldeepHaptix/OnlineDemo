<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CustomerPandingPaymentList.aspx.cs" Inherits="CustomerPayment_CustomerPandingPaymentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container-fluid" style="margin-top:30px;">  
    <div class="row">
     
        <div class="col-sm-11">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-6">
                            <h3>Customer Panding Payment List</h3>
                        </div>
                       
                      
                       
                        <div class="col-lg-1">
                        </div>

                        
                    </div>
                
                    <br/>
                    <hr/>
                   
                    <div class="row">
                       
                        <div class="col-sm-3" style="margin-left:20px;">
                       <asp:Button ID="brnrefresh" class="btn btn-info" runat="server" Text="Refresh" />

                        </div>
                        <div class="col-sm-2">
                          <asp:Label ID="lbltotal" runat="server" CssClass="mr-sm-2" ForeColor="#2b5555" Text="Total Panding Amount:"></asp:Label>

                        </div>
                        <div class="col-sm-4">
                        <asp:Label ID="lbltotalPAmount" runat="server" CssClass="mr-sm-2" ForeColor="#990000" Text="20522:"></asp:Label>

                        </div>
                    </div>
               
                    <br />
                    <div class="row">
                        <div class="col-lg-9">
                        <div class="col-lg-12" style="overflow:auto; ">
                            <asp:GridView ShowHeaderWhenEmpty="True" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GridView1" CssClass="table" runat="server" Width="100%" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource7" AllowPaging="True" PageSize="5" Font-Size="Small">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="SalesCode" HeaderText="SalesCode" SortExpression="SalesCode"></asp:BoundField>
                                    <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount"></asp:BoundField>
                                    <asp:BoundField DataField="NetAmount" HeaderText="NetAmount" SortExpression="NetAmount"></asp:BoundField>
                                    <asp:BoundField DataField="PaidAmount" HeaderText="PaidAmount" SortExpression="PaidAmount"></asp:BoundField>

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

                                <EmptyDataTemplate>
                                    <div class="text-left">No records found</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [SalesCode], [TotalAmount], [NetAmount], [PaidAmount] FROM [SalesInvoice]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [LeadID], [NextFollowupDate], [FollowupBy], [Remarks] FROM [LeadFollowUp]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [QuotationID], [FollowupDate], [FollowupBy], [Remarks] FROM [QuotationFollowup]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                        </div>
                    </div>
                        <div class="col-lg-3">
                              <div class="col-lg-12" style="overflow:auto; ">
                            <asp:GridView ShowHeaderWhenEmpty="True" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GridView2" CssClass="table" runat="server" Width="100%" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" PageSize="5" Font-Size="Small">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="LeadID" HeaderText="LeadID" SortExpression="LeadID"></asp:BoundField>
                                    <asp:BoundField DataField="NextFollowupDate" HeaderText="NextFollowupDate" SortExpression="NextFollowupDate"></asp:BoundField>
                                    <asp:BoundField DataField="FollowupBy" HeaderText="FollowupBy" SortExpression="FollowupBy"></asp:BoundField>
                                    <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks"></asp:BoundField>

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

                                <EmptyDataTemplate>
                                    <div class="text-left">No records found</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [LeadID], [NextFollowupDate], [FollowupBy], [Remarks] FROM [LeadFollowUp]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [QuotationID], [FollowupDate], [FollowupBy], [Remarks] FROM [QuotationFollowup]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                        </div>

                        </div>
                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>

</asp:Content>

