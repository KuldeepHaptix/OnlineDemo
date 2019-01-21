<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="TypeOfServiceCall.aspx.cs" Inherits="AllMaster_TypeOfServiceCall" %>

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
                <div class="col-sm-4"></div>
                <div class="col-sm-3"><h5>Type Of Service Call</h5></div>
                <div class="col-sm-4"></div>
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
                        <asp:Label ID="lblName"  runat="server" Text="Name of Call:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtNAme" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    
                   
                </div>
             <br />
                <div class="row">

                   <div class="col-lg-3"></div>
                    
                    <div class="col-lg-2" >
                        <asp:Label ID="lblDescription"  runat="server">Description:</asp:Label>
                    </div>
                    <div class="col-lg-3" >
                      
                            <asp:TextBox ID="txtDescription" CssClass="form-control" runat="server" Style="margin-left: -50px; "></asp:TextBox>
                        </div>
                    
                    <div class="col-lg-2"></div>
                </div>
                <br />
                 
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
                <div class="col-lg-2"></div>
                <div class="col-lg-7"  >
                <asp:GridView runat="server" ID="GVTypeOfCall" Width="100%" ShowFooter="true" Font-Size="Medium" DataKeyNames="CallID" RowStyle-Height="7px" CssClass="table" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="5" ForeColor="Black" GridLines="Vertical" OnRowEditing="GVTypeOfCall_RowEditing" OnRowCommand="GVTypeOfCall_RowCommand" OnRowCancelingEdit="GVTypeOfCall_RowCancelingEdit" OnRowDeleting="GVTypeOfCall_RowDeleting" OnRowUpdating="GVTypeOfCall_RowUpdating" OnPageIndexChanging="GVTypeOfCall_PageIndexChanging" OnRowDataBound="GVTypeOfCall_RowDataBound" >
                    <AlternatingRowStyle BackColor="#e6e6e6" />
                    <Columns>

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


                          <asp:TemplateField HeaderText="Call Name">

                            <ItemTemplate>
                                <asp:Label ID="lblCallName" runat="server" Text='<%# Eval("Call_Name") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtECallName" Text='<%# Eval("Call_Name") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFcallName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                         <asp:TemplateField HeaderText="Description">

                            <ItemTemplate>
                                <asp:Label ID="lblCallDEsc" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtECallDesc" Text='<%# Eval("Description") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFcalDesc" runat="server"></asp:TextBox>
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
                <div class="col-lg-3"></div>
            </div>
        </form>
    </div>


</asp:Content>

