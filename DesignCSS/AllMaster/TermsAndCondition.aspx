<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="TermsAndCondition.aspx.cs" Inherits="AllMaster_TermsAndCondition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <%-- Terms And Condition--%>
     <div class="container">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3"><h5>Terms And Conditions</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />

               <div class="row">

                   <div class="col-lg-3"></div>
                    
                    <div class="col-lg-2" >
                        <asp:Label ID="lblSubject"  runat="server">Subject:</asp:Label>
                    </div>
                    <div class="col-lg-3" >
                        <asp:DropDownList CssClass="form-control" Style="margin-left: -60px; " ID="DrpTncSubject" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DrpTncSubject_SelectedIndexChanged">
                            <asp:ListItem>PURCHASE</asp:ListItem>
                            <asp:ListItem>SERVICE</asp:ListItem>
                             <asp:ListItem>QUOTATION</asp:ListItem>
                             <asp:ListItem>SALES</asp:ListItem>
                        </asp:DropDownList>
                           
                        </div>
                    
                    <div class="col-lg-2"></div>
                </div>
            <br />
   
            <div class="col-sm-4"></div>
          
            <br />
          
            <br />
            <div class="row" style="height:300px">
                <div class="col-lg-3"></div>
                <div class="col-lg-7" >
                <asp:GridView runat="server" ID="GvTermsCondition" DataKeyNames="TNCID" ShowHeader="true" ShowFooter="true" ShowHeaderWhenEmpty="true"  CssClass="table"   AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" OnRowCommand="GvTermsCondition_RowCommand" OnRowEditing="GvTermsCondition_RowEditing" PageSize="4" OnRowUpdating="GvTermsCondition_RowUpdating" OnRowDataBound="GvTermsCondition_RowDataBound" AllowPaging="True" OnRowDeleting="GvTermsCondition_RowDeleting1" OnPageIndexChanging="GvTermsCondition_PageIndexChanging" OnRowCancelingEdit="GvTermsCondition_RowCancelingEdit" >
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>
                        
                          <asp:TemplateField >

                            <ItemTemplate>
                                <asp:Label Visible="false" ID="lblUomId" runat="server" Text='<%# Eval("TNCID") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="T&C Subject">
                            <ItemTemplate>
                                <asp:Label ID="lblSubject" runat="server" Text='<%# Eval("TNC_Sub") %>'></asp:Label>
                            </ItemTemplate>

                        
                            <FooterTemplate>

                                <asp:DropDownList ID="drpsubject" runat="server" ></asp:DropDownList>
                                   
                            </FooterTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="T&C Description">

                            <ItemTemplate>
                                <asp:Label ID="lblDescr" runat="server" Text='<%# Eval("TNC_Desc") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEDescr" Text='<%# Eval("TNC_Desc") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFDescr" runat="server"></asp:TextBox>
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
                    </div>
                <div class="col-lg-2"></div>
            </div>
        </form>
    </div>




</asp:Content>

