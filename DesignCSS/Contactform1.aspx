﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contactform1.aspx.cs" Inherits="Contactform1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <link rel="stylesheet" href=" https://www.w3schools.com/w3css/4/w3.css" />

     <style type="text/css">
          @import url(https://fonts.googleapis.com/css?family=Roboto:400,100);
          body {
  background: url(https://dl.dropboxusercontent.com/u/23299152/Wallpapers/wallpaper-22705.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family: 'Roboto', sans-serif;
}

.login-card {
  padding: 40px;
  width: 650px;
  background-color: #F7F7F7;
  margin-bottom:20px;
  margin: 0 auto 10px;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
}

.login-card h1 {
  font-weight: 100;
  text-align: center;
  font-size: 2.2em;
}

.login-card input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}

.login-card input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 20px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}

.login-card input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}

.login {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 600;
  height: 50px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}

.login-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #61A4DB;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}

.login-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color:dodgerblue;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}

.login-card a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
}

.login-card a:hover {
  opacity: 1;
  
}

.login-help {
  width: 100%;
  text-align: center;
  font-size: 12px;
}
</style>

<meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <!-- Bootstrap -->
    <link href="~/CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />



</head>
<body>
     <form id="form1" runat="server" style="margin-top:100px">
  
    <div class="login-card">
  
      <%-- <div class="login-card">--%>
         <h1>Contact Us</h1><br/>
         
      <%-- <asp:TextBox ID="Username" placeholder="" runat="server"/>--%>
        <asp:Label ID="lblname" CssClass="mb-2"  runat="server" Text="Name" Font-Size="Medium"></asp:Label>
        <br />
        <asp:TextBox ID="txtname" CssClass="form-control-contact mt-3" placeholder="Enter Name" runat="server"/>
              
            <asp:Label ID="lblemail" CssClass="mb-2" runat="server" Text="Email" Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="txtemail" CssClass="form-control-contact mt-3"  placeholder="Enter Email" runat="server" />
        
         <asp:Label ID="lblCompany" CssClass="mb-2" runat="server" Text="Company" Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="txtCompany" CssClass="form-control-contact mt-3"  placeholder="Company Name" runat="server" />
        
         <asp:Label ID="lblSub" CssClass="mb-2" runat="server" Text="Subject" Font-Size="Medium"></asp:Label>
            <br />
            <asp:TextBox ID="txtsubject" CssClass="form-control-contact mt-3 mb-3" Width="100%"  TextMode="MultiLine"  placeholder="" runat="server" />
        
        <div class="row">
        <div class="col-lg-6">
             <asp:Button ID="btnsubmit" class="login login-submit" runat="server" Text="Submit"   />

        </div>
          <div class="col-lg-6">
             <asp:Button ID="btncancel" class="login login-submit" runat="server" Text="Cancel" />
           </div>
            </div>
            <br />
            <asp:Label ID="lblmsg"  runat="server" ForeColor="Red" Visible="False"></asp:Label>
        
    
<%--  <div class="login-help">
    <a href="#">Register</a> • <a href="#">Login</a>
  </div>--%>
     </div>
       </form>
</body>
</html>
