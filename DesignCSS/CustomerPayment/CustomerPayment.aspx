<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CustomerPayment.aspx.cs" Inherits="CustomerPayment_CustomerPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <form runat="server" id="inqform">
        
       <br />
            <div class="row">
               
                <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Customer Payment</u></h4>
                </div>

            </div>
           
            
         
            <div class="row">
                  
                <div class="col-lg-1"></div>    <%--left--%>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblRecieptNo" Style="margin-left: 20px;" runat="server" Text="Receipt No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtRecieptNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>
               
                <div class="col-lg-2">    <%-- right--%>
                    <asp:Label ID="lblReceiptDate" Style="margin-left: 20px;" runat="server">Receipt Date:</asp:Label>
                </div>
                <div class="col-lg-3">
                   
                   <asp:TextBox ID="txtReceiptDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                        
                    
                   
                </div>
            </div>
            
            <br />
          <div class="row">
                  
                <div class="col-lg-1"></div>    <%--left--%>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblCustomername" Style="margin-left: 20px;" runat="server" Text="CustomerName:"></asp:Label>
                </div>
                <div class="col-lg-8">
                  <asp:DropDownList ID="DrpCustName" style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                        <asp:ListItem>Ambica Enterprise</asp:ListItem>
                        <asp:ListItem>Donalt Pvt Ltd.</asp:ListItem>
                      
                      </asp:DropDownList>
                </div>
               <div class="col-lg-1"></div> 
             
            </div>





          <br />

            <div class="row">
                <div class="col-lg-1"></div>
                  <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblPaymentDetail" Style="margin-left: 20px;" runat="server" Text="Payment Detail:"></asp:Label>
                </div>
                <div class="col-lg-8" >
                    <asp:GridView ShowHeaderWhenEmpty="true" Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;  margin-left: -40px;" ID="GridView1" CssClass="table"  runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5" Font-Size="Small">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>
                                    <asp:TemplateField HeaderText="Select">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSelect" runat="server" />

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PaidAmount" HeaderText="PaidAmount" SortExpression="PaidAmount"></asp:BoundField>
                                    <asp:BoundField DataField="NetAmount" HeaderText="NetAmount" SortExpression="NetAmount"></asp:BoundField>
                                    <asp:CheckBoxField DataField="IsPaid" HeaderText="IsPaid" SortExpression="IsPaid" />
                                    <asp:BoundField DataField="ReminderDate" HeaderText="ReminderDate" SortExpression="ReminderDate"></asp:BoundField>
                                    <asp:BoundField DataField="SalesDate" HeaderText="SalesDate" SortExpression="SalesDate"></asp:BoundField>
                                    <asp:BoundField DataField="SalesCode" HeaderText="SalesCode" SortExpression="SalesCode"></asp:BoundField>

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
                            <div>No Record Found</div>
                        </EmptyDataTemplate>
                            </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [PaidAmount], [NetAmount], [IsPaid], [ReminderDate], [SalesDate], [SalesCode] FROM [SalesInvoice]"></asp:SqlDataSource>
                </div>
                <div class="col-lg-1"></div>
            </div>
        

        <!--Second Row-->
        <br />

        <div class="row">
            <div class="col-lg-1"></div>    <%--left--%>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblCurrency" Style="margin-left: 20px;" runat="server" Text="Currency:"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:DropDownList ID="DrpCurrency" style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                        <asp:ListItem>Rs.</asp:ListItem>
                        <asp:ListItem>$</asp:ListItem>
                      
                      </asp:DropDownList>
                </div>
               
                <div class="col-lg-2">    <%-- right--%>
                    <asp:Label ID="lblTotalAmnt" Style="margin-left: 20px;" runat="server">Total Ammount:</asp:Label>
                </div>
                <div class="col-lg-3">
                <asp:TextBox ID="txttotalAmnt" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
        </div>

        <br />

        <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblPaymentMode" style="margin-left: 20px;" runat="server" Text="PaymentMode:"></asp:Label>
			</div>
			<div class="col-lg-3">
                        <asp:DropDownList ID="drpPaymentMode" style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                        <asp:ListItem>Cash.</asp:ListItem>
                        <asp:ListItem>Cheque</asp:ListItem>
                      
                      </asp:DropDownList>				
			</div>
			
			<div class="col-lg-2"  >
				<asp:label ID="lblNaration" style="margin-left: 20px;" runat="server">Narrarion:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtNaration" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
		</div>
        <br />

        

        <br />
            <hr />
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-1">
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" />
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>

       
    </form>
</asp:Content>

