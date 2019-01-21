<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="ItemRegister.aspx.cs" Inherits="AllMaster_ItemRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <meta charset="utf-8"/>
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
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Item Register</u></h4>
                </div>

            </div>
           
            
          <div class="col-lg-12">
            <div class="row">
                  
                <div class="col-lg-4"></div>    <%--left--%>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblinqcode" Style="margin-left: 20px;" runat="server" Text="Item Code:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtItemCode" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

                </div>
                <div class="col-lg-3"></div>
                <%--<div class="col-lg-2">    <%-- right
                    <asp:Label ID="lblGodown" Style="margin-left: 20px;" runat="server">Godown:</asp:Label>
                </div>
                <div class="col-lg-3">
                   
                        <asp:DropDownList ID="drpgodown" Style="margin-left: -50px;" CssClass="form-control" runat="server">
                     </asp:DropDownList>
                </div>--%>
            </div>
            
            <br />
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblItem" Style="margin-left: 20px;" runat="server" Text="Item:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtitemName" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-3"></div>
               <%-- <div class="col-lg-2">
                    <asp:Label ID="lblOpeningStock" Style="margin-left: 20px;" runat="server" Text="Opening Stock"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtOpeningStock" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>--%>

            </div>
        
<br />
        <!--Second Row-->
          <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-3" style="margin-left: -40px;">
                <asp:Label ID="lblCategory" Style="margin-left: 20px;" runat="server" Text="Category:"></asp:Label>
            </div>
            <div class="col-lg-3">
           <asp:TextBox ID="txtcategory" class="form-control" style="margin-left: -150px;"  runat="server"></asp:TextBox>
            <asp:linkbutton id="lnkSelectTerritory" style="position:absolute;top:2px;left:150px;" data-toggle="modal" data-target="#myModal" runat="server" CssClass="btn btn-calender"><span aria-hidden="true" class="fa fa-search"></span></asp:linkbutton>
               
            </div>
            <div class="col-lg-3"></div>
         <%--   <div class="col-lg-2">
                <asp:Label ID="lblRackNo" Style="margin-left: 20px;" runat="server" Text="RackNo"></asp:Label>
            </div>
            <div class="col-lg-3">
          <asp:TextBox ID="txtRackNo" class="form-control" style="margin-left: -50px;"  runat="server"></asp:TextBox>

            </div>--%>

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
            <div class="col-lg-4"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblPrice" Style="margin-left: 20px;" runat="server" Text="Price:"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:TextBox ID="txtPrice" class="form-control" Style="margin-left: -40px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-1" style="margin-left: -40px;">
                <asp:Label ID="lblCurrency" Style="margin-left: 20px;" runat="server" Text="Currency:"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:DropDownList ID="DrpCurrency"  CssClass="form-control custom-select-md" runat="server">
                      
                      </asp:DropDownList>
                
            </div>
            <div class="col-lg-3"></div>
             <%-- <div class="col-lg-2">
                    <asp:Label ID="lblCurrentStock" Style="margin-left: 68px;" runat="server" Text="Current Stock"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtcurrentStock" class="form-control"  runat="server"></asp:TextBox>

                </div>--%>
        </div>

        <br />

        <div class="row">
		 <div class="col-lg-4"></div>
			<div class="col-lg-3" style="margin-left:-40px;" >
				<asp:Label ID="lblUOM" style="margin-left: 20px;" runat="server" Text="UOM:"></asp:Label>
			</div>
			<div class="col-lg-3">
                        <asp:DropDownList ID="drpUOM" style="margin-left: -150px;" CssClass="form-control custom-select-md" runat="server">
                       </asp:DropDownList>				
			</div>
		<div class="col-lg-3"></div>
			<%--<div class="col-lg-2">
				<asp:label ID="lblReorderLevel" style="margin-left: 20px;" runat="server">Reorder Level:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtReorderLevel" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               </div>--%>
          
		</div>
              <br />
                 <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-3" style="margin-left: -40px;">
                <asp:Label ID="lblTaxClass" Style="margin-left: 20px;" runat="server" Text="TaxClass:"></asp:Label>
            </div>
            <div class="col-lg-3">
           <asp:DropDownList ID="drpTaxClass" style="margin-left: -150px;" CssClass="form-control custom-select-md" runat="server">
                       </asp:DropDownList>	
               
            </div>
            <div class="col-lg-3"></div>
         <%--   <div class="col-lg-2">
                <asp:Label ID="lblRackNo" Style="margin-left: 20px;" runat="server" Text="RackNo"></asp:Label>
            </div>
            <div class="col-lg-3">
          <asp:TextBox ID="txtRackNo" class="form-control" style="margin-left: -50px;"  runat="server"></asp:TextBox>

            </div>--%>

        </div>
        <br />

             <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblProductCode" Style="margin-left: 20px;" runat="server" Text="Product Code:"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:TextBox ID="txtProductCode" class="form-control" Style="margin-left: -40px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-1">
                <asp:Label ID   ="lblHsn" Style="margin-left: -50px;" runat="server" Text="HSN/SAC Code:"></asp:Label>
            </div>
            <div class="col-lg-1">
               <asp:TextBox ID="txtHsnCode" class="form-control" style="margin-left: -40px;"  runat="server"></asp:TextBox>

                               
            </div>
            <div class="col-lg-2"></div>
             <%-- <div class="col-lg-1">
                    <asp:Label ID="lbllocation" Style="margin-left: -95px;" runat="server" Text="Location:"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtlocation" class="form-control" style="margin-left: -50px;"  runat="server"></asp:TextBox>

                </div>--%>
        </div>

<br />


        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-3" style="margin-left: -40px;">
                <asp:Label ID="lblDescription" Style="margin-left: 20px;" runat="server" Text="Description:"></asp:Label>
            </div>
            <div class="col-lg-3">
           <asp:TextBox ID="txtDescription" class="form-control" style="margin-left: -150px;"  runat="server"></asp:TextBox>

               
            </div>
            <div class="col-lg-3"></div>
         <%--   <div class="col-lg-2">
                <asp:Label ID="lblRackNo" Style="margin-left: 20px;" runat="server" Text="RackNo"></asp:Label>
            </div>
            <div class="col-lg-3">
          <asp:TextBox ID="txtRackNo" class="form-control" style="margin-left: -50px;"  runat="server"></asp:TextBox>

            </div>--%>

        </div>

        <br />
            <hr />
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-1">
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmitInq_Click" />
            </div>
            <div class="col-lg-1">
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
             <div class="col-lg-1">
                <asp:Button ID="btnlist" class="btn btn-info" runat="server" Text="List" OnClick="btnlist_Click" />
            </div>
            <div class="col-lg-4"></div>
        </div>

       </div>
    </form>
</asp:Content>

