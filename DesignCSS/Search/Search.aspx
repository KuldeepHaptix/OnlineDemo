<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search_Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--For Collapse-->
<%-- <%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>--%>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!--end-->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
       
    <div class="container">

         <div class="col-lg-12" style="text-align:center; margin-top:20px;"><h6>Search Result</h6></div>
        <div class="row"style="margin-top:30px;" >  <%--inquiry gridview--%>
            
            <div class="col-lg-12"><h5>Inquiry</h5>
            <asp:GridView ID="GridInquiry" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" CssClass="table table-light" Width="100%" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5" Font-Size="Small">
                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                <Columns>

                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" ReadOnly="True" InsertVisible="False" SortExpression="EmpID"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary"></asp:BoundField>
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation"></asp:BoundField>

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
            </asp:GridView>
                </div>
             <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>

        </div>
        <br />
          <div class="row"  >  <%--inquiry gridview--%>
            
            <div class="col-lg-12"><h5>Quotation</h5>
            <asp:GridView ID="GridView1" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" CssClass="table table-light" Width="100%" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5" Font-Size="Small">
                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                <Columns>

                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" ReadOnly="True" InsertVisible="False" SortExpression="EmpID"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary"></asp:BoundField>
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation"></asp:BoundField>

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
            </asp:GridView>
                </div>
             <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>

        </div>
        <br />
          <div class="row"  >  <%--inquiry gridview--%>
            
            <div class="col-lg-12"><h5>Customer</h5>
            <asp:GridView ID="GridView2" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" CssClass="table table-light" Width="100%" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5" Font-Size="Small">
                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                <Columns>

                    <asp:BoundField DataField="EmpID" HeaderText="EmpID" ReadOnly="True" InsertVisible="False" SortExpression="EmpID"></asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department"></asp:BoundField>
                    <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary"></asp:BoundField>
                    <asp:BoundField DataField="designation" HeaderText="designation" SortExpression="designation"></asp:BoundField>

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
            </asp:GridView>
                </div>
             <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>

        </div>
    </div>
    </form>
</asp:Content>

