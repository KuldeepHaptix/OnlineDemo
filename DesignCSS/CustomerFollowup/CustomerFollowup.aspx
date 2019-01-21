<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="CustomerFollowup.aspx.cs" Inherits="CustomerFollowup_CustomerFollowup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Customer Followup</u></h4>
                </div>

            </div>
           
            
         
            <div class="row">
                  
                <div class="col-lg-1"></div>    <%--left--%>
                <div class="col-lg-2" style="margin-left: -50px;">
                    <asp:Label ID="lblileadNo" Style="margin-left: 20px;" runat="server" Text="Lead No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtLeadNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>
                <div class="col-lg-1"></div>
                <div class="col-lg-2">    <%-- right--%>
                    <asp:Label ID="lblLeadDate" Style="margin-left: 20px;" runat="server">LeadDate:</asp:Label>
                </div>
                <div class="col-lg-3">
            
                <asp:TextBox ID="txtleadDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                <asp:linkbutton id="lnkleaddate" Style="position:absolute;top:5px;left:255px;" runat="server" CssClass="btn btn-calender" ><span aria-hidden="true" class="fa fa-calendar"></span></asp:linkbutton>
                
                </div>
            </div>
            
            <br />
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -40px;">
                    <asp:Label ID="lblcust" Style="margin-left: 20px;" runat="server" Text="Customer:"></asp:Label>
                </div>
                <div class="col-lg-9">
                    <asp:TextBox ID="txtcustomer" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
                 <div class="col-lg-1"></div>
            </div>
        

        <!--Second Row-->
        <br />

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblfollodate" Style="margin-left: 20px;" runat="server" Text="Followup Date:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtfolloupDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
         
                
          
            <div class="col-lg-1"></div>
               
            <div class="col-lg-2" >
                <asp:Label ID="lblnextfollow" Style="margin-left: 20px;" runat="server" Text="NextFolloup Date:"></asp:Label>
            </div>
            <div class="col-lg-3">
            <asp:TextBox ID="txtnextFollowDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

            </div>
           </div>
        <br />

        <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblFollowby" style="margin-left: 20px;" runat="server" Text="Followup By:"></asp:Label>
			</div>
			<div class="col-lg-3">
                        <asp:DropDownList ID="dbpfolowby" style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                        <asp:ListItem>Shubhangi</asp:ListItem>
                        <asp:ListItem>Vandan</asp:ListItem>
                        <asp:ListItem>Manthan</asp:ListItem>
                      </asp:DropDownList>				
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblRemarks" style="margin-left: 20px;" runat="server">Remarks:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtremarks" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
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

