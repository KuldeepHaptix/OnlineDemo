<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="TestingofMaster.aspx.cs" Inherits="AllMaster_TestingofMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">\
    <form runat="server">
        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <asp:Label ID="lblTableName" runat="server" Text="Table Name"></asp:Label>
                </div>
                <asp:GridView runat="server" ID="GvAccount" CssClass="table" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="GvAccount_RowCommand" OnRowEditing="GvAccount_RowEditing" DataKeyNames="AccountID" OnRowUpdating="GvAccount_RowUpdating" OnRowCancelingEdit="GvAccount_RowCancelingEdit" OnRowDeleting="GvAccount_RowDeleting">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>

                        <asp:TemplateField HeaderText="Id">

                            <ItemTemplate>
                                <asp:Label ID="lblAcno" runat="server" Text='<%# Eval("AccountID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Code">
                            <ItemTemplate>
                                <asp:Label ID="lblAcCode" runat="server" Text='<%# Eval("AccountCode") %>'></asp:Label>

                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEAccountCode" Text='<%# Eval("AccountCode") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFaccountCode" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Account NAme">

                            <ItemTemplate>
                                <asp:Label ID="lblacname" runat="server" Text='<%# Eval("AccountName") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEAccountName" Text='<%# Eval("AccountName") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFacountName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <ItemTemplate>
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
</asp:Content>

