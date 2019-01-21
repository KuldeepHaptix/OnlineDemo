<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeDetail.aspx.cs" Inherits="AllMaster_EmployeeDetail" %>

<!DOCTYPE html>





<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <title></title>
</head>
<body>
    
   
   <div class="container">
        <form  id="form1" runat="server">

            <br />
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3"><h5>Enter Your Detail</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />
          
        <%--    <asp:Panel ID="panelOtp" runat="server">
                <div style="visibility: visible">
                    <div class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-3">
                            <asp:Label ID="lblEmail" runat="server">Enter Email</asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:TextBox ID="txtEmail" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <div class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-3">
                            <asp:Label ID="lblOtp" runat="server">Enter OTP</asp:Label>
                        </div>
                        <div class="col-lg-2">
                            <asp:TextBox ID="txtotp" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
                        </div>

                    </div>
                    <br />
                    <div class="row">
                        <div class="col-lg-5"></div>
                        <div class="col-lg-6">
                            <asp:Button ID="btnsubmit" Width="80px" runat="server" CssClass="btn btn-light" Text="Submit" OnClick="btnsubmit_Click" />
                        </div>
                    </div>

                </div>
            </asp:Panel>--%>

        <asp:Panel ID="paneldiv" runat="server">
         <div id="detailDIV" runat="server" >
              <div class="col-lg-3" ></div>
                    <div class="row">
                        <div class="col-lg-3" ></div>
                            <div class="col-lg-4" >
                                <asp:Label ID="lblAddress"  runat="server">Address</asp:Label>
                            </div>
                            <div class="col-lg-4" >
                       
                                <asp:TextBox ID="txtAddress" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>
                                                                        
                              </div>
                         </div>
                    <br />


             <div class="row">
                 <div class="col-lg-3" ></div>
                
                    
                    <div class="col-lg-4" >
                        <asp:Label ID="lblPhoneNo"  runat="server">Phone NO</asp:Label>
                    </div>
                    <div class="col-lg-4" >
                       
                    <asp:TextBox ID="txtPhone"  class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                        </div>
                    </div>

            <br />


            
             <div class="row">

                   <div class="col-lg-3" ></div>
                    
                    <div class="col-lg-4" >
                        <asp:Label ID="lblMobile"  runat="server">Mobile No</asp:Label>
                    </div>
                    <div class="col-lg-4" >
                       
                    <asp:TextBox ID="txtMobile"  class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                        </div>
                    
                   
                </div>

            <br />

              
             <div class="row">

                   
                    <div class="col-lg-3" ></div>
                    <div class="col-lg-4" >
                        <asp:Label ID="lblDOB"  runat="server">Date Of Birth</asp:Label>
                    </div>
                    <div class="col-lg-4" >
                       
                        <asp:TextBox ID="txtDOB"  class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>
                        <asp:linkbutton id="lnknextfollowp" Style="position:absolute;top:5px;left:148px;" runat="server" CssClass="btn btn-calender" OnClick="lnknextfollowp_Click" ><span aria-hidden="true" class="fa fa-calendar"></span></asp:linkbutton>
                        </div>
                         <div class="row" style="position: absolute; top:310px; left:570px; width: 140px; height: 30px; z-index:1;">
                <div class="col-lg-8"></div>
                <div class="col-lg-2">
                    <asp:Calendar ID="datepicker" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="datepicker_SelectionChanged" >
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
            <div class="row">

                
                    <div class="col-lg-3" ></div>
                    <div class="col-lg-4" >
                        <asp:Label ID="lblPassword"  runat="server">Password</asp:Label>
                    </div>
                    <div class="col-lg-4" >
                       
                 <asp:TextBox ID="txtPassword"  class="form-control" Style="margin-left: -200px;" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                    
                   
                </div>
                <br />
             <div class="row">
              
                <div class="col-lg-3" ></div>
                    
                    <div class="col-lg-4" >
                        <asp:Label ID="lblConfirmPwd"  runat="server">Confirm Password</asp:Label>
                    </div>
                    <div class="col-lg-4" >
                       
                 <asp:TextBox ID="txtConfirmPwd"  class="form-control" Style="margin-left: -200px;" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:Label ID="lblconfirmmsg" runat="server" ForeColor="Red" Text="*"></asp:Label>
                </div>
                    
                   
                </div>
            <br />
            <div class="row">
                   <div class="col-lg-5">
                       </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnSave" Width="80px" runat="server" CssClass="btn btn-light" Text="Submit" OnClick="btnSave_Click"/>
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnCancel" Width="80px" runat="server" CssClass="btn btn-light" Text="Cancel" />
                        </div>
                       
                   
                    </div>
              
           </div>
            
        
        </asp:Panel>
        </form>
    </div>
   
    
</body>
</html>
