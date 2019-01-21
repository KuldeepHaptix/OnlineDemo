<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" EnableViewState="true" CodeFile="OrderNew.aspx.cs" Inherits="OrderBooking_OrderNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    

        
 
    <div class="container-fluid">
        <br />
        <div class="row">
             <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>New Order Booking</u></h4>
                </div>
        </div>
        
        <form runat="server" class="form-control">
           <%-- <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel runat="server">
                 <ContentTemplate>--%>
                    <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6">
                            <%--    <div class="row">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblType" runat="server" CssClass="mr-sm-2" Text="Type:"></asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:DropDownList ID="DrpType" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="DrpType_SelectedIndexChanged" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                            <asp:ListItem>--Select--</asp:ListItem>
                                            <asp:ListItem>Retail</asp:ListItem>
                                            <asp:ListItem>Tax</asp:ListItem>
                                            <asp:ListItem>Estimate</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                
                                </div>--%>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblOrderDate" runat="server" CssClass="mr-sm-2" Text="Order Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtOrderDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblAppTaken" runat="server" CssClass="mr-sm-2" Text="App Taken By:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drpApptaken" EnableViewState="true" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                       
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblOrderNo" runat="server" CssClass="mr-sm-2" Text="Order No:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtOrderNo" Enabled="false" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblInvoiceNo" runat="server" CssClass="mr-sm-2" Text="Your Invoice No:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtInvoiceNo" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblAllocatedto" runat="server" CssClass="mr-sm-2" Text="Allocated To:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="drpAllocatedTo" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                      
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblCustName" runat="server" CssClass="mr-sm-2" Text="Customer:"></asp:Label>
                        </div>
                        <div class="col-lg-10">
                           <asp:DropDownList ID="drpCustomername" AutoPostBack="true" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server" OnSelectedIndexChanged="drpCustomername_SelectedIndexChanged">
                                    
                                    </asp:DropDownList>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                            <asp:Label ID="lblAddress" runat="server" CssClass="mr-sm-2" Text="Address:"></asp:Label>
                        </div>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtAddress" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblEmail" runat="server" CssClass="mr-sm-2" Text="Email:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtEmail" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblNarration" runat="server" CssClass="mr-sm-2" Text="Narration:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtNarration" TextMode="MultiLine" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>


                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblMobile" runat="server" CssClass="mr-sm-2" Text="Mobile:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtMobile" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblStatus" runat="server" CssClass="mr-sm-2" Text="Status:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpStatus" Enabled="false" CssClass="custom-select custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>INPROGRESS</asp:ListItem>
                                        <asp:ListItem>QUOTATION</asp:ListItem>
                                        <asp:ListItem>SALE</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                               <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblchalanno" runat="server" CssClass="mr-sm-2" Text="Chalan No:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtchalanNo" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <br />
                            <br />
                        </div>
                  
                        
                       
                    </div>

                   


                    <div class="row">
                        <div class="col-lg-12">
                            <div id="itemgridview" style="padding: 15px;">
                                <div class="row mb-2">
                                    <div class="col-sm-2">
                                        <h5>Item</h5>
                                    </div>
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-2">
                                        <button type="button" class="btn btn-light">Add</button>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" class="btn btn-light">Edit</button>
                                    </div>
                                    <div class="col-sm-2">
                                        <button type="button" class="btn btn-light">Delete</button>
                                    </div>

                                </div>
                                <!--Gridview--->
                                <div class="row" style="overflow-x: auto; min-height: 300px; max-height: 300px;">
                                    <div  class="col-lg-12" style="overflow: scroll">
                                        <asp:GridView ID="GvItem" Width="100%" ShowFooter="true" CssClass="table" runat="server" CellPadding="1" DataKeyNames="QDetailID" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="4" Font-Size="Small" OnRowDataBound="GvItem_RowDataBound" OnRowCommand="GvItem_RowCommand" OnRowDeleting="GvItem_RowDeleting" OnRowEditing="GvItem_RowEditing" OnRowUpdating="GvItem_RowUpdating">
                                            <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                            <Columns>

                                                <asp:TemplateField ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="btnEdit"  CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                            <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>

                                            <%--<asp:LinkButton ID="btnok" CommandName="OK" runat="server" Text="OK">OK</asp:LinkButton>--%>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            <asp:LinkButton ID="btnAdd" runat="server" CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                                        </FooterTemplate>

                                        <EditItemTemplate>
                                            <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                            <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                                        </EditItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Id" Visible="false" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("ItemID") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEid" class="form-control" runat="server" Text='<%# Eval("ItemID") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFid" class="" runat="server"></asp:TextBox>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Item" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpEItemName" CssClass="custom-select-md"   runat="server">
                                                
                                            </asp:DropDownList>

                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="drpFItemName" AutoPostBack="true" OnSelectedIndexChanged="drpFItemName_SelectedIndexChanged" CssClass="custom-select-md" runat="server">
                                            </asp:DropDownList>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Qnty" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQnty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>

                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEQnty" class="form-control" AutoPostBack="true" OnTextChanged="txtEQnty_TextChanged"  runat="server" Text='<%# Eval("Qty") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFQnty" OnTextChanged="txtFQnty_TextChanged" class="" runat="server"  AutoPostBack="True"></asp:TextBox>
                                        </FooterTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="UOM" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblUOM" runat="server" Text='<%# Eval("UOM") %>'></asp:Label>



                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpEUom"  CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="drpFUom" CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Rate" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Rate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtERate" class="form-control" runat="server" Text='<%# Eval("Rate") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFRate"  AutoPostBack="true"
                                                 class="" runat="server"></asp:TextBox>
                                        </FooterTemplate>

                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Currency" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblcurrencyid" runat="server" Text='<%# Eval("CurrencyID") %>'></asp:Label>

                                            <%-- <asp:dropdownlist id="drpcurrency" Text='<%# Eval("Currency") %>'  runat="server">
                                 </asp:dropdownlist>--%>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="drpEcurrency"  CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:DropDownList ID="drpFcurrency" CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Amount" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEAmount" class="" Text='<%# Eval("Amount") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFAmount" class="" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Discount" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIDiscount" runat="server" Text='<%# Eval("Discount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEDiscount" OnTextChanged="txtEDiscount_TextChanged" AutoPostBack="true" class="form-control" Text='<%# Eval("Discount") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFDiscount" class="" AutoPostBack="true" OnTextChanged="txtFDiscount_TextChanged"  runat="server"></asp:TextBox>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="NetAmount" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblNetamount" runat="server" Text='<%# Eval("NetAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtENetAmount" Text='<%# Eval("NetAmount") %>' class="form-control" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFNetAmount" class="" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="TaxClass" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbltaxclass" runat="server" Text='<%# Eval("TaxClassID") %>'></asp:Label>
                                            <%--  <asp:dropdownlist id="drpTaxClass" AutoPostBack="true" OnSelectedIndexChanged="drpTaxClass_SelectedIndexChanged"  cssclass=" custom-select-md" runat="server">
                                 </asp:dropdownlist>   --%>
                                        </ItemTemplate>

                                        <EditItemTemplate>


                                            <asp:DropDownList ID="drpETaxClass" OnSelectedIndexChanged="drpETaxClass_SelectedIndexChanged" AutoPostBack="true"  CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>

                                        <FooterTemplate>
                                            <asp:DropDownList ID="drpFTaxClass" AutoPostBack="true" CssClass="form-control custom-select-md" OnSelectedIndexChanged="drpFTaxClass_SelectedIndexChanged"  runat="server">
                                            </asp:DropDownList>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="SGST" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSgst" runat="server" Text='<%# Eval("SGSTAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEsgst" class="form-control" Text='<%# Eval("SGSTAmount") %>' runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFsgst" class="form-control" runat="server"></asp:TextBox>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="CGST" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCgst" Text='<%# Eval("CGSTAmount") %>' runat="server"></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEcgst" Text='<%# Eval("CGSTAmount") %>' class="form-control" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFcgst" class="" runat="server"></asp:TextBox>
                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="IGST" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblIgst" runat="server" Text='<%# Eval("IGSTAmount") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEigst" Text='<%# Eval("IGSTAmount") %>' class="form-control" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFigst" class="" runat="server"></asp:TextBox>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Description" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblspecification" runat="server" Text='<%# Eval("Specification") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEdescription" class="form-control" runat="server" Text='<%# Eval("Specification") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFdescription" class="" runat="server"></asp:TextBox>

                                        </FooterTemplate>
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
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <!--Gridview End-->
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblPaymentMode" runat="server" CssClass="mr-sm-2" Text="Payment Mode:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpPaymentMode" AutoPostBack="true" CssClass="custom-select custom-select-md mr-sm-2 mb-2" runat="server" OnSelectedIndexChanged="DrpPaymentMode_SelectedIndexChanged">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Cash</asp:ListItem>
                                          <asp:ListItem>Cheque</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lablebankIN" runat="server" CssClass="mr-sm-2" Text="Bank(IN):"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBankIN" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Panel runat="server" ID="panelchequeno" Enabled="false">
                                <div class="row">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblChequeNo" runat="server" CssClass="mr-sm-2" Text="Cheque NO:"></asp:Label>
                                    </div>
                                    <div class="col-sm-8">
                                        <asp:TextBox ID="txtChequeNo" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                        <div class="col-lg-6">
                    <div class="row">
                                      <div class="col-sm-4" style="visibility:hidden">
                                     <asp:Label ID="lblAgainstCN"  runat="server" CssClass="mr-sm-2" Text="Against credit Note:"></asp:Label>
                                </div>
                                <div class="col-sm-8" style="visibility:hidden">
                                    <asp:DropDownList ID="DrpAgainstCN" CssClass="custom-select custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Direct Sale</asp:ListItem>
                                        <asp:ListItem>Against Credit Note</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblBankOUT" runat="server" CssClass="mr-sm-2" Text="Bank(OUT):"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtBankOUT" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <asp:Panel runat="server" id="panelcheqdate"  Enabled="false" >
                                <div class="row">
                                    <div class="col-sm-4">
                                        <asp:Label ID="lblChequeDate" runat="server" CssClass="mr-sm-2" Text="Cheque Date:"></asp:Label>
                                    </div>
                                    <div class="col-sm-7">
                                        <asp:TextBox ID="txtChequeDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-1">
                                        <asp:LinkButton ID="lnkChequeDate" Style="margin-left: -25px;" runat="server" CssClass="btn btn-calender" OnClick="lnkChequeDate_Click1"><span aria-hidden="true" class="fa fa-calendar"></span></asp:LinkButton>
                                    </div>
                                </div>
                                <asp:Calendar ShowNextPrevMonth="false" ID="datepicker" Style="position: absolute; margin-left: 110px; z-index: 1;" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="datepicker_SelectionChanged">
                                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                    <DayStyle Width="14%" />
                                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                    <TodayDayStyle BackColor="#CCCC99" />
                                </asp:Calendar>
                            </asp:Panel>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-12">
                            <%--                            <asp:Button runat="server" ID="btnEditTNC" Text="Edit T&C" CssClass="btn btn-light mr-4" />--%>
