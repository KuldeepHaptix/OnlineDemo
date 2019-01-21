<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="ItemTerritoty.aspx.cs" Inherits="AllMaster_ItemTerritoty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="container">
          <form runat="server">

            <br />
            <div class="row">
                <div class="col-sm-4"></div>
                <div class="col-sm-3"><h5>Item tree</h5></div>
                <div class="col-sm-4"></div>
            </div>
           
            <br />
           
                <div class="row">

                    <div class="col-lg-3"></div>
                    <div class="col-lg-2" >
                        <asp:Label ID="lblName"  runat="server" Text="Item Name :"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtNAme" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    
                   
                </div>
             <br />
                <div class="row">

                   <div class="col-lg-3"></div>
                    
                    <div class="col-lg-2" >
                        <asp:Label ID="lblParent"  runat="server">Select Parent :</asp:Label>
                    </div>
                    <div class="col-lg-3" >
                      
                            <asp:TextBox ID="txtParent" CssClass="form-control" runat="server" Style="margin-left: -50px; "></asp:TextBox>
                        </div>
                    
                    <div class="col-lg-2"></div>
                </div>
                <br />
                 
                <br />
                <div class="row">
                    <div class="col-lg-5">
                    </div>
                    <div class="col-lg-2">
                        <asp:Button ID="btn_Submit" CssClass="btn btn-light" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
                        <asp:linkbutton id="lnkSelectTerritory" style="position:absolute;top:-85px;left:215px;" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn btn-calender"><span aria-hidden="true" class="fa fa-search"></span></asp:linkbutton>

                    </div>
                    <div class="col-lg-4">
                    </div>
                </div>
                <div class="modal" id="myModal">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <!-- Modal Header -->
                          <div class="modal-header">
                              <h4 class="modal-title">Select Parent Item</h4>
                              <button type="button" class="close" data-dismiss="modal">&times;</button>
                          </div>

                          <!-- Modal body -->
                          <div class="modal-body">
                              <asp:TreeView ID="TreeView1" runat="server" ImageSet="Arrows" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" >
                                  <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD"></HoverNodeStyle>
                                  <%--<Nodes>
                                      <%--<asp:TreeNode Text="CEO" Value="CEO">
                                          <asp:TreeNode Text="Manager" Value="Manager">
                                              <asp:TreeNode Text="Tech Lead" Value="Tech Lead">
                                                  <asp:TreeNode Text="Sr. Developer" Value="Sr. Developer"></asp:TreeNode>
                                                  <asp:TreeNode Text="Jr. Developer" Value="Jr. Developer"></asp:TreeNode>
                                                  <asp:TreeNode Text="Consultant" Value="Consultant"></asp:TreeNode>
                                                  <asp:TreeNode Text="Intern" Value="Intern"></asp:TreeNode>
                                              </asp:TreeNode>
                                              <asp:TreeNode Text="Team Lead" Value="Team Lead">
                                                  <asp:TreeNode Text="Quality Analyist" Value="Quality Analyist"></asp:TreeNode>
                                              </asp:TreeNode>
                                          </asp:TreeNode>
                                      </asp:TreeNode>--%>
                                 <%-- </Nodes>--%>
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
           
        </form>
    </div>
</asp:Content>

