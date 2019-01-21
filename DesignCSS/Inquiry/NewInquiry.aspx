<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="NewInquiry.aspx.cs" Inherits="InqEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 
      <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--For Collapse-->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!--end-->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
    <!--<link href="CSS/font-awesome.min.css" rel="stylesheet"/>-->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form runat="server" id="inqform">
        
       
            <div class="row">
               
                <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Lead</u></h4>
                </div>

            </div>
           
            

            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblinqcode" Style="margin-left: 20px;" runat="server" Text="Inquiry Code:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtCode"  CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-2">
                    <asp:Label ID="lblInqDate" Style="margin-left: 20px;" runat="server">Inquiry Date:</asp:Label>
                </div>
                <div class="col-lg-3">
                    <div class="row">
                        <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                        <asp:ImageButton ID="Calender" ImageUrl="~/Images/calendar.png" runat="server" CssClass="btn btn-light" OnClick="Calender_Click" />
                    </div>
                </div>
            </div>
            <div class="row" style="position: absolute; top: 180px; left: 850px; width: 140px; height: 30px; z-index:1;">
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
            <br />
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblAppTaken" Style="margin-left: 20px;" runat="server" Text="AppTaken:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:DropDownList ID="drpApptaken" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                        
                    </asp:DropDownList>
                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-2">
                    <asp:Label ID="lblAllocatedTo" Style="margin-left: 20px;" runat="server" Text="AllocatedTo"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:DropDownList ID="drpAllocated" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                       
                    </asp:DropDownList>
                </div>

            </div>
        

        <!--Second Row-->
        <br />

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblcustomername" Style="margin-left: 20px;" runat="server" Text="Customer Name:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtcustomerName" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            	<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblContactPerson" style="margin-left: 20px;" runat="server">Contact Person:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtContactPerson" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
        </div>

        <br />

        <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblAddressline1" style="margin-left: 20px;" runat="server" Text="AddressLine1:"></asp:Label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtAddressline1"  class="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
				
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblAddressline2" style="margin-left: 20px;" runat="server">AddressLine2:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtAddressline2" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
		</div>
        <br />
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblCity" Style="margin-left: 20px;" runat="server" Text="City:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:DropDownList ID="drpCity" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server" AutoPostBack="True" OnSelectedIndexChanged="drpCity_SelectedIndexChanged">
                   
                </asp:DropDownList>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblArea" Style="margin-left: 20px;" runat="server" Text="Area"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:DropDownList ID="drpArea" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">

                   
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
                   
                </asp:DropDownList>
            </div>
            <div class="col-lg-1"></div>
             <div class="col-lg-2" >
                <asp:Label ID="lblMobile" Style="margin-left: 20px;" runat="server" Text="Mobile:"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:TextBox ID="txtMobileCode" class="form-control" Style="margin-left:-45px;"  runat="server" Value="+91"></asp:TextBox>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtMobile" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
        </div>

        <br />

         <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblPhone1" style="margin-left: 20px;" runat="server" Text="Phone 1:"></asp:Label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtPhone1"  class="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
				
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblEmail" style="margin-left: 20px;" runat="server">Email :</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtEmail" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
		</div>

        <%--<div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblemail" Style="margin-left: 20px;" runat="server" Text="Phone:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtEmail" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblmobile" Style="margin-left: 20px;" runat="server" Text="Mobile:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtMobile" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>

        </div>--%>

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
            <div class="col-lg-2">
                <asp:Label ID="lblwebsite" Style="margin-left: 20px;" runat="server" Text="Website:"></asp:Label>
            </div>
            <div class="col-lg-3">
                 <asp:TextBox ID="txtWebsite" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>

        </div>

        <br />

       <div class="col-lg-12">
            <hr />
             <h5>Additional Contact Details</h5>
             <%--<button type="button" id="btnContactdetail" data-toggle="collapse" data-target="#ContactDetail" class="btn btn-info">
                <h5>Contact Person <i class="fa fa-arrow-caret-down"></i></h5>
            </button>--%>


        </div>
        <br />

        <div id="ContactDetail">
           <div class="row">
            <div class="col-lg-1"></div>
			<div class="col-lg-10 gridformat"  style="overflow-x:scroll;" >
                <asp:GridView ID="GvContactDetail"  ShowFooter="true" CssClass="table" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnRowCommand="GvContactDetail_RowCommand" OnRowDeleting="GvContactDetail_RowDeleting">
                  
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="50px">
                            <ItemTemplate>
