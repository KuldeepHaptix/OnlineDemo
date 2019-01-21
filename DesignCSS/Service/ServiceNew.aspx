<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="ServiceNew.aspx.cs" Inherits="Service_ServiceNew" %>

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
                <h4 style="text-align: center; margin-bottom: 30px;"><u>Service Request</u></h4>
            </div>
        </div>

        <form runat="server" class="form-control">
            <div class="row">
                <div class="col-lg-8">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblServiceNo" runat="server" CssClass="mr-sm-2" Text="Service No:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtServiceNo" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblSaleDate" runat="server" CssClass="mr-sm-2" Text="Sale Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSaleDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblAppTaken" runat="server" CssClass="mr-sm-2" Text="App Taken By:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpTaken" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Palak</asp:ListItem>
                                        <asp:ListItem>Daksha</asp:ListItem>
                                        <asp:ListItem>Arpit</asp:ListItem>
                                        <asp:ListItem>Minakshi</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">

                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblServiceDate" runat="server" CssClass="mr-sm-2" Text="Request Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtServiceDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblWarrantyDate" runat="server" CssClass="mr-sm-2" Text="Warranty Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtWarranty" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblAllocated" runat="server" CssClass="mr-sm-2" Text="Allocated By:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpAllocated" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Daksha</asp:ListItem>
                                        <asp:ListItem>Palak</asp:ListItem>
                                        <asp:ListItem>Arpit</asp:ListItem>
                                        <asp:ListItem>Minakshi</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblCustomerName" runat="server" CssClass="mr-sm-2" Text="Customer Name:"></asp:Label>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtCustomerName" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblAddress" runat="server" CssClass="mr-sm-2" Text="Address:"></asp:Label>
                        </div>
                        <div class="col-sm-10">
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
                                    <asp:Label ID="lblCallType" runat="server" CssClass="mr-sm-2" Text="CallType:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpCallType" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Service</asp:ListItem>
                                        <asp:ListItem>Repair</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
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
                                    <asp:DropDownList ID="DrpStatus" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Status1</asp:ListItem>
                                        <asp:ListItem>Status2</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <h5 class="mb-3">Product Details</h5>
                    </div>
                    <div class="row">
                         <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblProduct" runat="server" CssClass="mr-sm-2" Text="Product:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpProduct" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Select Product</asp:ListItem>
                                        <asp:ListItem>Product2</asp:ListItem>
                                        <asp:ListItem>Product3</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblMake" runat="server" CssClass="mr-sm-2" Text="Make:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpMake" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Select Make</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblSrNo" runat="server" CssClass="mr-sm-2" Text="Sr No:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:DropDownList ID="DrpSrNo" CssClass="form-control custom-select-md mr-sm-2 mb-2" runat="server">
                                        <asp:ListItem>Select Sr No</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblDetails" runat="server" CssClass="mr-sm-2" Text="Details:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDetails" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblProblem" runat="server" CssClass="mr-sm-2" Text="Problem:"></asp:Label>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtProblem" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="lblSolution" runat="server" CssClass="mr-sm-2" Text="Solutions:"></asp:Label>
                        </div>
                        <div class="col-sm-10">
                            <asp:TextBox ID="txtSolution" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblEstimate" runat="server" CssClass="mr-sm-2" Text="Estimate:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtEstimate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblSoldate" runat="server" CssClass="mr-sm-2" Text="Solution Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSolutionDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblDeliveryDate" runat="server" CssClass="mr-sm-2" Text="Delivery Date:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtDeliveryDate" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8"></div>
                                <asp:Button ID="btn_DealerDetail" Style="margin-left:12px;" runat="server" Text="Dealer Detail" CssClass="btn btn-light" />
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <h5 class="mb-3">Spares Used</h5>
                    </div>
                    <div class="row" style="overflow-x: auto;">
                        <div class="col-lg-12">
                            <asp:GridView ID="GridView1" Width="100%" CssClass="table" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="4" Font-Size="Small">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code"></asp:BoundField>
                                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
                                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price"></asp:BoundField>
                                    <asp:BoundField DataField="CurrencyID" HeaderText="CurrencyID" SortExpression="CurrencyID"></asp:BoundField>
                                    <asp:BoundField DataField="HSNCode" HeaderText="HSNCode" SortExpression="HSNCode"></asp:BoundField>

                                    <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
                                    <asp:BoundField DataField="Specification" HeaderText="Specification" SortExpression="Specification" />

                                    <asp:ButtonField CommandName="Select" ShowHeader="True" ButtonType="Link" HeaderText="Add"><ItemStyle ForeColor="#61A4DB" CssClass="fa fa-plus" /></asp:ButtonField>
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
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-lg-8">
                                    <asp:Button ID="btn_EditTNC" runat="server" Text="Edit T&C" CssClass="btn btn-light mb-2" />
                                </div>
                                <div class="col-lg-4">
                                    <asp:CheckBox ID="chkallTnC" runat="server" CssClass="mr-5" Text="All T&C" />
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
                                    <asp:Label ID="lblSpCharges" runat="server" CssClass="mr-sm-2" Text="Spare Charges:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSpCharges" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <asp:Label ID="lblSvCharges" runat="server" CssClass="mr-sm-2" Text="Service Charges:"></asp:Label>
                                </div>
                                <div class="col-sm-8">
                                    <asp:TextBox ID="txtSvCharges" CssClass="form-control mb-2 mr-sm-2" runat="server"></asp:TextBox>
                                </div>
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


                </div>
                <div class="col-lg-4">
                     <div class="row">
                        <h5 class="mb-2">Service Reminders</h5>
                    </div>
                    <div class="row" style="overflow: auto;">
                        <div class="col-lg-12">
                            <asp:GridView  ID="GridView3" Width="100%" CssClass="table" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" AllowPaging="True" PageSize="2" Font-Size="Small" DataKeyNames="DocID" DataSourceID="SqlDataSource1">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="DocName" HeaderText="File Name" SortExpression="DocName"></asp:BoundField>
                                    <asp:BoundField DataField="DocID" HeaderText="File Number" SortExpression="DocID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                    <asp:BoundField DataField="SaleID" HeaderText="Order No" SortExpression="SaleID"></asp:BoundField>

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
                                    <div class="text-left">No records found.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:SaleskitCRMConnectionString %>' SelectCommand="SELECT [DocName], [DocID], [SaleID] FROM [SaleDocList]"></asp:SqlDataSource>
                        </div>
                    </div>
                    <!--Daksha -->
                     <div class="row">
                        <h5 class="mb-2">Document Details</h5>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:Label ID="lblfuOrderDoc" Enabled="false" runat="server" CssClass="mr-sm-2" Text="Select File:"></asp:Label>
                        </div>
                        <div class="col-sm-8">
                            <asp:FileUpload ID="fu_orderDoc" runat="server" CssClass="form-control form-control-file mb-2" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 justify-content-center">
                            <asp:Button ID="BtnAddDoc" class="btn btn-light mb-2" runat="server" Text="Add File" />
                        </div>
                    </div>
                    <div class="row" style="overflow: auto;">
                        <div class="col-lg-12">
                            <asp:GridView ID="GridView2" Width="100%" CssClass="table" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="true" AutoGenerateColumns="False" AllowPaging="True" PageSize="2" Font-Size="Small" DataKeyNames="DocID" DataSourceID="SqlDataSource1">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                                    <asp:BoundField DataField="DocName" HeaderText="File Name" SortExpression="DocName"></asp:BoundField>
                                    <asp:BoundField DataField="DocID" HeaderText="File Number" SortExpression="DocID" InsertVisible="False" ReadOnly="True"></asp:BoundField>
                                    <asp:BoundField DataField="SaleID" HeaderText="Order No" SortExpression="SaleID"></asp:BoundField>

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
                                    <div class="text-left">No records found.</div>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:SaleskitCRMConnectionString %>' SelectCommand="SELECT [DocName], [DocID], [SaleID] FROM [SaleDocList]"></asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>


            <br />
            <div class="row">
            </div>
            <div class="row">

                <div class="col-lg-3">
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="btnSubmitInq" class="btn btn-info mr-sm-2" runat="server" Text="Submit" />
                </div>
                <div class="col-lg-4">
                    <asp:Button ID="btnCalcel" class="btn btn-info" runat="server" Text="Cancel" />
                </div>

            </div>

        </form>


    </div>
</asp:Content>

