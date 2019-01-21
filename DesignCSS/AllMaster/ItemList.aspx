<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="ItemList.aspx.cs" Inherits="ItemList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
   <%-- <link rel="stylesheet" href="CSS/InerMasterStyle.css" type="text/css" media="screen"  />  --%>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style="margin-top:30px;">  
    <div class="row">
     
        <div class="col-sm-11">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-5">
                            <h3>List Of Item</h3>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button ID="btnNewItem" class="btn btn-light" runat="server" Text="+ New Item" OnClick="btnNewItem_Click"  />
                        </div>
                        <div class="col-lg-1">
                           
                        </div>
                        <div class="col-lg-1"></div>
                        <div class="col-lg-1">
                        </div>

                        <!-- The Modal -->
                       
                        <!-- ENd modal -->
                    </div>
                
                    <br/>
                    <hr/>
                    <br/>

                    <div class="row">
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Edit</button>
                        </div>
                        <div class="col-lg-1">
                            <button type="button" class="btn btn-light">Delete</button>
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-6">
                            <input class="form-control" id="myInput" type="text" placeholder="Search.." />

                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12" style="overflow:scroll" >
                            <asp:GridView ID="GVItem" Width="100%" CssClass="table" DataKeyNames="ItemID" runat="server" CellPadding="3" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False"  AllowPaging="True" PageSize="5" Font-Size="Small" OnRowEditing="GVItem_RowEditing" OnRowCancelingEdit="GVItem_RowCancelingEdit" OnRowDeleting="GVItem_RowDeleting" OnRowUpdating="GVItem_RowUpdating" OnRowCommand="GVItem_RowCommand" OnPageIndexChanging="GVItem_PageIndexChanging">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>
                            <asp:TemplateField HeaderText="Edit/Delete">
                            <ItemTemplate>
                               <asp:LinkButton ID="lnkedit" CommandName="RecordEdit" runat="server"  CommandArgument='<%# Eval("ItemID" )%>' Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>

                              <%--  <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>--%>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                          
                        </asp:TemplateField>

                         <asp:TemplateField Visible="false" HeaderText="ID">
                            <ItemTemplate>
                          <asp:Label  ID="lblItemID" runat="server" Text='<%# Eval("ItemID") %>'></asp:Label>

                            </ItemTemplate>
                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Code">
                            <ItemTemplate>
                          <asp:Label  ID="lblItemCode" runat="server" Text='<%# Eval("Code") %>'></asp:Label>

                            </ItemTemplate>
                            
                        </asp:TemplateField>
                        
                         <asp:TemplateField HeaderText="Item Name">
                            <ItemTemplate>
                          <asp:Label  ID="lblItemName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEitemname" Text='<%# Eval("Name") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                           <asp:TemplateField HeaderText="UOM">
                            <ItemTemplate>
                          <asp:Label  ID="lblUOM" runat="server" Text='<%# Eval("UOM") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtUOM" Text='<%# Eval("UOM") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                          <asp:Label ID="lblItemPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEItemPrice" Text='<%# Eval("Price") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>

                      <%--  <asp:TemplateField HeaderText="Currency">
                            <ItemTemplate>
                          <asp:Label Visible="false" ID="lblCurrency" runat="server" Text='<%# Eval("CurrencyID") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtECurrencyId" Text='<%# Eval("CurrencyID") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="HSN Code">
                            <ItemTemplate>
                          <asp:Label  ID="lblHsnCode" runat="server" Text='<%# Eval("HSNCode") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEHsnCode" Text='<%# Eval("HSNCode") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>


                          
                    <%--    <asp:TemplateField HeaderText="Product Code">
                            <ItemTemplate>
                          <asp:Label  ID="lblProductCode" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEProductCode" Text='<%# Eval("ProductCode") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>  --%>

                                
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                          <asp:Label  ID="lblSpecification" runat="server" Text='<%# Eval("Specification") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtESpecification" Text='<%# Eval("Specification") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                            
                          <asp:TemplateField HeaderText="ProductCode">
                            <ItemTemplate>
                          <asp:Label  ID="lblProductCode" runat="server" Text='<%# Eval("ProductCode") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEProductCode" Text='<%# Eval("ProductCode") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                                        
                     
                       <asp:TemplateField HeaderText="TaxClass">
                            <ItemTemplate>
                          <asp:Label  ID="lbltaxclassid" runat="server" Text='<%# Eval("ItemClassID") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtERackNo" Text='<%# Eval("") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Category">
                            <ItemTemplate>
                          <asp:Label  ID="lblcategoryid" runat="server" Text='<%# Eval("CategoryID") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtERackNo" Text='<%# Eval("") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
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
                            </asp:GridView>
                        </div>
                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>
</asp:Content>

