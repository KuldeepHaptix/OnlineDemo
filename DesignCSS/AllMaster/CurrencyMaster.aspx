<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CurrencyMaster.aspx.cs" Inherits="AllMaster_CurrencyMaster" %>

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
                <div class="col-sm-3"><h5>Currency</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />
     
            <br />
            <div id="AddEdit" class="collapse">
                <div class="row">

                    <div class="col-lg-2"></div>
                    <div class="col-lg-2" >
                        <asp:Label ID="lblCurrencyName" Style="margin-left: 20px;" runat="server" Text="Currency Name:"></asp:Label>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtCurrencyName" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                  
                    <div class="col-lg-2" style="margin-left:-50px">
                        <asp:Label ID="lblCurrency" Style="margin-left: 20px;" runat="server" Text="Currency:"></asp:Label>
                    </div>
                    <div class="col-lg-2" style="margin-left:-50px">
                        <div class="row">
                            <asp:TextBox ID="txtCurrency" CssClass="form-control" runat="server" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" />
                    </div>
                    <div class="col-lg-4">
                    </div>
                </div>
            </div>
            <br />
            <div class="row">
                
                <div class="col-lg-12"  style="overflow: auto;">
     

                   <asp:GridView EmptyDataText="No Data Found" Width="100%" runat="server" ID="GvCurrency"  DataKeyNames="CurrencyID" CssClass="table" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowUpdating="GvCurrency_RowUpdating" OnRowCommand="GvCurrency_RowCommand" OnRowDeleting="GvCurrency_RowDeleting" OnRowEditing="GvCurrency_RowEditing" OnRowCancelingEdit="GvCurrency_RowCancelingEdit" OnRowDataBound="GvCurrency_RowDataBound" ShowHeaderWhenEmpty="True" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField >

                            <ItemTemplate>
                                <asp:Label Visible="false" ID="lblCurencyID" runat="server" Text='<%# Eval("CurrencyID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblCurencyName" runat="server" Text='<%# Eval("CurrencyName") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtECurencyName" Text='<%# Eval("CurrencyName") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFCurencyName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Currency Abbr">

                            <ItemTemplate>
                                <asp:Label ID="lblCurrency" runat="server" Text='<%# Eval("Currency") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtECurrency" Text='<%# Eval("Currency") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFCurrency" runat="server"></asp:TextBox>
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
                       <EmptyDataTemplate>
                 <asp:Label ID="lblempty" runat="server" Text="No record Found"></asp:Label>

                       </EmptyDataTemplate>
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
                <div class="col-lg-3"></div>
            </div>
        </form>
    </div>
</asp:Content>

