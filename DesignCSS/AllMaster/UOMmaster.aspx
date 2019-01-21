<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="UOMmaster.aspx.cs" Inherits="UOMmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3"><h5>Unit Of Measurment</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />
     
            <br />
          <%--  <div id="AddEdit" class="collapse">
                <div class="row">

                    <div class="col-lg-2"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblUOM" Style="margin-left: 20px;" runat="server" Text="UOM Name:"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtUOM" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    
                    <div class="col-lg-2" style="margin-left:-50px">
                        <asp:Label ID="lblAbbr" Style="margin-left: 20px;" runat="server">Abbr :</asp:Label>
                    </div>
                    <div class="col-lg-2" style="margin-left:-50px">
                        <div class="row">
                            <asp:TextBox ID="txtAbbr" CssClass="form-control" runat="server" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="Button1" CssClass="btn btn-light" runat="server" Text="Submit" />
                    </div>
                    <div class="col-lg-4">
                    </div>
                </div>
            </div>--%>
            <br />
            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-8"  >
                <asp:GridView runat="server" ID="gvUOM" ShowFooter="true" ShowHeaderWhenEmpty="true" Font-Size="Medium"  CssClass="table" RowStyle-Height="7px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" DataKeyNames="UOMID" OnRowCancelingEdit="gvUOM_RowCancelingEdit" OnRowCommand="gvUOM_RowCommand" OnRowDeleting="gvUOM_RowDeleting" OnRowEditing="gvUOM_RowEditing" OnRowUpdating="gvUOM_RowUpdating" AllowPaging="True" OnPageIndexChanging="gvUOM_PageIndexChanging" PageSize="5">
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>
                           <asp:TemplateField >

                            <ItemTemplate>
                                <asp:Label Visible="false" ID="lblUomId" runat="server" Text='<%# Eval("UOMID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("UOM") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEName" Text='<%# Eval("UOM") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Abbreviation">

                            <ItemTemplate>
                                <asp:Label ID="lblAbbr" runat="server" Text='<%# Eval("Abbr") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEAbbr" Text='<%# Eval("Abbr") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFAbbr" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Edit/Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnAdd" runat="server"  CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                        </Columns>

                     <EditRowStyle BackColor="#c1c1c1" />
                    <FooterStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#d1d1d1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                
                </div>
            
            </div>
        </form>
    </div>
</asp:Content>

