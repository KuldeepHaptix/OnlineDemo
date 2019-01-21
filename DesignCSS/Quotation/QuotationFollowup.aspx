<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="QuotationFollowup.aspx.cs" Inherits="Quotation_QuotationFollowup" %>

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
                <h5 style="text-align: center; margin-top:50px; margin-bottom: 30px;"><u>Followup Quotation</u></h5>
            </div>
            <div class="col-lg-3"></div>
        </div>



        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblinqcode" Style="margin-left: 20px;"  runat="server" Text="Inquiry Code:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtCode" ReadOnly="true" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            
            <div class="col-lg-2">
                <asp:Label ID="lblInqDate" Style="margin-left: 5px;" runat="server">Inquiry Date:</asp:Label>
            </div>
            <div class="col-lg-2">
                    <asp:TextBox ID="txtDate" CssClass="form-control" runat="server" ReadOnly="true" Style="margin-left: -75px; max-width: 266px;"></asp:TextBox>
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
                <asp:Label ID="lblLastFollowupDate" Style="margin-left: 20px;" runat="server" Text="Last Followup Date:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtLastFollowupDate" ReadOnly="true" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
            <div class="col-lg-6"></div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblNextDate" Style="margin-left: 20px;" runat="server" Text="Next Followup Date:"></asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:TextBox ID="txtNextDate" CssClass="form-control" runat="server" Style="margin-left: -50px;z-index:1;" Width="182px"></asp:TextBox>
                <asp:linkbutton id="lnknextfollowp" Height="12px" Width="20px" Style="position:absolute;top:5px;left:140px;" runat="server" CssClass="btn btn-calender" onclick="Calender1_Click"><span aria-hidden="true" class="fa fa-calendar"></span></asp:linkbutton>
            </div>
            <div class="col-lg-2">
                <asp:Label ID="lblFollowupBy" Style="margin-left: 5px;" runat="server">Followup By:</asp:Label>
            </div>
            <div class="col-lg-2">
                <asp:DropDownList ID="drpApptaken" Style="margin-left: -75px;" CssClass="form-control custom-select-md" runat="server">
                    <asp:ListItem>Shubhangi</asp:ListItem>
                    <asp:ListItem>Manthan</asp:ListItem>
                    <asp:ListItem>Vandan</asp:ListItem>
                    <asp:ListItem>Daksha</asp:ListItem>
                </asp:DropDownList>
            </div>
           
        </div>
          <div class="row" style="position: absolute; top: 410px; left: 200px; width: 140px; height: 30px; z-index:1;">
                <div class="col-lg-8"></div>
                <div class="col-lg-2">
                    <asp:Calendar ID="datepicker" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="datepicker_SelectionChanged">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>

                </div>
            </div>
        <br />
         <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-lg-2" style="margin-left: -40px;">
                <asp:Label ID="lblFolowRemark" Style="margin-left: 20px;" runat="server" Text="Remarks:"></asp:Label>
            </div>
            <div class="col-lg-5">
                <asp:TextBox ID="txtRemarks" class="form-control" Width="630px"  Style="margin-left: -50px;" runat="server"></asp:TextBox>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-3">
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmitInq_Click" />
            </div>
             <div class="col-lg-2">
                <asp:Button ID="btnCalcel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>



   
        </form>
        </div>
</asp:Content>

