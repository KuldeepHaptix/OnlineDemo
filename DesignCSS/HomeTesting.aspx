<%@ Page Title="" Language="C#" MasterPageFile="~/MasterOne.master" AutoEventWireup="true" CodeFile="HomeTesting.aspx.cs" Inherits="HomeTesting" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />

        <div class="row">
            <div class="col-md-3">
                <div class="cardflash">
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="row" style="color: red;">
                                <div class="col-lg-6">
                                    <i class="fa fa-users" style="font-size: 48px;"></i>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-5"></div>
                                        <h4 id="totorders" runat="server" class="card-title"></h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-5"></div>
                                        <h5 class="card-subtitle text-center">Orders</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a href="../OrderBooking/OrderBookingList.aspx" class="card-link" style="margin-bottom: -10px;">View Detail >>  </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="cardflash">
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="row" style="color: indigo;">
                                <div class="col-lg-6">
                                    <i class="fa fa-edit" style="font-size: 48px;"></i>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-5"></div>
                                        <h4 id="totlead" runat="server" class="card-title">
                                        </h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"></div>
                                        <h5 class="card-subtitle text-center">Leads</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a href="../Inquiry/InquiryList.aspx" class="card-link">View Detail >></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="cardflash">
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="row" style="color: green;">
                                <div class="col-lg-6">
                                    <i class="fa fa-line-chart" style="font-size: 48px;"></i>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-5"></div>
                                        <h4 id="totquotamt" runat="server" style="font-size: 20px;" class="card-title fa fa-rupee"></h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"></div>
                                        <h5 class="card-subtitle text-center">Quotation</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a href="../Quotation/QuotationList.aspx" class="card-link">View Detail >></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="cardflash">
                    <div class="card-body">
                        <div class="col-lg-12">
                            <div class="row" style="color: orange;">
                                <div class="col-lg-6">
                                    <i class="fa fa-rupee" style="font-size: 48px;"></i>
                                </div>
                                <div class="col-lg-6">
                                    <div class="row">
                                        <div class="col-lg-5"></div>
                                        <h4 style="font-size: 20px;" class="card-title fa fa-rupee">670000</h4>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3"></div>
                                        <h5 class="card-subtitle text-center">Sales</h5>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <a href="#" class="card-link">View Detail >></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />

        <form id="chartform" runat="server">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">Source Of Lead<asp:LinkButton ID="refresh1" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>

                            </div>

                            <p class="card-text">It is to specify for Source of Inquiry.</p>
                            <br />
                            <br />
                            <br />

                            <asp:Chart ID="ChartLeadSource" runat="server">
                               
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>

                                <Titles>
                                    <asp:Title Name="LEAD SOURCE">
                                    </asp:Title>
                                </Titles>
                            </asp:Chart>

                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">LEAD STATUS<asp:LinkButton ID="refresh2" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>
                            </div>

                            <p class="card-text">It is to specify for Status of Inquiry.</p>
                            <br />
                            <br />
                            <br />

                            <asp:Chart ID="ChartLeadStatus" runat="server">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                </ChartAreas>

                                <Titles>
                                    <asp:Title Name="LEAD STATUS">
                                    </asp:Title>
                                </Titles>
                            </asp:Chart>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>

            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">TOP 5 SELLING PRODUCTS<asp:LinkButton ID="refresh3" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>
                            </div>
                            <hr />
                            <p class="card-text">It is to specify for Top 5 Sales.</p>
                            <br />
                            <br />
                            <br />

                            <asp:Chart ID="ChartTopSales" runat="server">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Titles>
                                    <asp:Title Name="TOP 5 SELLING PRODUCTS">
                                    </asp:Title>
                                </Titles>
                            </asp:Chart>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <hr />
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">Total Sales Revenue<asp:LinkButton ID="refresh4" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>
                            </div>
                            <hr />
                            <p class="card-text">That is a Total Sales.</p>
                            <br />
                            <br />
                            <br />

                            <asp:Chart ID="ChartTotalRevenue" runat="server">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Titles>
                                    <asp:Title Name="TOTAL SALES REVENUE">
                                    </asp:Title>
                                </Titles>
                            </asp:Chart>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>

            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">SERVICE STATUS<asp:LinkButton ID="refresh5" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>
                            </div>
                            <hr />
                            <p class="card-text">It is Specify to Status of Services.</p>
                            <br />
                            <br />
                            <br />

                            <asp:Chart ID="ChartServiceStatus" runat="server">
                                <ChartAreas>
                                    <asp:ChartArea Name="ChartArea1">
                                    </asp:ChartArea>
                                </ChartAreas>
                                <Titles>
                                    <asp:Title Name="SERVICE STATUS">
                                    </asp:Title>
                                </Titles>
                            </asp:Chart>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                <hr />
                <%--<div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="top">
                                <h5 class="card-title">Chart Title<asp:LinkButton ID="refresh6" runat="server"><span class="fa fa-repeat ml-3" style="color:#494848;font-size:19px;"></span></asp:LinkButton></h5>
                            </div>
                            <hr />
                            <p class="card-text">Some quick example text to build on the chart and make up the bulk of the chart's content.</p>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </div>
                    </div>
                </div>--%>
            </div>
        </form>
    </div>

</asp:Content>

