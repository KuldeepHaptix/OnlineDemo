<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="QuotationNew.aspx.cs" Inherits="Quotation_QuotationNew" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<%--<%@ Register Assembly="EditableDropDownList" Namespace="EditableControls" TagPrefix="editable" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
   

            <form runat="server" id="quotform">
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                 <asp:UpdatePanel runat="server" ID="Quotation_UpdatePanel">
                  <ContentTemplate>
                <div class="row">
                    <div class="col-lg-12">
                        <h4 style="text-align: center; margin-bottom: 30px;"><u>Quotation</u></h4>
                    </div>
                </div>



                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblquotecode" Style="margin-left: 20px;" runat="server" Text="Quotation Code:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtCode" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblquoteDate" Style="margin-left: 20px;" runat="server">Quotation Date:</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <div class="row">
                            <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                            <%--<asp:imagebutton id="Calender" imageurl="~/Images/calendar.png" runat="server" cssclass="btn btn-light" onclick="Calender_Click" />--%>
                            <asp:LinkButton ID="Caender" runat="server" CssClass="btn btn-calender" OnClick="Calender_Click"><span aria-hidden="true" class="fa fa-calendar"></span></asp:LinkButton>
                        </div>
                    </div>
                </div>
                <div class="row" style="position: absolute; top: 203px; left: 850px; width: 140px; height: 30px; z-index: 1;">
                    <div class="col-lg-8"></div>
                    <div class="col-lg-2">
                        <asp:Calendar ID="datepicker" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="datepicker_SelectionChanged">
                            <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                            <DayStyle Width="14%" />
                            <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                            <OtherMonthDayStyle ForeColor="#999999" />
                            <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                            <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                            <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                            <TodayDayStyle BackColor="#CCCC99" />
                        </asp:Calendar>
                    </div>
                </div>
                <!--Second Row-->
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblcustname" Style="margin-left: 20px;" runat="server" Text="Customer Name:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpcustomer" Style="margin-left: -50px;" CssClass="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpcustomer_SelectedIndexChanged"></asp:DropDownList>

                        <%--     <asp:textbox id="txtCustName" class="form-control" style="margin-left: -50px;" runat="server"></asp:textbox>--%>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblInqDate" Style="margin-left: 20px;" runat="server">Inquiry Date:</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtInqDate" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblCustCode" Style="margin-left: 20px;" runat="server">Customer Code:</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtCustCode" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblContactPerson" Style="margin-left: 20px;" runat="server" Text="Contact Person:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtContPerson" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblAppTaken" Style="margin-left: 20px;" runat="server" Text="AppTaken:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpApptaken" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>Shubhangi</asp:ListItem>
                            <asp:ListItem>Manthan</asp:ListItem>
                            <asp:ListItem>Vandan</asp:ListItem>
                            <asp:ListItem>Daksha</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblAllocatedTo" Style="margin-left: 20px;" runat="server" Text="AllocatedTo"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpAllocated" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>Vandan</asp:ListItem>
                            <asp:ListItem>Manthan</asp:ListItem>
                            <asp:ListItem>Palak</asp:ListItem>
                            <asp:ListItem>Daksha</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>
                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblAddressline1" Style="margin-left: 20px;" runat="server" Text="AddressLine1:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtAddressline1" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblAddressline2" Style="margin-left: 20px;" runat="server">AddressLine2:</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtAddressline2" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblCity" Style="margin-left: 20px;" runat="server" Text="City:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpCity" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>--Select City--</asp:ListItem>
                            <asp:ListItem>Ahmedabad</asp:ListItem>
                            <asp:ListItem>Baroda</asp:ListItem>
                            <asp:ListItem>Surat</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblArea" Style="margin-left: 20px;" runat="server" Text="Area"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpArea" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">

                            <asp:ListItem>Alkapuri</asp:ListItem>
                            <asp:ListItem>Waghodiya</asp:ListItem>
                            <asp:ListItem>Karelibaug</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                </div>

                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblState" Style="margin-left: 20px;" runat="server" Text="State:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpState" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>Gujarat</asp:ListItem>
                            <asp:ListItem>Maharashtra</asp:ListItem>
                            <asp:ListItem>Rajasthan</asp:ListItem>
                            <asp:ListItem>Karnataka</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblPincode" Style="margin-left: 20px;" runat="server" Text="Pincode:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtPincode" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>

                </div>
                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblCountry" Style="margin-left: 20px;" runat="server" Text="Country:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:DropDownList ID="drpCountry" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>India</asp:ListItem>
                            <asp:ListItem>Australia</asp:ListItem>
                            <asp:ListItem>USA</asp:ListItem>
                            <asp:ListItem>China</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblMobile" Style="margin-left: 20px;" runat="server" Text="Mobile:"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:TextBox ID="txtMobileCode" class="form-control" Style="margin-left: -45px;" runat="server" value="+91"></asp:TextBox>
                    </div>
                    <div class="col-lg-2">
                        <asp:TextBox ID="txtMobile" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>
                </div>

                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblPhone1" Style="margin-left: 20px;" runat="server" Text="Phone 1:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtPhone1" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblEmail" Style="margin-left: 20px;" runat="server">Email :</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtEmail" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                </div>


                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblCategory" Style="margin-left: 20px;" runat="server" Text="Category"></asp:Label>
                    </div>
                    <div class="col-lg-3">

                        <asp:DropDownList ID="drpCategory" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                            <asp:ListItem>Furniture</asp:ListItem>
                            <asp:ListItem>Industrial</asp:ListItem>
                            <asp:ListItem>Others</asp:ListItem>
                            <asp:ListItem>Manufacturing</asp:ListItem>

                        </asp:DropDownList>



                    </div>
                    <div class="col-lg-1"></div>
                  <%--  <div class="col-lg-2">
                        <asp:Label ID="lblstatus" Style="margin-left: 20px;" runat="server" Text="Status:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtStatus" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                    </div>--%>

                </div>

                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblRef" Style="margin-left: 20px;" runat="server" Text="Reference:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtRef" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-lg-1"></div>
                  <div class="col-lg-2">
                        <asp:Label ID="lblSubject" Style="margin-left: 20px;" runat="server" Text="Subject:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtSubject" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                </div>
                <br />
                <%--  <div class="row">--%>
                <%--<div class="col-lg-1"></div>--%>
                <asp:Panel runat="server" GroupingText="Item" ID="panelItem" Direction="LeftToRight" HorizontalAlign="Center">
                    <%--<div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-2" style="margin-left: -40px;">
                            <asp:Label ID="lblitemSelect" Style="margin-left: 20px;" runat="server" Text="Select Item:"></asp:Label>
                        </div>
                        <div class="col-lg-3">

                            <asp:DropDownList ID="drpItem" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpItem_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>

                        <div class="col-lg-1"></div>
                    </div>--%>
                    <br />
                    <div class="row">
                        <div class="col-lg-1"></div>
                        <div class="col-lg-10 gridformat" style="overflow: scroll">
                            <asp:GridView ID="GvIQitem" Width="100%" ShowHeaderWhenEmpty="true" DataKeyNames="QDetailID" Style="border-bottom: 1px solid #b2a9a9;" ShowFooter="true" CssClass="table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnRowDataBound="GvIQitem_RowDataBound" AutoGenerateSelectButton="False" OnRowCommand="GvIQitem_RowCommand" OnSelectedIndexChanged="GvIQitem_SelectedIndexChanged" OnRowDeleting="GvIQitem_RowDeleting" OnRowEditing="GvIQitem_RowEditing" OnRowUpdating="GvIQitem_RowUpdating">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

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

                                    <asp:TemplateField HeaderText="Id" Visible="false" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
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
                                            <asp:DropDownList ID="drpFItemName" AutoPostBack="true" CssClass="custom-select-md" OnSelectedIndexChanged="drpFItemName_SelectedIndexChanged" runat="server">
                                            </asp:DropDownList>

                                        </FooterTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Qnty" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lblQnty" runat="server" Text='<%# Eval("Qty") %>'></asp:Label>

                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtEQnty" class="form-control" AutoPostBack="true" OnTextChanged="txtEQnty_TextChanged" runat="server" Text='<%# Eval("Qty") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:TextBox ID="txtFQnty" class="" runat="server" OnTextChanged="txtFQnty_TextChanged" AutoPostBack="True"></asp:TextBox>
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
                                            <asp:TextBox ID="txtFRate" OnTextChanged="txtFRate_TextChanged" AutoPostBack="true"
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
                                            <asp:TextBox ID="txtFDiscount" class="" AutoPostBack="true" OnTextChanged="txtFDiscount_TextChanged" runat="server"></asp:TextBox>

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


                                            <asp:DropDownList ID="drpETaxClass" AutoPostBack="true"  OnSelectedIndexChanged="drpETaxClass_SelectedIndexChanged" CssClass="form-control custom-select-md" runat="server">
                                            </asp:DropDownList>
                                        </EditItemTemplate>

                                        <FooterTemplate>
                                            <asp:DropDownList ID="drpFTaxClass" AutoPostBack="true" CssClass="form-control custom-select-md" OnSelectedIndexChanged="drpFTaxClass_SelectedIndexChanged" runat="server">
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
                                            <asp:Label ID="lblEgst" runat="server" Text='<%# Eval("IGSTAmount") %>'></asp:Label>
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

                                <FooterStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White"></FooterStyle>

                                <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White"></HeaderStyle>

                                <PagerStyle HorizontalAlign="Center" ForeColor="#0066ff"></PagerStyle>

                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                                <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                                <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                                <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                                <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                            </asp:GridView>
                        </div>
                        <div class="col-lg-1"></div>
                    </div>
                </asp:Panel>
                <%--</div>--%>
                <br />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10 gridformat">
                        <%-- <asp:gridview id="GvIQitem" Style="border-bottom:1px solid #b2a9a9;" ShowFooter="true" cssclass="table" runat="server" cellpadding="4" forecolor="#333333" gridlines="None" autogeneratecolumns="False"  allowpaging="True" pagesize="5" OnRowDataBound="GvIQitem_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                        <Columns>
                            <asp:TemplateField ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:LinkButton ID="btnAdd" runat="server" CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>

                            <asp:TemplateField HeaderText="Item" FooterStyle-VerticalAlign="Middle" ControlStyle-Width="100px">
                            <ItemTemplate>
                                <asp:Label ID="lblItem" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="drpEItem" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True">
                                            </asp:DropDownList> 
                                </EditItemTemplate>
                            <FooterTemplate>
                                        <asp:DropDownList ID="drpFItem" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True" >
                                            </asp:DropDownList> 

                            </FooterTemplate>
                        </asp:TemplateField>
                             <asp:TemplateField HeaderText="Specification">
                            <ItemTemplate>
                                <asp:Label ID="lblSpecification" runat="server" Text='<%# Eval("Specification") %>'></asp:Label>
                            </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="drpESpecification" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True">
                                            </asp:DropDownList> 
                                </EditItemTemplate>
                            <FooterTemplate>
                                        <asp:DropDownList ID="drpFSpecification" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True" >
                                            </asp:DropDownList> 

                            </FooterTemplate>
                        </asp:TemplateField>
                        </Columns>

                        <EditRowStyle BackColor="#999999"></EditRowStyle>

                    <FooterStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White"></FooterStyle>

                    <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White"></HeaderStyle>

                    <PagerStyle HorizontalAlign="Center" ForeColor="#0066ff"></PagerStyle>

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:gridview>--%>
                        <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SaleskitCRMConnectionString %>' SelectCommand="SELECT [ItemID], [Name], [Specification], [Price], [HSNCode] FROM [Item]"></asp:SqlDataSource>
                    </div>
                    <div class="col-lg-1"></div>
                </div>

                <br />

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-3">
                        <asp:LinkButton ID="lnkSelectDesignation" Style="position: absolute; top: 2px; left: 150px; border-radius: 10px; border: 3px solid #61A4DB; margin-left: -80px" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn">Terms and Condition</asp:LinkButton>

                        <%--<asp:Button ID="btn_EditTNC" data-toggle="modal" style="position:absolute" data-target="#myModal" CssClass="btn btn-light" runat="server" Text="Edit Term & Conditions"/>--%>
                    </div>
                    <div class="col-lg-1" style="margin-top: 7px;">
                        <asp:CheckBox runat="server" ID="chkAllTNC" AutoPostBack="true" Style="margin-left: -100px;" Text="All T&C" OnCheckedChanged="chkAllTNC_CheckedChanged" />
                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblAmount" Style="margin-left: -20px;" runat="server" Text="Amount:"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:TextBox ID="txtAmount" class="form-control" Style="margin-left: -185px;" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblNetAmount" Style="margin-left: 20px;" runat="server" Text="Net Amount(With Tax):"></asp:Label>
                    </div>
                    <div class="col-lg-1">
                        <asp:TextBox ID="txtNetAmount" class="form-control" Style="margin-left: -80px;" runat="server"></asp:TextBox>
                    </div>
                </div>
                <br />

                <div class="modal" id="myModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Terms And Condition</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">

                                <asp:GridView EmptyDataText="No Data Found" Width="100%" DataKeyNames="TNCID" runat="server" ID="GVTNC" CssClass="table" ShowFooter="true" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" OnRowDataBound="GVTNC_RowDataBound">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblId" Text='<%# Eval("TNCID") %>' runat="server"></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkSelect" runat="server" Text='<%# Eval("TNCID") %>' CommandName="Select" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Terms&Condition">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltandc" Text='<%# Eval("TNC_Desc") %>' runat="server"></asp:Label>

                                            </ItemTemplate>
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

                            <div class="modal-footer" style="text-align: center">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Save</button>
                            </div>

                        </div>
                    </div>
                </div>


                <hr />
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-8">
                        <div class="row">


                            <div class="col-lg-1">
                                <asp:Label ID="lblCC" Style="margin-left: 40px;" runat="server" Text="CC:"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtCC" Style="margin-left: 40px;" class="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-1"></div>

                            <div class="col-lg-1">
                                <asp:Label ID="lblBCC" Style="margin-left: 100px;" runat="server" Text="BCC:"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <asp:TextBox ID="txtBCC" Style="margin-left: 100px;" class="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2" style="margin-top: 7px;">
                        <asp:CheckBox runat="server" ID="chkSendmail" AutoPostBack="false" Text="Send Mail" />
                    </div>

                </div>
                <br />
                <br />
                <div class="row">

                    <div class="col-lg-1"></div>
                    <div class="col-lg-8">
                        <div class="row">


                            <div class="col-lg-2">
                                <asp:Label ID="lblfileupload" Style="margin-left: 40px;" runat="server" Text="Browse File:"></asp:Label>
                            </div>
                            <div class="col-lg-1">
                                <asp:FileUpload ID="quotefileupload" runat="server"></asp:FileUpload>
                            </div>
                            <div class="col-lg-1"></div>


                            <div class="col-lg-3">
                                <asp:Button ID="btn_Fileupload" Style="margin-left: 100px;" Text="Add File" class="btn btn-light" runat="server" OnClick="btn_Fileupload_Click" />
                            </div>
                        </div>
                        <div class="row" style="overflow: auto;">
                            <div class="col-lg-8">
                                <asp:GridView runat="server" Width="100%" ID="GVAttachment" EmptyDataText="No record" ShowFooter="true" ShowHeaderWhenEmpty="true" Font-Size="Medium" CssClass="table" RowStyle-Height="7px" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Vertical" DataKeyNames="" AllowPaging="True" PageSize="3">
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
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3" style="margin-top: 7px; margin-left: -70px;">
                        <asp:Label runat="server" ID="lblNextDate" AutoPostBack="false" Text="Next Followup Date" Style="margin-left: 70px;" />
                        <br />
                        <asp:TextBox ID="txtNextDate" Style="margin-left: 70px; max-width: 180px;" class="form-control" runat="server"></asp:TextBox>
                        <asp:LinkButton ID="lnknextfollowp" runat="server" Style="position: absolute; top: 30px; left: 260px;" CssClass="btn btn-calender" OnClick="Calender1_Click"><span aria-hidden="true" class="fa fa-calendar"></span></asp:LinkButton>
                    </div>
                    <div class="row" style="position: absolute; top: 1255px; left: 850px; width: 140px; height: 30px; z-index: 1;">
                        <div class="col-lg-8"></div>
                        <div class="col-lg-2">
                            <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="Calendar1_SelectionChanged">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                <DayStyle Width="14%" />
                                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                <OtherMonthDayStyle ForeColor="#999999" />
                                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                <TodayDayStyle BackColor="#CCCC99" />
                            </asp:Calendar>
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmitInq_Click" />
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                    <div class="col-lg-4"></div>
                </div>
                  <asp:Label ID="lblPICheck" runat="server"  Visible="false"></asp:Label>
        </ContentTemplate>
        <Triggers>
             <asp:PostBackTrigger ControlID="btnSubmitInq" />

            <asp:PostBackTrigger ControlID="btn_Fileupload" />
        </Triggers>
         </asp:UpdatePanel>
                  </form>
</asp:Content>

