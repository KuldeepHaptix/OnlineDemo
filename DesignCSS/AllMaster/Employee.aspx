<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs" Inherits="AllMaster_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <%-- Employee New --%>
     <div class="container">
        <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-5"></div>
                <div class="col-sm-3"><h5>New Employee</h5></div>
                <div class="col-sm-4"></div>
            </div>
            <br />
          <div class="row">
               <div class="col-lg-6">
               <div class="row">
                 
                   
                    
                    <div class="col-lg-6" >
                        <asp:Label ID="lblCompName"   runat="server">Company Name:</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                    <asp:TextBox ID="txtCompname" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
                     </div>
                    
                    
                </div>
            <br />
               <div class="row">

                 
                    
                    <div class="col-lg-6" >
                        <asp:Label ID="lblBranchName"  runat="server">Branch Name:</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                       
                    <asp:DropDownList CssClass="form-control" Style="margin-left: -150px; " ID="DrpBranch" runat="server">
                            <asp:ListItem>Saleskit Vadodara</asp:ListItem>
                            <asp:ListItem>Saleskit Ahemedabad</asp:ListItem>
                             <asp:ListItem>Saleskit Pune</asp:ListItem>
                             
                        </asp:DropDownList>                                                                         
                        </div>
                    
                   
                </div>

            <br />


             <div class="row">

                
                    
                    <div class="col-lg-6" >
                        <asp:Label ID="lblName"  runat="server">Employee Name:</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                       
                    <asp:TextBox ID="txtName"  class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

                        </div>
                    
                   
                </div>

            <br />


            
             <div class="row">

                   
                    
                    <div class="col-lg-6" >
                        <asp:Label ID="lblEmail"  runat="server">UserId(Email):</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                       
                    <asp:TextBox ID="txtEmail"  class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

                        </div>
                    
                   
                </div>

            <br />
                   <div class="row">
                       <div class="col-lg-6">
                           <asp:Label ID="lblDepartment" runat="server">Department:</asp:Label>
                       </div>
                       <div class="col-lg-6">

                            <asp:TextBox ID="txtdepartment"  class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>


                       </div>


                   </div>
                  
              <br />
             <div class="row">

                   
                    
                    <div class="col-lg-6" >
                        <asp:Label ID="lblDesignation"  runat="server">Designation:</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                       

                        <asp:TextBox ID="txtDesignation" class="form-control" style="margin-left: -150px;"  runat="server"></asp:TextBox>
                        <asp:linkbutton id="lnkSelectDesignation" style="position:absolute;top:2px;left:150px;" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn btn-calender"><span aria-hidden="true" class="fa fa-search"></span></asp:linkbutton>
           
                    <%-- <asp:DropDownList CssClass="form-control" Style="margin-left: -150px; " ID="DrpDesignation" runat="server">
                            <asp:ListItem>Manager</asp:ListItem>
                            <asp:ListItem>Sales Executive</asp:ListItem>
                             <asp:ListItem>Sales Person</asp:ListItem>--%>
                             
                        <%--</asp:DropDownList>--%>
                        </div>
                    
                    
                </div>
                    <div class="modal" id="myModal">
                  <div class="modal-dialog">
                      <div class="modal-content">

                          <!-- Modal Header -->
                          <div class="modal-header">
                              <h4 class="modal-title">Select designation</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <!-- Modal body -->
                          <div class="modal-body">
                              <asp:TreeView ID="TreeView2" runat="server" ImageSet="Arrows" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" >
                                  <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD"></HoverNodeStyle>
                                  <NodeStyle HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"></NodeStyle>

                                  <ParentNodeStyle Font-Bold="False"></ParentNodeStyle>

                                  <SelectedNodeStyle HorizontalPadding="0px" VerticalPadding="0px" Font-Underline="True" ForeColor="#5555DD"></SelectedNodeStyle>
                              </asp:TreeView>
                          </div>

                          <!-- Modal footer -->
                          <div class="modal-footer">
                              <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                          </div>

                      </div>
                  </div>
              </div> 
            <br />
            <div class="row">

                    <div class="col-lg-6" >
                        <asp:Label ID="lblUserType"  runat="server">User Type:</asp:Label>
                    </div>
                    <div class="col-lg-6" >
                       
                     
                     <asp:DropDownList CssClass="form-control" Style="margin-left: -150px; " ID="drpUserType" runat="server">
                            <asp:ListItem>Admin</asp:ListItem>
                            <asp:ListItem>Standard</asp:ListItem>
                             <asp:ListItem>Normal</asp:ListItem>
                             
                        </asp:DropDownList>  

                    </div>
                    
                </div>


            <br />

            <div class="row">
                   <div class="col-lg-3" >
                       
                    </div>
                    <div class="col-lg-4" >

                         <asp:CheckBox ID="chkCreateUser" CssClass="custom-checkbox" Text="Create User" runat="server" AutoPostBack="True" OnCheckedChanged="chkCreateUser_CheckedChanged" />

                    </div>
                  <%--<div class="col-lg-3" style="margin-right:50px">
                     <%--<asp:Label ID="lblCreateUser" runat="server">Create User</asp:Label>
                    </div>--%>
                </div>
             

            <br />
            <div class="row">
                   <div class="col-lg-1">
                       </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnInvite" Width="80px" runat="server" CssClass="btn btn-light" Text="Invite" OnClick="btnInvite_Click" />
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btnCancel" Width="80px" runat="server" CssClass="btn btn-light" Text="Cancel" />
                        </div>
                        <div class="col-lg-2">
                        <asp:Button ID="btnBack" Width="80px" runat="server" CssClass="btn btn-light" Text="Back" OnClick="btnBack_Click" />
                        </div>
                   
                    </div>
                   </div>
               

             
            <div class="col-lg-6"><%-- right side--%>
                <h6>Rights of Employee</h6>
                <hr />
                
                <asp:TreeView ID="TreeView1" ShowCheckBoxes="All" runat="server" ParentNodeStyle-CssClass="custom-control-input" NodeStyle-CssClass="custom-control-label"  >
                    <Nodes>
                           <asp:TreeNode Text="Quotation" Value="Quotation">
                            <asp:TreeNode  Text="Q followup" Value="Q followup"></asp:TreeNode>
                            <asp:TreeNode  Text="Add" Value="Add"></asp:TreeNode>
                            <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                            <asp:TreeNode  Text="Delete" Value="Delete"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Inquiry" Value="Inquiry">
                            <asp:TreeNode Text="I Followup" Value="I Followup"></asp:TreeNode>
                            <asp:TreeNode Text="Add" Value="Add"></asp:TreeNode>
                            <asp:TreeNode Text="Edit" Value="Edit"></asp:TreeNode>
                            <asp:TreeNode Text="Delete" Value="Delete"></asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                </asp:TreeView>
                   
                </div>
           
            </div>
            <br />
          
            <br />
        
        </form>
    </div>



</asp:Content>

