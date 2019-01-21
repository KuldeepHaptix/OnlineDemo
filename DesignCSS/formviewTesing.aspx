<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="formviewTesing.aspx.cs" Inherits="formviewTesing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>


  <%-- copy from w3school--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<style>
* {
    box-sizing: border-box;
  }

.columns {
    float: left;
    width: 33.3%;
    padding: 8px;
}

.price {
    list-style-type: none;
    border: 1px solid #eee;
    margin: 0;
    padding: 0;
    -webkit-transition: 0.3s;
    transition: 0.3s;
}

.price:hover {
    box-shadow: 0 8px 12px 0 rgba(0,0,0,0.2)
}

.price  {
    background-color: #111;
    color: white;
    font-size: 25px;
}

.price td {
    border-bottom: 1px solid #eee;
    padding: 20px;
    text-align: center;
}
td{
    padding:10px 10px 10px 10px
}
.price .grey {
    background-color: #eee;
    font-size: 20px;
}

.button {
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 10px 25px;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
}

@media only screen and (max-width: 600px) {
    .columns {
        width: 100%;
    }
}
</style>
    <%--copy end--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
    <form id="form1"  runat="server">
        <div class="row" style="margin-top:30px;margin-left:400px;">
            <h3>Subscription Details</h3>
        </div>
      <div class="row" style="margin-top:80px;">
          <div class="col-lg-4" style="margin-left:200px;">
            <asp:FormView ID="FormView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Height="300px" DataSourceID="SqlDataSource1">
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />


        <ItemTemplate>
            <table>
      <tr class="header">
          
        <td class="header price " style="width:200px"><%# Eval("Name") %></td>
      </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Year") %></td>
                </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Emails") %></td>
                </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("Domain") %></td>
      </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("bandwidth") %></td>
      </tr>

       <tr>
       
        <td class="columns" style="width:200px">
            <asp:Button ID="btnsubmit" runat="server" Text="Subscribe" />
        </td>
      </tr>
    </table>           
        </ItemTemplate>

    </asp:FormView>
          </div>
          <div class="col-lg-4" style="margin-left:-200px;">
               <asp:FormView ID="FormView2" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Height="300px" DataSourceID="SqlDataSource1">
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="#006600" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />


        <ItemTemplate>
            <table>
      <tr class="header">
          
        <td class="header price " style="width:200px; background-color:darkgreen"><%# Eval("Name") %></td>
      </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Year") %></td>
                </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Emails") %></td>
                </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("Domain") %></td>
      </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("bandwidth") %></td>
      </tr>

       <tr>
       
        <td class="columns" style="width:200px">
            <asp:Button ID="btnsubmit" runat="server" Text="Subscribe" />
        </td>
      </tr>
    </table>           
        </ItemTemplate>

    </asp:FormView>
          </div>
             
          <div class="col-lg-4" style="margin-left:-200px;">
               <asp:FormView ID="FormView3" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Height="300px" DataSourceID="SqlDataSource1">
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
        <RowStyle BackColor="White" />


        <ItemTemplate>
            <table>
      <tr class="header">
          
        <td class="header price " style="width:200px"><%# Eval("Name") %></td>
      </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Year") %></td>
                </tr>
                <tr>

                    <td class="columns" style="width:200px"><%# Eval("Emails") %></td>
                </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("Domain") %></td>
      </tr>
      <tr>
       
        <td class="columns" style="width:200px"><%# Eval("bandwidth") %></td>
      </tr>

       <tr>
       
        <td class="columns" style="width:200px">
            <asp:Button ID="btnsubmit" runat="server" Text="Subscribe" />
        </td>
      </tr>
    </table>           
        </ItemTemplate>

    </asp:FormView>
          </div>
             
          </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Name], [Year], [emails], [Domain], [bandwidth] FROM [Subscrib]"></asp:SqlDataSource>
</form>
</div>
</asp:Content>

