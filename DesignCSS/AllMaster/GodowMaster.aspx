<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="GodowMaster.aspx.cs" Inherits="AllMaster_GodowMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-4"><h5>Godown Master</h5></div>
                <div class="col-sm-3"></div>
            </div>
            <br />
            <div class="row">
                  <div class="col-sm-4"></div>
                    <div class="col-lg-1">
                        <button type="button" id="btn_Add" data-toggle="collapse" data-target="#AddEdit" class="btn btn-light">Add</button>
                    </div>
                    <div class="col-lg-1">
                        <button type="button" id="btn_Edit" data-toggle="collapse" data-target="#AddEdit" class="btn btn-light">Edit</button>
                    </div>
                    <div class="col-lg-1">
                        <button type="button" id="btn_Delete" class="btn btn-light">Delete</button>
                    </div>
                  <div class="col-sm-4"></div>
            </div>
            <br />
            <div id="AddEdit" class="collapse">
                <div class="row">

                    <div class="col-lg-3"></div>
                    <div class="col-lg-2" >
                        <asp:Label ID="lblName"  runat="server" Text="Name:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtNAme" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    
                   
                </div>
             <br />
                <div class="row">

                   <div class="col-lg-3"></div>
                    
                    <div class="col-lg-2" >
                        <asp:Label ID="lblAbbr"  runat="server">Address:</asp:Label>
                    </div>
                    <div class="col-lg-3" >
                      
                            <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" Style="margin-left: -50px; "></asp:TextBox>
                        </div>
                    
                    <div class="col-lg-2"></div>
                </div>
                <br />
                  <div class="row">

                   <div class="col-lg-3"></div>
                    
                    <div class="col-lg-2" >
                        <asp:Label ID="Label1"  runat="server">City:</asp:Label>
                    </div>
                    <div class="col-lg-3" >
                        <asp:DropDownList CssClass="form-control" Style="margin-left: -50px; " ID="drpCityGodown" runat="server">
                            <asp:ListItem>Main Godown</asp:ListItem>
                            <asp:ListItem>Second Godown</asp:ListItem>
                        </asp:DropDownList>
                           
                        </div>
                    
                    <div class="col-lg-2"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="Button1" CssClass="btn btn-light" runat="server" Text="Submit" />
                    </div>
                    <div class="col-lg-4">
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3"  style="overflow: scroll;">
                <asp:GridView runat="server" Font-Size="Medium" RowStyle-Height="7px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSource3" DataKeyNames="UOMID">
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>
                          <asp:TemplateField>
                                           <ItemTemplate>
                                           <asp:LinkButton ID="lnkSelect" CommandName="Select" CssClass="btn-sm"  runat="server"><span class="fa fa-caret-right"></span></asp:LinkButton>
                                          </ItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                   </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                        <asp:BoundField DataField="Abbr" HeaderText="Abbr" SortExpression="Abbr"></asp:BoundField>

                        <asp:BoundField DataField="UOMID" HeaderText="UOMID" SortExpression="UOMID" InsertVisible="False" ReadOnly="True" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

                    <RowStyle Height="7px"></RowStyle>

                    <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Name], [Abbr], [UOMID] FROM [Gen_UOM]"></asp:SqlDataSource>
                </div>
                <div class="col-lg-3"></div>
            </div>
        </form>
    </div>


</asp:Content>

