<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CustomerPaymentList.aspx.cs" Inherits="CustomerPayment_CustomerPaymentList" %>

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

     <div class="container" style="margin-top:30px;">  
    <div class="row">
     
        <div class="col-sm-10">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-5">
                            <h3>Customer Payment List</h3>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button ID="btnNewItem" class="btn btn-light" runat="server" Text="+ New Payment" OnClick="btnNewItem_Click"  />
                        </div>
                        <div class="col-lg-1">
                           
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-1">
                        </div>

                        <!-- The Modal -->
                       
                        <!-- ENd modal -->
                    </div>
                
                    <br/>
                    <hr/>
                    <br/>

                    <div class="row">
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Edit</button>
                        </div>
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Delete</button>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-6">
                            <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <asp:GridView ShowHeaderWhenEmpty="true" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GridView1" Width="100%" CssClass="table" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" AllowPaging="True" PageSize="5" Font-Size="Small">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="SalesCode" HeaderText="SalesCode" SortExpression="SalesCode"></asp:BoundField>
                                    <asp:BoundField DataField="SalesDate" HeaderText="SalesDate" SortExpression="SalesDate"></asp:BoundField>
                                    <asp:BoundField DataField="DCDate" HeaderText="DCDate" SortExpression="DCDate"></asp:BoundField>
                                    <asp:BoundField DataField="NetAmount" HeaderText="NetAmount" SortExpression="NetAmount"></asp:BoundField>
                                    <asp:BoundField DataField="Narration" HeaderText="Narration" SortExpression="Narration"></asp:BoundField>

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
                            <div>No Record Found</div>
                        </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [SalesCode], [SalesDate], [DCDate], [NetAmount], [Narration] FROM [SalesInvoice]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                        </div>

                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>

</asp:Content>

