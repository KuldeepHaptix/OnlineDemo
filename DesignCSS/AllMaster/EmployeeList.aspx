<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="EmployeeList.aspx.cs" Inherits="AllMaster_EmployeeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div class="container" style="margin-top:30px;">  
    <div class="row">
     
        <div class="col-sm-10">
            <div class="col-sm-12 text-left"> 
                <form runat="server">
                    <div class="row">
                        <div class="col-lg-5">
                            <h3>List Of Employee</h3>
                        </div>
                        <div class="col-lg-3">
                            <asp:Button ID="btnNewEmp" class="btn btn-light" runat="server" Text="+ New Employee" OnClick="btnNewEmp_Click"   />
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
                        <div class="col-lg-12">
                            <asp:GridView Style="box-shadow: 0px 4px 10px 0px rgba(0,0,0,0.2), inset 0px 4px 20px 0 rgba(0,0,0,0.19); border-radius: 5px;" DataKeyNames="EmpID" ID="GVEmployee" CssClass="table" Width="100%" runat="server" CellPadding="1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" Font-Size="Small" OnRowCancelingEdit="GVEmployee_RowCancelingEdit" OnRowCommand="GVEmployee_RowCommand" OnRowDeleting="GVEmployee_RowDeleting" OnRowEditing="GVEmployee_RowEditing">
                                <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                <Columns>

                              <asp:TemplateField HeaderText="Edit/Delete">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkedit" CommandName="RecordEdit" runat="server"  CommandArgument='<%# Eval("EmpID")%>' Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>

                              <%--  <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server" Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>--%>
                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                            </ItemTemplate>

                            <EditItemTemplate>
                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                            </EditItemTemplate>
                          
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="EmpID">
                            <ItemTemplate>
                          <asp:Label  ID="lblEmpID" runat="server" Text='<%# Eval("EmpID") %>'></asp:Label>

                            </ItemTemplate>
                            
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Employee Name">
                            <ItemTemplate>
                          <asp:Label  ID="lblempName" runat="server" Text='<%# Eval("EmpName") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEiempname" Text='<%# Eval("EmpName") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                          <asp:Label  ID="lblAddress" runat="server" Text='<%# Eval("Address") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEAddress" Text='<%# Eval("Address") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>

                                      <asp:TemplateField HeaderText="Department">
                            <ItemTemplate>
                          <asp:Label  ID="lblDepartment" runat="server" Text='<%# Eval("Department") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEDepartment" Text='<%# Eval("Department") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Mobile">
                            <ItemTemplate>
                          <asp:Label  ID="lblMobile" runat="server" Text='<%# Eval("Mobile") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEMobile" Text='<%# Eval("Mobile") %>' runat="server"></asp:TextBox>
                   
                            </EditItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                          <asp:Label  ID="lblEmail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>

                            </ItemTemplate>
                            <EditItemTemplate>
                         
                           <asp:TextBox ID="txtEEmail" Text='<%# Eval("Email") %>' runat="server"></asp:TextBox>
                   
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
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Name], [ActivationStatus], [CreatedBy], [CreatedDate], [CompID], [BranchID], [User_Email], [User_Password], [User_ssl], [TerritoryID], [UserRole] FROM [Gen_User]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SaleskitCRMConnectionString %>" SelectCommand="SELECT [Code], [Name], [Price], [CurrencyID], [HSNCode], [ProductCode], [Specification] FROM [Item]"></asp:SqlDataSource>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                        </div>

                    </div>
                </form> 
     </div>
        

        </div>
    </div>
     

</div>
</asp:Content>

