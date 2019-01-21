<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CustomerFollowupList.aspx.cs" Inherits="CustomerFollowup_CustomerFollowupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                            <h3>Customer Followup List</h3>
                        </div>
                        <div class="col-lg-3">
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
                        <asp:Button ID="btnfollowup" class="btn btn-light" runat="server" Text="Followup" OnClick="btnfollowup_Click"   />

                        </div>
                       
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-6">
                            <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12" style="overflow:auto; top: 0px; left: 0px;">
                            <asp:GridView Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GridView1" CssClass="table" runat="server" Width="100%" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="5" Font-Size="Small" AutoGenerateSelectButton="True">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code"></asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                                    <asp:BoundField DataField="CurrencyID" HeaderText="CurrencyID" SortExpression="CurrencyID"></asp:BoundField>
                                    <asp:BoundField DataField="HSNCode" HeaderText="HSNCode" SortExpression="HSNCode"></asp:BoundField>

                                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                                    <asp:BoundField DataField="Specification" HeaderText="Specification" SortExpression="Specification" />

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
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                        </div>

                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>
</asp:Content>

