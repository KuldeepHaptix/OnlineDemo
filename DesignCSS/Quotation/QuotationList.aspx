﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="QuotationList.aspx.cs" Inherits="Quotation_QuotationList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- left side -->
    <div class="container" style="margin-top: 30px;">
        <div class="row">
            <div class="col-sm-2">
                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Todays Quotation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Quotation By Status</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Closed Quotation</a>
                    </li>
                </ul>
            </div>
            <div class="col-sm-10">
                <div class="col-sm-12 text-left">
                    <form runat="server">
                        <div class="row">
                            <div class="col-lg-3">
                                <h3>Quotation</h3>
                            </div>
                            <div class="col-lg-2">
                                <asp:Button ID="btnNewInq" class="btn btn-light" runat="server" Text="+ New Quotation" OnClick="btnNewInq_Click" TabIndex="4" UseSubmitBehavior="False" />
                            </div>
                            <div class="col-lg-2" style="margin-left: 5px;">
                                <asp:Button ID="btn_RevisedQuote" runat="server" CssClass="btn btn-light" Text="Revised Quotation" OnClick="btn_RevisedQuote_Click" UseSubmitBehavior="False" />
                            </div>


                            <div class="col-lg-2" style="margin-left: 20px;">
                                <asp:Button ID="btn_QuoteFollowup" runat="server" CssClass="btn btn-light" Text="Quotation Followup" OnClick="btn_QuoteFollowup_Click" UseSubmitBehavior="False" />
                            </div>
                          <%--  <div class="col-lg-2" style="margin-left: 23px;">
                                <asp:Button ID="btn_generateQuotation" runat="server" Text="Generate Report" class="btn btn-light" OnClick="btn_generateQuotation_Click"></asp:Button>
                            </div>--%>

                            <!-- The Modal -->
                            <%-- <div class="collapse" id="FolloupModal">
                            
                                    <!-- Modal body -->
                                   



                                        <div class="row">

                                            <div class="col-lg-12">
                                                <h4 style="text-align: center; margin-bottom: 30px;"><u>Followup Quotation</u></h4>
                                            </div>

                                        </div>



                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2" style="margin-left: -40px;">
                                                <asp:Label ID="lblinqcode" Style="margin-left: 20px;" runat="server" Text="Inquiry Code:"></asp:Label>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:TextBox ID="txtCode" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2">
                                                <asp:Label ID="lblInqDate" Style="margin-left: 20px;" runat="server">Inquiry Date:</asp:Label>
                                            </div>
                                            <div class="col-lg-3">
                                                <div class="row">
                                                    <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" ReadOnly="true" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                       

                                        <br />

                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2" style="margin-left: -40px;">
                                                <asp:Label ID="Label1" Style="margin-left: 20px;" runat="server" Text="Customer Name:"></asp:Label>
                                            </div>
                                            <div class="col-lg-9">
                                                <asp:TextBox ID="TextBox1" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2" style="margin-left: -40px;">
                                                <asp:Label ID="lblLastFollowupDate" Style="margin-left: 20px;" runat="server" Text="Last Followup Date:"></asp:Label>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:TextBox ID="txtLastFollowupDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                                            </div>
                                            <div class="col-lg-1"></div>
                                        </div>
                                        <br />
                                        <div class="row">
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2" style="margin-left: -40px;">
                                                <asp:Label ID="lblNextDate" Style="margin-left: 20px;" runat="server" Text="Next Followup Date:"></asp:Label>
                                            </div>
                                            <div class="col-lg-3">
                                                
                                                 <asp:TextBox ID="txtNextDate" CssClass="form-control" runat="server" ReadOnly="true" Style="margin-left: -35px; max-width: 266px;"></asp:TextBox>
                                                    <asp:ImageButton ID="ImageButton1" ImageUrl="~/Images/calendar.png" runat="server" CssClass="btn btn-light" OnClick="Calender_Click" />
                                            </div>
                                            <div style="position: absolute; top: 180px; left: 850px; width: 140px; height: 30px; z-index: 1;">
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
                                            <div class="col-lg-1"></div>
                                            <div class="col-lg-2">
                                                <asp:Label ID="lblFollowupBy" Style="margin-left: 20px;" runat="server">Followup By:</asp:Label>
                                            </div>
                                            <div class="col-lg-3">
                                                <asp:DropDownList ID="drpApptaken" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                                                    <asp:ListItem>Shubhangi</asp:ListItem>
                                                    <asp:ListItem>Manthan</asp:ListItem>
                                                    <asp:ListItem>Vandan</asp:ListItem>
                                                    <asp:ListItem>Daksha</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                    

                                   
                        </div>--%>
                            <!-- ENd modal -->
                        </div>

                        <br>
                        <hr>
                        <br>

                        <div class="row">
                            <div class="col-lg-1">
                                <asp:LinkButton ID="btn_refresh" OnClick="btn_refresh_Click" runat="server"><span class="fa fa-refresh"></span></asp:LinkButton>

                            </div>

                            <div class="col-lg-10">

                                <asp:TextBox runat="server" CssClass="form-control" ID="txtsearch" OnTextChanged="txtsearch_TextChanged" Placeholder="Search..."></asp:TextBox>
                                <%--<input class="form-control" id="myInput" type="text" placeholder="Search.." />--%>
                            </div>
                            <div class="col-lg-1">
                                <asp:LinkButton ID="btnSearch" OnClick="btnSearch_Click" runat="server"><span class="fa fa-search"></span></asp:LinkButton>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-12" style="overflow: auto">
                                <asp:GridView ID="GvQuotaion" CssClass="table" runat="server" DataKeyNames="QuotationId" CellPadding="1" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" Font-Size="Small" OnRowCommand="GvQuotaion_RowCommand" OnRowDeleting="GvQuotaion_RowDeleting" OnPageIndexChanging="GvQuotaion_PageIndexChanging">
                                    <%--<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>--%>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Select">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkselect" CommandName="Select" runat="server" CommandArgument='<%# Eval("QuotationId" )%>' Text="Select"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Report">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkReport" runat="server" CommandName="report"
                                                    CommandArgument='<%# Eval("QuotationId") %>'> QuotationTAX </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit/Delete">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkedit" CommandName="RecordEdit" runat="server" CommandArgument='<%# Eval("QuotationId" )%>' Text="Edit"><span class="fa fa-edit mr-sm-3"></span></asp:LinkButton>
                                                <asp:LinkButton ID="btnDelete" CommandName="Delete" runat="server" Text="Delete"><span class="fa fa-trash-o"></span></asp:LinkButton>
                                            </ItemTemplate>

                                            <EditItemTemplate>
                                                <asp:LinkButton ID="btnUpdte" CommandName="Update" runat="server" Text="Update"><span class="fa fa-save mr-sm-3"></span></asp:LinkButton>
                                                <asp:LinkButton ID="btnCancel" CommandName="Cancel" runat="server" Text="Cancel"><span class="fa fa-remove"></span></asp:LinkButton>
                                            </EditItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="QCode">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQno" runat="server" Text='<%# Eval("Code") %>'></asp:Label>
                                            </ItemTemplate>

                                            <%--<EditItemTemplate>
                                <asp:TextBox ID="txtEDob" Text='<%# Eval("DoB") %>' runat="server"></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtFDob" runat="server"></asp:TextBox>
                            </FooterTemplate>--%>
                                        </asp:TemplateField>


                                        <asp:TemplateField HeaderText="Q-Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQdate" runat="server" Text='<%# Eval("QDate") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="CustomerName">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcustomername" runat="server" Text='<%# Eval("CustomerName") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="ContactPerson">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcontactpersn" runat="server" Text='<%# Eval("ContactPerson") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Mobile">
                                            <ItemTemplate>
                                                <asp:Label ID="lblmobile" runat="server" Text='<%# Eval("LeadMobile") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Email">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("LeadEmail") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="NextFollowUP">
                                            <ItemTemplate>
                                                <asp:Label ID="lblNextFollowup" runat="server" Text='<%# Eval("FollowupDate1") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="TotalAmount">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltotalamount" runat="server" Text='<%# Eval("TotalAmount") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="NetAmount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblnetamount" runat="server" Text='<%# Eval("NetAmount") %>'></asp:Label>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <asp:Label ID="lblremarks" runat="server" Text='<%# Eval("Remark") %>'></asp:Label>
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
                                </asp:GridView>
                                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:TESTConnectionString %>' SelectCommand="SELECT * FROM [Employee]"></asp:SqlDataSource>
                            </div>

                        </div>
                    </form>
                </div>


            </div>
        </div>


    </div>
    <!-- End-->

    </div>
     
     </div>
     
     </div>
     
</asp:Content>

