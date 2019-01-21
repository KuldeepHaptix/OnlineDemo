<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactForm.aspx.cs" Inherits="ContactForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!--For Collapse-->
<%-- <%--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>--%>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
    <!--end-->
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container" style="margin-top:80px;">
       <div class="row" >
               
                <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Contact Us</u></h4>
                </div>

            </div>
        <div class="row mb-3">
            <div class="col-lg-2">
            </div>
               <div class="col-lg-3">
                <asp:Label ID="lblname" Style="margin-left:50px;" runat="server" Text="Name"></asp:Label>

               </div>  
            <div class="col-lg-6">
             <asp:TextBox ID="txtname"  CssClass="form-control"  Style="margin-left:-140px;"  runat="server"></asp:TextBox>

               </div>    
            <div class="col-lg-2">

            </div>                                                                                       
        </div>
         
        <div class="row mb-3">
            <div class="col-lg-2">
            </div>
               <div class="col-lg-3">
                <asp:Label ID="lblEmail" Style="margin-left:50px;" runat="server" Text="Email"></asp:Label>

               </div>  
            <div class="col-lg-6">
             <asp:TextBox ID="txtEmail"  CssClass="form-control"  Style="margin-left:-140px;"  runat="server"></asp:TextBox>

               </div>    
            <div class="col-lg-2">

            </div>                                                                                       
        </div>  
        <div class="row mb-3">
            <div class="col-lg-2">
            </div>
               <div class="col-lg-3">
                <asp:Label ID="lblCompany" Style="margin-left:50px;" runat="server" Text="Company"></asp:Label>

               </div>  
            <div class="col-lg-6">
             <asp:TextBox ID="txtcompany"  CssClass="form-control"  Style="margin-left:-140px;"  runat="server"></asp:TextBox>

               </div>    
            <div class="col-lg-2">

            </div>                                                                                       
        </div>  

        <div class="row mb-3">
            <div class="col-lg-2">
            </div>
               <div class="col-lg-3">
                <asp:Label ID="lblSubject" Style="margin-left:50px;" runat="server" Text="Subject"></asp:Label>

               </div>  
            <div class="col-lg-6">
             <asp:TextBox ID="txtsubject"  TextMode="MultiLine" CssClass="form-control"  Style="margin-left:-140px;"  runat="server"></asp:TextBox>

               </div>    
            <div class="col-lg-2">

            </div>                                                                                       
        </div>
    </div>
    </form>
</body>
</html>
