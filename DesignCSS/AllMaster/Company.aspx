<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="Company.aspx.cs" Inherits="AllMaster_Company" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
       <form runat="server" id="inqform">
        
       
            <div class="row">
               
                <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Company</u></h4>
                </div>

            </div>
           
           <div class="row">
               <div class="col-lg-1"></div>
               <div class="col-lg-2" style="margin-left: -40px;">
                   <asp:Label ID="lblCompName" Style="margin-left: 20px;" runat="server" Text="Company Name:"></asp:Label>
               </div>
               <div class="col-lg-9">
                   <asp:TextBox ID="txtCompName" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
               </div>
           </div>
           <br />
           <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblAddressline1" style="margin-left: 20px;" runat="server" Text="AddressLine1:"></asp:Label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtAddressline1"  class="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
				
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblAddressline2" style="margin-left: 20px;" runat="server">AddressLine2:</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtAddressline2" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
		</div>

        <br />

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblCity" Style="margin-left: 20px;" runat="server" Text="City:"></asp:Label>
            </div>
            <div class="col-lg-3">

       <asp:TextBox ID="txtcity" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>

               <%-- <asp:DropDownList ID="drpCity" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                    <asp:ListItem>--Select City--</asp:ListItem>
                    <asp:ListItem>Ahmedabad</asp:ListItem>
                    <asp:ListItem>Baroda</asp:ListItem>
                    <asp:ListItem>Surat</asp:ListItem>
                </asp:DropDownList>--%>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblArea" Style="margin-left: 20px;" runat="server" Text="Area"></asp:Label>
            </div>
            <div class="col-lg-3">
     <asp:TextBox ID="txtarea" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>

               <%-- <asp:DropDownList ID="drpArea" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">

                    <asp:ListItem>Alkapuri</asp:ListItem>
                    <asp:ListItem>Waghodiya</asp:ListItem>
                    <asp:ListItem>Karelibaug</asp:ListItem>
                </asp:DropDownList>--%>
            </div>

        </div>

        <br />

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblState" Style="margin-left: 20px;" runat="server" Text="State:"></asp:Label>
            </div>
            <div class="col-lg-3">
            <asp:TextBox ID="txtstate" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>

               <%-- <asp:DropDownList ID="drpState" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Rajasthan</asp:ListItem>
                    <asp:ListItem>Karnataka</asp:ListItem>
                </asp:DropDownList>--%>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblPincode" Style="margin-left: 20px;" runat="server" Text="Pincode:"></asp:Label>
            </div>
            <div class="col-lg-3">
                <asp:TextBox ID="txtPincode" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>

        </div>
        <br />

        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblCountry" Style="margin-left: 20px;" runat="server" Text="Country:"></asp:Label>
            </div>
            <div class="col-lg-3">
              <asp:TextBox ID="txtcountry" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>

                <%--<asp:DropDownList ID="drpCountry" Style="margin-left: -50px;" CssClass="form-control custom-select-md" runat="server">
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>Australia</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>China</asp:ListItem>
                </asp:DropDownList>--%>
            </div>
            <div class="col-lg-1"></div>
             <div class="col-lg-2" >
                <asp:Label ID="lblMobile" Style="margin-left: 20px;" runat="server" Text="Mobile:"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:TextBox ID="txtMobileCode" class="form-control" Style="margin-left:-45px;"  runat="server" Value="+91"></asp:TextBox>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtMobile" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
        </div>

        <br />

         <div class="row">
		 <div class="col-lg-1"></div>
			<div class="col-lg-2" style="margin-left:-40px;" >
				<asp:Label ID="lblPhone1" style="margin-left: 20px;" runat="server" Text="Phone 1:"></asp:Label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtPhone1"  class="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
				
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-2"  >
				<asp:label ID="lblEmail" style="margin-left: 20px;" runat="server">Email :</asp:label>
			</div>
			<div class="col-lg-3">
                <asp:TextBox ID="txtEmail" CssClass="form-control" style="margin-left: -50px;" runat="server"></asp:TextBox>
               				
			</div>
		</div>

    

        <br />

        <div class="row">
           
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblwebsite" Style="margin-left: 20px;" runat="server" Text="Website:"></asp:Label>
            </div>
            <div class="col-lg-3">
                 <asp:TextBox ID="txtWebsite" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblGSTIN" Style="margin-left: 20px;" runat="server" Text="GSTIN :"></asp:Label>
            </div>
            <div class="col-lg-3">
                 <asp:TextBox ID="txtGSTIN" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>

        </div>

        <br />
   <div class="row">
           
            <div class="col-lg-1"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblPAN" Style="margin-left: 20px;" runat="server" Text="PAN:"></asp:Label>
            </div>
            <div class="col-lg-3">
                 <asp:TextBox ID="txtPAN" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-1"></div>
            <div class="col-lg-2">
                <asp:Label ID="lblStateCode" Style="margin-left: 20px;" runat="server" Text="StateCode :"></asp:Label>
            </div>
            <div class="col-lg-3">
                 <asp:TextBox ID="txtStateCode" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>

        </div>

        
        <br />

       <div class="row">
               <div class="col-lg-1"></div>
               <div class="col-lg-2" style="margin-left: -40px;">
                   <asp:Label ID="lblCompLogo" Style="margin-left: 20px;" runat="server" Text="Company Logo:"></asp:Label>
               </div>
               <div class="col-lg-3">
                   <asp:FileUpload ID="Uploadlogo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:FileUpload>
               </div>
           </div>
        <br />
        <hr />
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-2">
                <asp:Button ID="btnSubmit" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>

       
    </form>
</asp:Content>