<%--                            <asp:CheckBox ID="chkallTnC" runat="server" CssClass="mr-5" Text="All T&C" />--%>

                            <asp:Label ID="lblDuedays" Text="Due Days" CssClass="mr-3 ml-5" runat="server" />

                            <asp:TextBox ID="txtDueDays" CssClass="form-control-inline mr-5" Width="60px" runat="server" />

                            <asp:Label ID="lblRecDays" CssClass="mr-3" Text="Rec. Days" runat="server" />

                            <asp:TextBox ID="txtRecDays" CssClass="form-control-inline mr-5" Width="60px" runat="server" />

                            <asp:Button ID="btnDispatch" class="btn btn-light " runat="server" Text="Dispatch Details" OnClick="btnDispatch_Click" />
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-2">
                        </div>
                    </div>

                </div>
                <div class="col-lg-4" style="box-shadow: 1px 0px 0px 0px #d7d1d1;">
                    <br />
                    <div class="row">
                        <h5 class="mb-3">Order Details</h5>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblAmount" runat="server" CssClass="mr-sm-2 labeldisable" Text="Amount:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox Enabled="false" ID="txtAmount" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblSGST" runat="server" CssClass="mr-sm-2" Text="SGST:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtSGST" Enabled="false" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblCGST" runat="server" CssClass="mr-sm-2" Text="CGST:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtCGST" Enabled="false" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblIGST" runat="server" CssClass="mr-sm-2" Text="IGST:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtIGST" Enabled="false" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblDiscount" runat="server" CssClass="mr-sm-2" Text="Discount:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtDiscount" Enabled="false" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <asp:Label ID="lblExtracharges" runat="server" CssClass="mr-sm-2 ml-2" Text="ExtraCharges:"></asp:Label>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblType1" runat="server" CssClass="mr-sm-2" Text="Type1:"></asp:Label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType1" CssClass="form-control mb-2 mr-sm-2" runat="server" placeholder="P & F Charges"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType1Amt"   AutoPostBack="true" CssClass="form-control mb-2" runat="server" OnTextChanged="txtType1Amt_TextChanged"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lbltype2" runat="server" CssClass="mr-sm-2" Text="Type2:"></asp:Label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType2"  CssClass="form-control mb-2 mr-sm-2" runat="server" placeholder="Transport Charges"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType2Amt"  AutoPostBack="true" CssClass="form-control mb-2" runat="server" OnTextChanged="txtType2Amt_TextChanged"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblType3" runat="server" CssClass="mr-sm-2" Text="Type3:"></asp:Label>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType3" CssClass="form-control mb-2 mr-sm-2" runat="server" placeholder="Courior Charges"></asp:TextBox>
                        </div>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtType3Amt" AutoPostBack="true"  CssClass="form-control mb-2" runat="server"  OnTextChanged="txtType3Amt_TextChanged"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblNetAmount" runat="server" CssClass="mr-sm-2" Text="Net Amount:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNetAmount" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblPaidAmount" Enabled="false" runat="server" CssClass="mr-sm-2" Text="Paid Amount:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtPaidAmount"  CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <br />

                    <div class="row">
                        <h5 class="mb-2">Document Details</h5>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblfuOrderDoc" Enabled="false" runat="server" CssClass="mr-sm-2" Text="Select File:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="OrderFileUpload" runat="server" CssClass="form-control form-control-file mb-2" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 justify-content-center">
                            <asp:Button ID="btnFileUpload" class="btn btn-light mb-2" runat="server" Text="Add File" OnClick="btnFileUpload_Click" />
                        </div>
                    </div>
                    <div class="row" style="overflow: auto;">
                        <div class="col-lg-12">
                            <asp:GridView runat="server" Width="100%" ID="GVAttachment" EmptyDataText="No record" ShowFooter="true" ShowHeaderWhenEmpty="true" Font-Size="Medium" CssClass="table" RowStyle-Height="7px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" DataKeyNames="" AllowPaging="True" PageSize="3" OnRowDeleting="GVAttachment_RowDeleting">
                                    <AlternatingRowStyle BackColor="#e6e6e6" />
                                    <EmptyDataTemplate>No records Found</EmptyDataTemplate>
                                    <Columns>

                                        <asp:TemplateField HeaderText="Document">

                                            <ItemTemplate>
                                                <asp:Label ID="lblfile" runat="server" Text='<%# Eval("DocName") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                                            </ItemTemplate>

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
                                    <EmptyDataTemplate>
                                        <asp:Label Visible="false" ID="lblfile" runat="server" Text="No data found"></asp:Label>
                                    </EmptyDataTemplate>
                                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                                </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SaleskitCRMConnectionString %>' SelectCommand="SELECT [DocName], [DocID], [SaleID] FROM [SaleDocList]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h5 class="mb-2">Mail Details</h5>
                    </div>
                    <div class="row">

                        <div class="col-sm-4">
                            <asp:Label ID="lblCC" runat="server" CssClass="mr-sm-2" Text="CC:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtCC" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblBCC" runat="server" CssClass="mr-sm-2" Text="BCC:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtBCC" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <asp:CheckBox ID="chksendmail" runat="server" CssClass="custom-checkbox" Text="Send Mail" />
                        </div>
                        <div class="col-lg-4"></div>
                    </div>
                </div>
            </div>

        <%--    </ContentTemplate>
                  <Triggers>
             <asp:PostBackTrigger ControlID="drpCustomername" />

         <%--   <asp:PostBackTrigger ControlID="btn_Fileupload" />
        </Triggers>
            </asp:UpdatePanel>--%>
            <br />
            <div class="row">
            </div>
            <div class="row">

                <div class="col-lg-3">
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="btnSubmitInq" class="btn btn-info mr-sm-2" runat="server" Text="Submit" OnClick="btnSubmitInq_Click" />
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="btnCalcel" class="btn btn-info" runat="server" Text="Cancel" />
                </div>

            </div>

        </form>

       
    </div>
</asp:Content>

