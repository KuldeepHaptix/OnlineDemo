<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="locationMasterNew.aspx.cs" Inherits="AllMaster_locationMasterNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form runat="server">
        <div class="container">

            <div class="row">
                <div class="col-am-12"></div>
            </div>
            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2" >
                   <br />
                    <br />
                    <br />
                    <br />
                    <div class="row">
                        <asp:Button ID="btnCountry" runat="server" CssClass="btn btn-light" Text="Country" OnClick="btnCountry_Click" />
                    </div>
                    <div class="row">
                        <asp:Label ID="lblslctdCountry" runat="server" Text=""></asp:Label>
                    </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="btnState" runat="server" CssClass="btn btn-light" Text="State" OnClick="btnState_Click" />
                    </div>
                    <div class="row">
                        <asp:Label ID="lblslctdState" runat="server" Text=""></asp:Label>
                    </div>
                   <br />
                    <div class="row">
                        <asp:Button ID="btnCity" runat="server" CssClass="btn btn-light" Text="City" OnClick="btnCity_Click" />
                    </div>
                    <div class="row">
                        <asp:Label ID="lblslctdcity" runat="server" Text=""></asp:Label>

                    </div>
                    <br />
                    <div class="row">
                        <asp:Button ID="btnarea" runat="server" CssClass="btn btn-light" Text="Area" OnClick="btnarea_Click" />
                    </div>
                    <div class="row">
                        <asp:Label ID="lblslctdarea" runat="server" Text=""></asp:Label>
                    </div>
                </div>
              
                <div class="col-sm-5">

               <%--    <div class="row">
                        <div class="col-lg-3">
                                <button type="button" id="btn_Add" data-toggle="collapse" data-target="#AddEdit" class="btn btn-light">Add</button>
                        </div>
                        <div class="col-lg-3">
                                <button type="button" id="btn_Edit" data-toggle="collapse" data-target="#AddEdit" class="btn btn-light">Edit</button>
                        </div>
                        <div class="col-lg-2">
                                <button type="button" id="btn_Delete"  class="btn btn-light">Delete</button>
                        </div>
                    </div>--%>
                  
                    <br />
                    

                    <hr />
                   

                   
                    <div class="row">
                        <div class="col-lg-4">
                            <asp:Label ID="lblName" runat="server" Visible="false" Text=""></asp:Label>
                        </div>
                        <div class="col-lg-7" style="margin-left:-50px">
                        <asp:DropDownList ID="drpSelection" Visible="false" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpSelection_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="row" style=" width: 500px; overflow: scroll">

                        <br />

                        <asp:GridView runat="server" ID="GvLocation" DataKeyNames="CountryID" ShowFooter="true" Width="490px" Font-Size="Medium" CssClass="table" RowStyle-Height="7px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" AllowPaging="True" PageSize="5" OnRowCommand="GvLocation_RowCommand" OnPageIndexChanging="GvLocation_PageIndexChanging" OnRowDeleting="GvLocation_RowDeleting" OnRowEditing="GvLocation_RowEditing" OnRowUpdating="GvLocation_RowUpdating">
                            <AlternatingRowStyle BackColor="#e6e6e6" />
                            <Columns>
                          <asp:TemplateField HeaderText="Edit/Delete">
                            <ItemTemplate>
                            <%--   <asp:LinkButton ID="btnselect" CommandName="Select" CommandArgument='<%# Eval("CountryID") + ";"+ Eval("StateID") %>' runat="server" Text="Edit">Select</asp:LinkButton>--%>
                             <asp:LinkButton ID="btnselect" CommandName="Select" runat="server" Text="Edit">Select</asp:LinkButton>

                            </ItemTemplate>

                           
                        </asp:TemplateField>

                                 <asp:TemplateField>
                                    <ItemTemplate>
                              <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>

                                    </ItemTemplate>
                                    <EditItemTemplate>

                                 <asp:TextBox ID="txtEName" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>

                                    </EditItemTemplate>
                                     <FooterTemplate>
                                 <asp:TextBox ID="txtFName"  runat="server"></asp:TextBox>

                                     </FooterTemplate>
                                    <ItemStyle ForeColor="#61A4DB" />
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

                            <SelectedRowStyle BackColor="#cccccc" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>


                    </div>
                        
                </div>
                <div class="col-sm-2"></div>


            </div>


        </div>
    </form>
</asp:Content>

