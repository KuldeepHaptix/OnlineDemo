 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="DispatchDetail.aspx.cs" Inherits="OrderBooking_DispatchDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="~/CSS/bootstrap-4.0.0.css" rel="stylesheet"/>
    
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <form runat="server" id="inqform">
        
       <br />
            <div class="row">
               
                <div class="col-lg-12">
                    <h4 style="text-align:center; margin-bottom:30px;"><u>Dispatch Detail</u></h4>
                </div>

            </div>
           
            
         
            <div class="row">
                  
                <div class="col-lg-1"></div>    <%--left--%>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblpoNo" Style="margin-left: 20px;" runat="server" Text="Buyer,s Order/PO No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtPono" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>
               
                <div class="col-lg-2">    <%-- right--%>
                    <asp:Label ID="lblOrderDate" Style="margin-left: 20px;" runat="server">OrderDate:</asp:Label>
                </div>
                <div class="col-lg-3">
                  <asp:TextBox ID="txtOrderDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                        
                    
                   
                </div>
            </div>
            
            <br />
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblDeliveryNote" Style="margin-left: 20px;" runat="server" Text="Delivery Note:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtDeliveryNote" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
              
                <div class="col-lg-2">
                    <asp:Label ID="lblDeliveryDate" Style="margin-left: 20px;" runat="server" Text="Delivery Date:"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtDeliveryDate" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>

            </div>
        
          <br />

          <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblSupplyrRef" Style="margin-left: 20px;" runat="server" Text="Supplier's Ref No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtSupRefNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
               <div class="col-lg-2">
                    <asp:Label ID="lblDestination" Style="margin-left: 20px;" runat="server" Text="Destination:"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtDestination" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>

            </div>
        
        
        
        <!--Second Row-->
        <br />

           <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblDTVN" Style="margin-left: 10px;" runat="server" Text="Dispatched Through "></asp:Label>
                    <br />
                    <asp:Label ID="Label2" Style="margin-left: 10px;" runat="server" Text="Vehical No:"></asp:Label>

                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtDisVehicalNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                </div>
              

                <div class="col-lg-2">
                    <asp:Label ID="lblDispatchDoc" Style="margin-left: 20px;" runat="server" Text="Dispatch Doc No:"></asp:Label>
                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtDispatchDocNo" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>

                </div>
              </div>


       
            <br />

          <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblDTInvoice" Style="margin-left: 10px;" runat="server" Text="Date-Time Of Invoice:"></asp:Label>
                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtDTInvoice" class="form-control" Style="margin-left: -50px;"  Width="300px" runat="server"></asp:TextBox>
                   <asp:linkbutton id="lnkdateofinvoce" Height="12px" Width="20px" Style="position:absolute;top:5px;left:265px;" runat="server" CssClass="btn btn-calender" OnClick="lnkdateofinvoce_Click" ><span aria-hidden="true" class="fa fa-calendar"></span></asp:linkbutton>

                </div>
            

                <div class="col-lg-2">
                    <asp:Label ID="lblDTofRemovelGood" Style="margin-left: 20px;" runat="server" Text="Date-Time Removal"></asp:Label>
                    <br />
                   <asp:Label ID="Label1" Style="margin-left: 20px;" runat="server" Text="Of Good :"></asp:Label>


                </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtRemovalOfGood" class="form-control" Style="margin-left: -50px;" runat="server"></asp:TextBox>
                      <asp:linkbutton id="lnkdatetofremoval" Height="12px" Width="20px" Style="position:absolute;top:5px;left:265px;" runat="server" CssClass="btn btn-calender" OnClick="lnkdatetofremoval_Click" ><span aria-hidden="true" class="fa fa-calendar"></span></asp:linkbutton>

                           <%--  <div class="row" style="position: absolute; top:400px; left: 700px; width: 140px; height: 30px; z-index:1;">
                    <div class="col-lg-8"></div>
                    <div class="col-lg-2">--%>
                        <asp:Calendar ID="Calendar1" Style="position:absolute;top:40px;left:-7px; z-index:1;"  runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="Calendar1_SelectionChanged" >
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
                <%--</div>


                </div>--%>
              </div>
                  <div class="row" style="position: absolute; top: 460px; left: 200px; width: 140px; height: 30px; z-index:1;">
                    <div class="col-lg-8"></div>
                    <div class="col-lg-2">
                        <asp:Calendar ID="datepicker" runat="server" Visible="False" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="300px" OnSelectionChanged="datepicker_SelectionChanged" >
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
                <div class="col-lg-1"></div>
                <div class="col-lg-2" style="margin-left: -30px;">
                    <asp:Label ID="lblshipby" Style="margin-left: 10px;" runat="server" Text="Shipping Address: "></asp:Label>
                   

                </div>
                <div class="col-lg-3">
                    <asp:TextBox ID="txtshipbyAdddress" class="form-control" Style="margin-left: -50px;" TextMode="MultiLine" runat="server"></asp:TextBox>
                </div>
              

                <div class="col-lg-2">
                    <asp:Label ID="lblShipto" Style="margin-left: 20px;" runat="server" Text="Alternate Shipping"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" Style="margin-left: 20px;" runat="server" Text=" Address:"></asp:Label>
            </div>
                <div class="col-lg-3">
                     <asp:TextBox ID="txtShipAltrnetAdd" class="form-control" Style="margin-left: -50px;" TextMode="MultiLine" runat="server"></asp:TextBox>

                </div>
              </div>
            <hr />
        <div class="row">
            <div class="col-lg-5"></div>
            <div class="col-lg-1">
             
                <asp:Button ID="btnSubmitInq" class="btn btn-info" runat="server" Text="Submit" OnClick="btnSubmitInq_Click" />
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnCancel" class="btn btn-info" runat="server" Text="Cancel" />
            </div>
            <div class="col-lg-4"></div>
        </div>

       
    </form>
</asp:Content>

