<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="QuotationFollowupList.aspx.cs" Inherits="Quotation_QuotationFollowupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container" style="margin-top: 30px;">
        <div class="row">

            <div class="col-sm-10">
                <div class="col-sm-12 text-left">
                    <form runat="server">
                        <div class="row">
                            <div class="col-lg-5">
                                <h3>Quotation Followup List</h3>
                            </div>
                            <div class="col-lg-3">
                                <asp:Button ID="btnNewFollowup" class="btn btn-light" runat="server" Text="Followup" OnClick="btnNewFollowup_Click" />
                            </div>
                            <div class="col-lg-1">
                            </div>
                            <div class="col-lg-1"></div>
                            <div class="col-lg-1">
                            </div>

                            <!-- The Modal -->

                            <!-- ENd modal -->
                        </div>

                        <br />
                        <hr />
                        <br />

                        <div class="row">
                            <%-- <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Edit</button>
                        </div>
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Delete</button>
                        </div>
                        <div class="col-lg-4">
                        </div>--%>
                            <div class="col-lg-6">
                                <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-12" style="overflow: auto;">
                                <asp:GridView ShowHeaderWhenEmpty="true" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" ID="GvQuotationFollowup" CssClass="table" runat="server" Width="100%" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" Font-Size="Small" OnRowCommand="GvQuotationFollowup_RowCommand">
                                    <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkselect" CommandName="Select" runat="server" CommandArgument='<%# Eval("INVOICEID" )%>' Text="Select"></asp:LinkButton>
                                               <%-- <asp:LinkButton ID="lnlEdit" CommandName="Edit" CommandArgument='<%# Eval("INVOICEID" )%>' runat="server">Edit</asp:LinkButton>--%>

                                            </ItemTemplate>
                                            <EditItemTemplate>
                                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                                            </EditItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblctype" runat="server" Text='<%# Eval("TYPE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lblleadid" runat="server" Text='<%# Eval("INVOICEID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcode" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="NextFollowUp">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldate" runat="server" Text='<%# Eval("DATE") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="CustomerName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcustomername" runat="server" Text='<%# Eval("PARTY") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ContactPerson">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcontactname" runat="server" Text='<%# Eval("ContactPerson") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Phone">
                                            <ItemTemplate>
                                                <asp:Label ID="lblphone" runat="server" Text='<%# Eval("Phone1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--<asp:TemplateField HeaderText="Specification">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblspecification" runat="server" Text='<%# Eval("Specification") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Remarks" ControlStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lblremarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


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

                                    <EmptyDataTemplate>
                                        <div class="text-left">No records found</div>
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>


    </div>


</asp:Content>

