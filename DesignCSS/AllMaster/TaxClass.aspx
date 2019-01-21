<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="TaxClass.aspx.cs" Inherits="AllMaster_TaxClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3"><h5>Tax Class</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />
        

            <%-----------calander-----------------------%>

           
    
            <div class="row">
               <div class="col-lg-1" ></div>
                <div class="col-lg-12" style="overflow-x:scroll" >
                <asp:GridView runat="server" ID="GvTaxClass" CssClass="table" DataKeyNames="TaxClassID"  Font-Size="Medium" ShowFooter="true"  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" HeaderStyle-Width="7px" ForeColor="Black" GridLines="Vertical" OnRowCancelingEdit="GvTaxClass_RowCancelingEdit" OnRowCommand="GvTaxClass_RowCommand" OnRowDeleting="GvTaxClass_RowDeleting" OnRowEditing="GvTaxClass_RowEditing" OnRowUpdating="GvTaxClass_RowUpdating" OnRowDataBound="GvTaxClass_RowDataBound" AllowPaging="True" PageSize="5" OnPageIndexChanging="GvTaxClass_PageIndexChanging">
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>
                         <asp:TemplateField  Visible="false">

                            <ItemTemplate>
                                <asp:Label ID="lblTaxClassID"  runat="server" Text='<%# Eval("TaxClassID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="TaxName">
                            <ItemTemplate>
                                <asp:Label ID="lblTaxName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEtaxname" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFtaxname" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="From Date">

                            <ItemTemplate>
                                <asp:Label ID="lblFromDate" runat="server" Text='<%# Eval("FromDate") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEromDate" Text='<%# Eval("FromDate") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFFromDate" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="SGST">

                            <ItemTemplate>
                                <asp:Label ID="lblSgst" runat="server" Text='<%# Eval("SGST") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEsgst" Text='<%# Eval("SGST") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFsgst" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="CGST">

                            <ItemTemplate>
                                <asp:Label ID="lblcgst" runat="server" Text='<%# Eval("CGST") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEcgst" Text='<%# Eval("CGST") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFcgst" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                          <asp:TemplateField  HeaderText="IGST">
                             
                            <ItemTemplate>
                                <asp:Label ID="lbligst" runat="server" Text='<%# Eval("IGST") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEigst" Text='<%# Eval("IGST") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFigst" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                           
                            <ItemTemplate >
                                <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:LinkButton ID="btnAdd" runat="server" CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

                    <RowStyle Height="0px" Width="10px"></RowStyle>

                    <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                    </div>
               
            </div>
        </form>
    </div>
</asp:Content>

