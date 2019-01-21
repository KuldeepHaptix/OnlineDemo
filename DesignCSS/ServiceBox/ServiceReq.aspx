<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="ServiceReq.aspx.cs" Inherits="ServiceBox_ServiceReq" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="../CSS/bootstrap-4.0.0.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
    <form runat="server">
   
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <h5 style="text-align: center; margin-top:50px; margin-bottom: 30px;"><u>Service Request</u></h5>
            </div>
            <div class="col-lg-3"></div>
        </div>



        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblReqNo" Style="margin-left: 20px;"  runat="server" Text="Request No:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtReqNo" ReadOnly="true" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-2">
                <asp:Label ID="lblReqDate" Style="margin-left: 5px;" runat="server">Request Date:</asp:Label>
            </div>
            <div class="col-lg-2">
                    <asp:TextBox ID="txtReqDate" CssClass="form-control" runat="server" ReadOnly="true" Style="margin-left: -75px; max-width: 266px;"></asp:TextBox>
            </div>
        </div>
        <br />

       

      


        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="Label1" Style="margin-left: 20px;" runat="server" Text="Customer Name:"></asp:Label>
            </div>
            <div class="col-lg-5">
                <asp:TextBox ID="txtcustname" class="form-control" Width="630px"  ReadOnly="true" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
         <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lbaddress" Style="margin-left: 20px;"  runat="server" Text="Address:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtaddress" TextMode="MultiLine"  class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-2">
                <asp:Label ID="lblemail" Style="margin-left: 5px;" runat="server" Text="Email:"></asp:Label>
            </div>
            <div class="col-lg-2">
                    <asp:TextBox ID="txtemail" CssClass="form-control" runat="server"  Style="margin-left: -75px; max-width: 266px;"></asp:TextBox>
            </div>
        </div>

        <br />

          <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblmo" Style="margin-left: 20px;"  runat="server" Text="Mobile:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtMobile" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-2">
                <asp:Label ID="lblph" Style="margin-left: 5px;" runat="server" Text="Phone:"></asp:Label>
            </div>
            <div class="col-lg-2">
                    <asp:TextBox ID="txtph" CssClass="form-control" runat="server"  Style="margin-left: -75px; max-width: 266px;"></asp:TextBox>
            </div>
        </div>
        <br />

        
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblIem" Style="margin-left: 20px;"  runat="server" Text="Item:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtitem" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-2">
                <asp:Label ID="lblderial" Style="margin-left: 5px;" runat="server" Text="Serial No:"></asp:Label>
            </div>
            <div class="col-lg-2">
                    <asp:TextBox ID="txtserial" CssClass="form-control" runat="server"  Style="margin-left: -75px; max-width: 266px;"></asp:TextBox>
            </div>
        </div>

        <br />

         <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -50px;">
                <asp:Label ID="lblproprobl" Style="margin-left: 20px;"  runat="server" Text="Product Problem:"></asp:Label>
            </div>
            <div class="col-lg-6">
                <asp:TextBox ID="txtproblem" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
           
        </div>
        <br />
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-1">
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" />
            </div>
             <div class="col-lg-1">
                <asp:Button ID="btnCalcel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>



   
        </form>
        </div>
</asp:Content>

