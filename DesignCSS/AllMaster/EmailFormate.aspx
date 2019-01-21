<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="EmailFormate.aspx.cs" Inherits="AllMaster_EmailFormate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- Email Formate --%>
     <div class="container">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-3"><h5>Email Templates</h5></div>
                <div class="col-sm-5"></div>
            </div>
           
          
            <br />
            <div class="row" >
                
                <div class="col-lg-12" style="overflow: auto;">
                <asp:GridView runat="server" ID="GVEmail"  CssClass="table"  DataKeyNames="Email_ID"   Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" OnRowEditing="GVEmail_RowEditing" OnRowCancelingEdit="GVEmail_RowCancelingEdit" OnRowUpdating="GVEmail_RowUpdating" AllowPaging="True" OnPageIndexChanging="GVEmail_PageIndexChanging" PageSize="3">
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>
                            
                          <asp:TemplateField HeaderText="Edit">
                                           <ItemTemplate>
                                           <asp:LinkButton ID="lnlEdit" CommandName="Edit" runat="server">Edit</asp:LinkButton>
                                          </ItemTemplate>
                                            <EditItemTemplate>
                                            <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                                   </asp:TemplateField>

                           <asp:TemplateField HeaderText="Type">
                                           <ItemTemplate>
                                                <asp:Label ID="lblType" runat="server" Text='<%#Eval("Type") %>'></asp:Label>
                                          </ItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                          </asp:TemplateField>

                                <asp:TemplateField  HeaderText="Subject" ControlStyle-Width="100px">
                                           <ItemTemplate>
                                              <asp:Label ID="lblsubject" runat="server" Text='<%#Eval("Subject") %>'></asp:Label>
                                          </ItemTemplate>
                                         <EditItemTemplate>
                                            <asp:TextBox ID="txtESubject" TextMode="MultiLine" class="form-control"  Style="margin-left: 0px;" Text='<%#Eval("Subject") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                 </asp:TemplateField>

                         <asp:TemplateField  HeaderText="Header" ControlStyle-Width="500px">
                                           <ItemTemplate>
                                              <asp:Label ID="lblHeader" runat="server" Text='<%#Eval("Header") %>'></asp:Label>
                                          </ItemTemplate>
                                         <EditItemTemplate>
                                            <asp:TextBox ID="txtEHeader" class="form-control" TextMode="MultiLine" Style="margin-left: 0px;" Text='<%#Eval("Header") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                 </asp:TemplateField>

                         <asp:TemplateField  HeaderText="Footer" ControlStyle-Width="150px">
                                           <ItemTemplate>
                                              <asp:Label ID="lblFooter"  runat="server" Text='<%#Eval("Footer") %>'></asp:Label>
                                          </ItemTemplate>
                                         <EditItemTemplate>
                                            <asp:TextBox ID="txtEfooter" TextMode="MultiLine" class="form-control" Text='<%#Eval("Footer") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                       <ItemStyle ForeColor="#61A4DB" />
                                 </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                   
                    <RowStyle></RowStyle>

                    <SelectedRowStyle BackColor="#61A4DB" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                      </div>
                <div class="col-lg-1"></div>
            </div>
        </form>
    </div>


</asp:Content>

