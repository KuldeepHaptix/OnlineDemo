using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Collections;
using System.Web.UI.DataVisualization.Charting;


public partial class HomeTesting : System.Web.UI.Page
{
    Service crmclient = new Service();
 
    protected void Page_Load(object sender, EventArgs e)
    {
        // Response.Write("PAge");
        TotalOrders();
        TotalLeads();
        TotalQuotationAmt();
        LeadSource();
        LeadStatusChart();
        //TotalSalesRevenueChart();
        //ProjectedSalesChart(); //TOP 5 Sales
       // ServiceStatusChart();

    }

    public void TotalOrders()
    {
        SortedList sd0 = new SortedList();
        sd0.Add("@i_CompId", CurrentUser.CompId.ToString());

        DataSet dstotallead = new DataSet();
        List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId.ToString()}
            };
        dstotallead = crmclient.Select(para, "TotalOrders");

        totorders.InnerText = dstotallead.Tables[0].Rows[0][0].ToString();

    }
    public void TotalLeads()
    {
        SortedList sd0 = new SortedList();
        sd0.Add("@i_CompId", CurrentUser.CompId.ToString());

        DataSet dstotallead = new DataSet();
        List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId.ToString()}
            };
        dstotallead = crmclient.Select(para, "TotalLead");

        totlead.InnerText = dstotallead.Tables[0].Rows[0][0].ToString();
    }

    public void TotalQuotationAmt()
    {
        SortedList sd0 = new SortedList();
        sd0.Add("@i_CompId", CurrentUser.CompId.ToString());

        DataSet dstotalquot = new DataSet();
        List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId.ToString()}
            };
        dstotalquot = crmclient.Select(para, "TotalQuotationAmt");

        totquotamt.InnerText = dstotalquot.Tables[0].Rows[0][0].ToString();

    }
    

    public void LeadSource()
    {
        try
        {
            SortedList sd3 = new SortedList();
            sd3.Add("@i_CompId", CurrentUser.CompId.ToString());

            //DataTable dtlead = erp.GetDataTableSP("usp_LeadSource_List", sd3);
            DataSet dslead = new DataSet();
            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId }
            };
            dslead = crmclient.list(para, "LeadSource");
            
            Legend chPie = new Legend();
            ChartLeadSource.Legends.Add(chPie);
            ChartLeadSource.DataSource = dslead;
            Series Pie = new Series();
            Pie.ChartType = SeriesChartType.Pie;
            ChartLeadSource.Series.Add(Pie);
            for (int i = 0; i < dslead.Tables[0].Rows.Count; i++)
            {
                ChartLeadSource.Series[0].Points.AddY(dslead.Tables[0].Rows[i]["NoofLeads"].ToString());
                ChartLeadSource.Series[0].Points[i].LegendText = dslead.Tables[0].Rows[i]["SourceofLead"].ToString().ToUpper();
                ChartLeadSource.Series[0].Points[i].Label = dslead.Tables[0].Rows[i]["NoofLeads"].ToString();
            }
            ChartLeadSource.Titles.Add("LEAD SOURCE");
            Font font = new Font("Times New Roman", 16, FontStyle.Bold);
            ChartLeadSource.Titles[0].Font = font;
        }
        catch (Exception ex)
        {

        }
    }

    /*Pie*/
    // Lead Status
    public void LeadStatusChart()
    {
        try
        {
           // DataTable dtlead = new DataTable();

            SortedList sd1 = new SortedList();

            sd1.Add("@i_CompId", CurrentUser.CompId.ToString());

            // dtlead = erp.GetDataTableSP("usp_LeadStatus_List", sd1);

            DataSet dsleadstatus = new DataSet();
            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId }
            };
            dsleadstatus = crmclient.list(para, "LeadStatus");

            ChartLeadStatus.DataSource = dsleadstatus;
            Legend Legend1 = new Legend();
            ChartLeadStatus.Legends.Add(Legend1);
            Series LeadStatus = new Series();
            ChartLeadStatus.Series.Add(LeadStatus);
            ChartLeadStatus.Series[0].ChartType = SeriesChartType.Pie;
            ChartLeadStatus.Series[0].Points.AddY(dsleadstatus.Tables[0].Rows[0]["InProgress"]);
            ChartLeadStatus.Series[0].Points.AddY(dsleadstatus.Tables[0].Rows[0]["Quotation"]);
          //  ChartLeadStatus.Series[0].Points.AddY(dsleadstatus.Tables[0].Rows[0]["Sale"]);

            ChartLeadStatus.Series[0].Points[0].LegendText = "INQUIRY";
            ChartLeadStatus.Series[0].Points[1].LegendText = "QUOTATION";
            //ChartLeadStatus.Series[0].Points[2].LegendText = "SALE";

            ChartLeadStatus.Series[0].Points[0].Label = dsleadstatus.Tables[0].Rows[0]["InProgress"].ToString();
            ChartLeadStatus.Series[0].Points[1].Label = dsleadstatus.Tables[0].Rows[0]["Quotation"].ToString();
           // ChartLeadStatus.Series[0].Points[2].Label = dsleadstatus.Tables[0].Rows[0]["Sale"].ToString();
           ChartLeadStatus.Titles.Add("LEAD STATUS");
            Font font = new Font("Times New Roman", 16, FontStyle.Bold);
            ChartLeadStatus.Titles[0].Font = font;
        }
        catch (Exception e)
        {

        }
    }

    /*Column*/
    //Top Selling Products
    public void TotalSalesRevenueChart()
    {
        try
        {
          //  DataTable dtProduct = new DataTable();

            SortedList sd2 = new SortedList();

            sd2.Add("@i_CompId", CurrentUser.CompId.ToString());

            //  dtProduct = erp.GetDataTableSP("usp_SaleRevenue_List", sd2);
            // DataTable dtChart = new DataTable();

            DataSet dsproduct = new DataSet();
            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId }
            };
            dsproduct = crmclient.list(para, "SaleRevenue");

           
            DataSet dschart = new DataSet();

            dschart.Tables[0].Columns.Add("Month");
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows.Add();
            dschart.Tables[0].Rows[0]["Month"] = "January";
            dschart.Tables[0].Rows[1]["Month"] = "February";
            dschart.Tables[0].Rows[2]["Month"] = "March";
            dschart.Tables[0].Rows[3]["Month"] = "April";
            dschart.Tables[0].Rows[4]["Month"] = "May";
            dschart.Tables[0].Rows[5]["Month"] = "June";
            dschart.Tables[0].Rows[6]["Month"] = "July";
            dschart.Tables[0].Rows[7]["Month"] = "August";
            dschart.Tables[0].Rows[8]["Month"] = "September";
            dschart.Tables[0].Rows[9]["Month"] = "October";
            dschart.Tables[0].Rows[10]["Month"] = "November";
            dschart.Tables[0].Rows[11]["Month"] = "December";
            dschart.Tables[0].Columns.Add("TotalAmount");
            for (int i = 0; i < dschart.Tables[0].Rows.Count; i++)
            {
                for (int j = i; j < 12; j++)
                {
                    if (dschart.Tables[0].Rows[j]["Month"].ToString().Equals(dsproduct.Tables[0].Rows[i]["Month"].ToString()))
                    {
                        dschart.Tables[0].Rows[j]["TotalAmount"] = dsproduct.Tables[0].Rows[i]["TotalAmount"].ToString();
                        break;
                    }
                }

            }
            for (int i = 0; i < dschart.Tables[0].Rows.Count; i++)
            {

                Series SeriesSale = new Series();

                ChartTotalRevenue.Series.Add(SeriesSale);
                ChartTotalRevenue.Series[0].ChartType = SeriesChartType.StepLine;
                ChartTotalRevenue.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
                ChartTotalRevenue.ChartAreas[0].AxisY.MajorGrid.Enabled = false;
                ChartTotalRevenue.Series[0].Points.AddXY(dschart.Tables[0].Rows[i]["MONTH"].ToString(), dschart.Tables[0].Rows[i]["TotalAmount"].ToString());
                //TotalRevenue.Series[0].Points.
                ChartTotalRevenue.Series[0].Points[i].MarkerStyle = MarkerStyle.Diamond;
                ChartTotalRevenue.Series[0].Points[i].MarkerSize = 20;
                ChartTotalRevenue.Series[0].Points[i].Label = dschart.Tables[0].Rows[i]["TotalAmount"].ToString();
                ChartTotalRevenue.ChartAreas[0].AxisX.Enabled = AxisEnabled.True;

            }
            ChartTotalRevenue.Titles.Add("TOTAL SALES REVENUE");
            Font font = new Font("Times New Roman", 16, FontStyle.Bold);
            ChartTotalRevenue.Titles[0].Font = font;
        }
        catch (Exception exc)
        {

        }
    }

    /*BAR*/
    //Quotation Data
    public void ProjectedSalesChart()
    {
        //DataTable dtProduct1 = new DataTable();
        // dtProduct1 = erp.GetDataTableSP("usp_SaleProduct_List", null);

        DataSet dssales = new DataSet();
       
        dssales = crmclient.list(null, "SaleProduct");

        Legend LegendSale = new Legend();

        ChartTopSales.Legends.Add(LegendSale);

        for (int i = 0; i < dssales.Tables[0].Rows.Count; i++)
        {
            Series SeriesSale = new Series();

            ChartTopSales.Series.Add(SeriesSale);
            ChartTopSales.Series[i].ChartType = SeriesChartType.Column;

            ChartTopSales.Series[i].Points.AddY(dssales.Tables[0].Rows[i]["TotalAmount"].ToString());
            ChartTopSales.Series[i].Points[0].Label = dssales.Tables[0].Rows[i]["TotalAmount"].ToString();
            ChartTopSales.Series[i].LegendText = dssales.Tables[0].Rows[i]["Item"].ToString().ToUpper();
            ChartTopSales.ChartAreas[0].AxisX.Enabled = AxisEnabled.False;
        }
        ChartTopSales.Titles.Add("TOP 5 SELLING PRODUCTS");
        Font font = new Font("Times New Roman", 16, FontStyle.Bold);
        ChartTopSales.Titles[0].Font = font;
    }


    /*PIE*/
    // Service Data
    public void ServiceStatusChart()
    {
        try
        {
            //DataTable dt = new DataTable();
            SortedList sd4 = new SortedList();
            sd4.Add("@i_CompId", CurrentUser.CompId.ToString());
            //  dt = erp.GetDataTableSP("Usp_ServiceStatus_List ", sd4);

            DataSet dsleadsource = new DataSet();
            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key ="@i_CompId" , Value = CurrentUser.CompId }
            };
            dsleadsource = crmclient.list(para, "ServiceStatus");

            ChartServiceStatus.DataSource = dsleadsource;

            Legend ld = new Legend();
            ChartServiceStatus.Legends.Add(ld);

            Series SeriesSale = new Series();

            SeriesSale.ChartType = SeriesChartType.Pie;
            ChartServiceStatus.Series.Add(SeriesSale);

            ChartServiceStatus.Series[0].Points.AddY(dsleadsource.Tables[0].Rows[0]["InProgress"]);
            ChartServiceStatus.Series[0].Points.AddY(dsleadsource.Tables[0].Rows[0]["OPEN"]);
            ChartServiceStatus.Series[0].Points.AddY(dsleadsource.Tables[0].Rows[0]["CLOSE"]);

            ChartServiceStatus.Series[0].Points[0].LegendText = "INPROGRESS";
            ChartServiceStatus.Series[0].Points[1].LegendText = "OPEN";
            ChartServiceStatus.Series[0].Points[2].LegendText = "CLOSE";

            ChartServiceStatus.Series[0].Points[0].Label = dsleadsource.Tables[0].Rows[0]["InProgress"].ToString();
            ChartServiceStatus.Series[0].Points[1].Label = dsleadsource.Tables[0].Rows[0]["OPEN"].ToString();

            ChartServiceStatus.Series[0].Points[2].Label = dsleadsource.Tables[0].Rows[0]["CLOSE"].ToString();
            ChartServiceStatus.Titles.Add("SERVICE STATUS");
            Font font = new Font("Times New Roman", 16, FontStyle.Bold);
            ChartServiceStatus.Titles[0].Font = font;
        }
        catch (Exception e)
        {

        }
    }

}