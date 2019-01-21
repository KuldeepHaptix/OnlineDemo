<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CityMasterNew.aspx.cs" Inherits="AllMaster_CityMasterNew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    

    <!-- Bootstrap -->
    <link href="~/CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <asp:Panel runat="server" Width="400px" Height="300px" GroupingText="Country" BorderColor="Silver" Font-Size="Small">
                
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2" style="margin-left: -40px;">
                        <asp:Label ID="lblcountry" Style="margin-left: 20px;" runat="server" Text="Country Name:"></asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtCountry" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                    <div class="col-lg-1"></div>
                    <div class="col-lg-2">
                        <asp:Label ID="lblContactp" Style="margin-left: 20px;" runat="server">Contact Person:</asp:Label>
                    </div>
                    <div class="col-lg-3">
                        <asp:TextBox ID="txtContactP" CssClass="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                    </div>
                </div>

            </asp:Panel>
            </div>
        </div>
    </form>
</body>
</html>
