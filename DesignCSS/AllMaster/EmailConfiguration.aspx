<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="EmailConfiguration.aspx.cs" Inherits="EmailConfiguration" %>

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
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Email Configuration</u></h4>
                </div>

            </div>
           
            
          <div class="col-lg-12">
            <div class="row">
                  
                <div class="col-lg-4"></div>    <%--<div class="col-lg-1">
                <asp:Button ID="btnlist" class="btn btn-info" runat="server" Text="List" OnClick="btnlist_Click" />
            </div>--%>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblEmailID" Style="margin-left: 20px;" runat="server" Text="Email ID:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtEmailID" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

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
            
         
              <asp:Panel runat="server" ID="panel1">
                     <br />
            
            <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblCurrentpwd" Style="margin-left: 20px;" runat="server" Text="Current Password:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtCurrentpwd" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
                </div>
                <div class="col-lg-3"></div>
               <%-- <div class="col-lg-2">
                    <asp:Label ID="lblOpeningStock" Style="margin-left: 20px;" runat="server" Text="Opening Stock"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtOpeningStock" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>--%>

            </div>
                    </asp:Panel>
        
<br />
        <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblnewpwd" Style="margin-left: 20px;" runat="server" Text="New Password:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtnewpwd" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>
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

              <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblhost" Style="margin-left: 20px;" runat="server" Text="Host:"></asp:Label>
                </div>
                <div class="col-lg-3">
                  <asp:DropDownList ID="drphost" style="margin-left: -150px;" CssClass="form-control custom-select-md" runat="server">
                      <asp:ListItem>smtp.gmail.com</asp:ListItem>
                      <asp:ListItem>smtp.mail.yahoo.com</asp:ListItem>
                       </asp:DropDownList>	
                </div>
                <div class="col-lg-3"></div>               
            </div>

            <br />

              <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblport" Style="margin-left: 20px;" runat="server" Text="Port:"></asp:Label>
                </div>
                <div class="col-lg-3">
             <asp:TextBox ID="txtport" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

                </div>
                <div class="col-lg-3"></div>               
            </div>

                <br />

              <div class="row">
                <div class="col-lg-4"></div>
                <div class="col-lg-3" style="margin-left: -40px;">
                    <asp:Label ID="lblssl" Style="margin-left: 20px;" runat="server" Text="SSL:"></asp:Label>
                </div>
                <div class="col-lg-3">
             <asp:TextBox ID="txtssl" class="form-control" Style="margin-left: -150px;" runat="server"></asp:TextBox>

                </div>
                <div class="col-lg-3"></div>               
            </div>


      
        <br />
      
        <div class="row">
            <div class="col-lg-6"></div>
            <div class="col-lg-1">
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmitInq_Click"  />
                <asp:Label ID="lblmsg" runat="server" ForeColor="#990000" Visible="False"></asp:Label>
            </div>
            <div class="col-lg-1">
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel"  />
            </div>
             <%--<div class="col-lg-1">
                <asp:Button ID="btnlist" class="btn btn-info" runat="server" Text="List" OnClick="btnlist_Click" />
            </div>--%>
            <div class="col-lg-4"></div>
        </div>

       </div>
    </form>




</asp:Content>

