<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CompanyRegister.aspx.cs" Inherits="CompanyRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

    
    <title>

    </title>
</head>
<body>
  
    
       <div class="container">
        <form  id="form2" runat="server">

            <br />
           
            <br />
          
       
     
         <div id="divRegister" runat="server" >
             <asp:MultiView ID="MultiView1" runat="server">
                 
                 <asp:View ID="View1" runat="server">
                      <div class="row">
                <div class="col-sm-6"></div>
                <div class="col-sm-2"><h5>Step 1</h5></div>
                <div class="col-sm-4"></div>
                    </div>
                     <br />
                 <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblCompanyName" runat="server">Company Name</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtCompanyName" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                     </div>
                 </div>
                     <br />
                      <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblfirstname" runat="server">First Name</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtFirstName" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                     </div>
                 </div>
                     <br />
                      <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblLastNAme" runat="server">Last Name</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtLastName" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                     </div>
                 </div>
                     <br />
                      <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblemail" runat="server">Email</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtEmail" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ValidationGroup="Email" ID="RequiredFieldValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>

                     </div>
                      <div class="col-lg-1" style="margin-left:-200px;" >
                        <asp:RequiredFieldValidator ValidationGroup="Email" ID="RequiredFieldValidator1" ControlToValidate="txtEmail" runat="server" ErrorMessage="*" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                          <br />
                       </div> 
                 </div>
                      <div class="row">
                     <div class="col-lg-2"></div>
                     <div class="col-lg-3">
                        
                     </div>
                     <div class="col-lg-3">

                        
                     </div>
                      <div class="col-lg-3" style="margin-left:-200px;" >
                      
                         <asp:Label ID="lblemailmsg" runat="server" ForeColor="#CC0000"></asp:Label>
                       </div> 
                 </div>
                     <br />
                <div class="row">
                     <div class="col-lg-6"></div>
                    <div class="col-lg-4">

                        <asp:Button ID="btnNext1" Width="80px" ValidationGroup="Email" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn btn-light" Text="Next" OnClick="btnNext1_Click" />

                     </div>
                 </div>
                     <%-- Model Division --%>

                       <div class="modal" id="myModal">
                  <div class="modal-dialog">
                      <div class="modal-content">

                          <!-- Modal Header -->
                          <div class="modal-header">
                              
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <!-- Modal body -->
                          <div class="modal-body">
                             <h6>We have sent Otp On your Email</h6>
                          </div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
                          </div>

                      </div>
                  </div>
              </div>    
            
                  </asp:View>

                 <%-- Second View --%>
                    <asp:View ID="View2" runat="server">
                      <div class="row">
                <div class="col-sm-6"></div>
                <div class="col-sm-2"><h5>Step 2</h5></div>
                <div class="col-sm-4"></div>
                    </div>
                     <br />
                 <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblotp" runat="server">Enter OTP</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtotp" class="form-control" Style="margin-left: -200px;" runat="server"></asp:TextBox>

                         <asp:Label ID="lblmsgotp" runat="server" ForeColor="Red" Text="*"></asp:Label>

                     </div>
                 </div>
                    
                     <br />
                        <br />
                      <div class="row">
                     <div class="col-lg-5" style="margin-left:20px"></div>
                       <div class="col-lg-1">

                        <asp:Button ID="btnPrev" Width="80px" runat="server" CssClass="btn btn-light" Text="Previous" OnClick="btnPrev_Click"/>

                     </div>
                    <div class="col-lg-3" style="margin-left:20px">

                        <asp:Button ID="btnNext2" Width="80px" runat="server" CssClass="btn btn-light" Text="Next" OnClick="btnNext2_Click1" />

                     </div>
                 </div>
                  </asp:View>
                      <%-- Third View --%>
                <asp:View ID="View3" runat="server">
                <div class="row">
                <div class="col-sm-6"></div>
                <div class="col-sm-2"><h5>Step 3</h5></div>
                <div class="col-sm-4"></div>
                    </div>
                     <br />
                 <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblpwd" runat="server">Enter Password</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtpwd" class="form-control" Style="margin-left: -200px;" runat="server" TextMode="Password"></asp:TextBox>

                     </div>
                    
                     </div>
                    <br />
                    <div class="row">
                     <div class="col-lg-3"></div>
                     <div class="col-lg-4">
                         <asp:Label ID="lblCpwd" runat="server">Confirm Password</asp:Label>
                     </div>
                     <div class="col-lg-4">

                         <asp:TextBox ID="txtCpwd" class="form-control" Style="margin-left: -200px;" runat="server" TextMode="Password"></asp:TextBox>

                         <asp:Label ID="lblmsgpwd" runat="server" ForeColor="Red" Text="*"></asp:Label>

                     </div>
                 </div>
                     <br />
                      <div class="row">
                     <div class="col-lg-6"></div>
                    <div class="col-lg-4">

                        <asp:Button ID="btnNext3" Width="80px" runat="server" CssClass="btn btn-light" Text="Submit" OnClick="btnNext3_Click" />

                     </div>
                 </div>
                  </asp:View>


             </asp:MultiView>

           </div>
            
        
        
        </form>
    </div>
   
  
</body>
</html>