<%--                                <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>--%>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <FooterTemplate>
                                <asp:LinkButton ID="btnAdd" runat="server" CommandName="AddNew" Text="Add"><span class="fa fa-plus"></span></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="ContactName">
                            <ItemTemplate>
                                <asp:Label ID="lblcontactname" runat="server" Text='<%# Eval("ContactName") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEcotactname" Text='<%# Eval("ContactName") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFcontactName" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Designation">
                            <ItemTemplate>
                                <asp:Label ID="lblDesignation" runat="server" Text='<%# Eval("Designation") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEdesignation" Text='<%# Eval("Designation") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFdesignation" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Phone">
                            <ItemTemplate>
                                <asp:Label ID="lblphone" runat="server" Text='<%# Eval("Phone1") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEphone" Text='<%# Eval("Phone1") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFphone" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>


                          <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                                <asp:Label ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEMobile" Text='<%# Eval("Mobile") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFMobile" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEEmail" Text='<%# Eval("Email") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFEmail" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                      
                       
                         <asp:TemplateField HeaderText="Date Of Birth">
                            <ItemTemplate>
                                <asp:Label ID="lblDob" runat="server" Text='<%# Eval("DoB") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEDob" Text='<%# Eval("DoB") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFDob" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="Date Of Aniversary">
                            <ItemTemplate>
                                <asp:Label ID="lblDoA" runat="server" Text='<%# Eval("DoA") %>'></asp:Label>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:TextBox ID="txtEDoA" Text='<%# Eval("DoA") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFDoA" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>

                        
                    </Columns>

                    <EditRowStyle BackColor="#999999"></EditRowStyle>

                   <FooterStyle BackColor="#CCCCCC" />

                     <HeaderStyle BackColor="#61A4DB" Font-Bold="True" ForeColor="White" />

                     <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />

                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                    <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

                    <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

                    <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

                    <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
            </div>
            
		</div>

        </div>







        <div class="col-lg-12">
            <hr />
            <h5>Additional Details</h5>

        </div>
        <br />
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblSourceOfInq" Style="margin-left: 20px;" runat="server" Text="Source Of Inquiry:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:DropDownList ID="drpSourceOfInq" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                    <asp:ListItem>--Select--</asp:ListItem>
                    <asp:ListItem>Facebook</asp:ListItem>
                    <asp:ListItem>Friend</asp:ListItem>
                    <asp:ListItem>Refrence</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblinqStatus" Style="margin-left: 20px;" runat="server" Text="Inquiry Status"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:DropDownList ID="drpInqStatus" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">

                    <asp:ListItem>Hot</asp:ListItem>
                    <asp:ListItem>Worm</asp:ListItem>
                    <asp:ListItem>Cold</asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblbudget" Style="margin-left: 20px;" runat="server" Text="Budget:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtbudget" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblnextfollowp" Style="margin-left: 20px;" runat="server" Text="Next Followup"></asp:Label>
            </div>
            <div class="col-lg-3">
                <div class="row">
                    <asp:TextBox ID="txtNextFolowUp" class="form-control" Style="margin-left: -35px; max-width: 266px;" runat="server"></asp:TextBox>
                        <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/calendar.png" runat="server" CssClass="btn btn-light" OnClick="ImageButton1_Click"  />
                </div>
            </div>

        </div>

          <div class="row" style="position: absolute; top:1000px; left: 850px; width: 140px; height: 30px; z-index:1;">
                <div class="col-lg-8"></div>
                <div class="col-lg-2">
                    <asp:Calendar ID="Calendar1" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="Calendar1_SelectionChanged" >
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
        <br />
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblProdServcReq" Style="margin-left: 20px;" runat="server" Text="Product/Service Req:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtProSerReq" TextMode="MultiLine" class="form-control" Style="margin-left: -50px; height: 100px" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblRemarks" Style="margin-left: 20px;" runat="server" Text="Remarks"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtRemarks" TextMode="MultiLine" class="form-control" Style="margin-left: -50px; height: 100px" runat="server"></asp:TextBox>
            </div>

        </div>

        <div class="col-lg-12">
            <hr />
            <h5>Account Detail</h5>
           <%-- <button type="button" id="btnBankdetail" data-toggle="collapse" data-target="#AcDetail" class="btn btn-info">
                <h5>Account Detail <i class="fa fa-arrow-circle-down"></i></h5>
            </button>--%> 


        </div>
        <br />

        <div id="AcDetail">
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblGSTIN" Style="margin-left: 20px;" runat="server" Text="GSTIN No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtgstinno" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-2">
                    <asp:Label ID="lblPanno" Style="margin-left: 20px;" runat="server" Text="PAN No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtPanNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
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
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>










       
    </form>
</asp:Content>

