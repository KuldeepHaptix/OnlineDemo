using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ClientServices;
using System.Web.Management;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Globalization;
using System.IO;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Web.UI.HtmlControls;
//using myApp.ns.pages;
using System.Net;
using System.IO;
using System.Data.OleDb;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Web;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting.WebControls;
using CrystalDecisions.Reporting;
using CrystalDecisions.Shared;
using CrystalDecisions.Web.Design;
using System.Web.Script.Services;
//using CrystalReportViewerWebReportSourceLib;
using NewCRMService;


public partial class Reportviewr : System.Web.UI.Page
{
    string id;
    string MODE;
    string avg;

    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();

    Service crmclient = new Service();
    string accid;
    DateTime frmdt;
    DateTime todate;
    string accmode;
    string mpdfFile;


    // ReportDocument crystalReport = new CrystalDecisions.CrystalReports.Engine.ReportDocument();
    //ReportDocument crystalReport = new ReportDocument();

    //DataTable dtgrid = new DataTable();
    //DataTable dtsalesreg = new DataTable();
    //DataTable dtsalesdetailreg = new DataTable();

    //DataTable dt1 = new DataTable();
    //DataTable dt2 = new DataTable();

    //DataTable dtservicegrid = new DataTable();

    //Int64 SIID = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        id = Request.QueryString[0];
        MODE = Request.QueryString[1];

        //  if (Session["Reportdoc"] != null)
        // {
        CrystalReportViewer2.ReportSource = Session["Reportdoc"];
        CrystalReportViewer2.DisplayToolbar = true;

        /*
        if (MODE == "inquiry")
        {
            try
            {
                SortedList sd1 = new SortedList();
                sd1.Add("@i_CompId", CurrentUser.CompId);
                dtgrid = erp.GetDataTableSP("usp_Lead_List", sd1);


                DataView DVReport;
                DVReport = dtgrid.DefaultView;
                crystalReport.Load(Server.MapPath("~/Reports/rptLeadRegister.rpt"));
                crystalReport.Database.Tables[0].SetDataSource(dtgrid);
                CurrentUser.AddReportParameters(crystalReport, dtgrid, true, "Inquiry Register", false, false, false, false, false);
                CrystalReportViewer2.ReportSource = crystalReport;


            }
            catch (Exception ex)
            {

            }
        }

        if (MODE == "quotationreg")
        {
            try
            {
                SortedList sd1 = new SortedList();
                sd1.Add("@i_CompId", CurrentUser.CompId);
                //  dtgrid = erp.GetDataTableSP("usp_Quotation_List", sd1);

                DataView DVReport;
                DVReport = dtgrid.DefaultView;

                crystalReport.Load(Server.MapPath("~/Reports/rptQuotationRegister.rpt"));
                crystalReport.Database.Tables[0].SetDataSource(dtgrid);
                CurrentUser.AddReportParameters(crystalReport, dtgrid, true, "Quotation Register", false, false, false, false, false);
                CrystalReportViewer2.ReportSource = crystalReport;
            }
            catch (Exception ex)
            {

            }
        }
        */

        #region Quotation
        if (MODE == "Quotation")
        {
            try
            {
                DataSet ds = new DataSet();
                // LogoBind(dt);
                mpdfFile = Server.MapPath(@"\pdf\QuotationTAX.pdf");

                //  DataTable dtReport = new DataTable();
                List<ParaList> para1 = new List<ParaList>()
                {
                    new ParaList {Key="@i_RecID",Value= id },
                    new ParaList {Key="@i_CompId",Value= CurrentUser.CompId.ToString() },
                };
                ReportDocument crystalReport = new ReportDocument();
                ds = crmclient.Select(para1, "rpt_Quotation");

                DataSet dsTNC = new DataSet();

                //para.Add("@i_RecID", id);
                //para.Add("@i_TNC_Sub", "Quotation");
                //para.Add("@i_CompId", CurrentUser.CompId);

                List<ParaList> para2 = new List<ParaList>()
                {
                    new ParaList {Key="@i_RecID",Value= id },
                     new ParaList {Key="@i_TNC_Sub",Value="Quotation" },
                    new ParaList {Key="@i_CompId",Value= CurrentUser.CompId.ToString() },
                };

                dsTNC = crmclient.Select(para2, "rpt_Quotation_TNC");
                //    erp.GetDataTableSP("rpt_Quotation_TNC", para);

                //crystalReport.Database.Tables[0].SetDataSource(ds);
                //crystalReport.Database.Tables[1].SetDataSource(dsTNC);
               // crystalReport.Load(Server.MapPath("~/Reports/rptCrystalReport.rpt"));
                crystalReport.Load(Server.MapPath("~/Reports/rptQuotationTAX.rpt"));
                crystalReport.Database.Tables[0].SetDataSource(ds.Tables[0]);
                crystalReport.Database.Tables[1].SetDataSource(dsTNC.Tables[0]);

                ExportOptions CrExportOptions;
                DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
                PdfRtfWordFormatOptions CrFormatTypeOptions = new PdfRtfWordFormatOptions();
                CrDiskFileDestinationOptions.DiskFileName = mpdfFile;
                CrExportOptions = crystalReport.ExportOptions;//Report document  object has to be given here
                CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
                CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
                CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
                CrExportOptions.FormatOptions = CrFormatTypeOptions;

                CurrentCompany.AddReportParameters(crystalReport, ds, false, "rptCrystalReport", false, false, false, false, false);
                // crystalReport.Database.Tables[0].SetDataSource(ds);
    //            CurrentUser.AddReportParameters(crystalReport, ds, true, "", false, true, true, true, true);
                CrystalReportViewer2.ReportSource = crystalReport;

            }
            catch (Exception exc)
            {
                throw exc;
            }
        }
        #endregion

        //    ERPStoreProcedure erp = new ERPStoreProcedure();
        //    id = Request.QueryString[0];
        //    MODE = Request.QueryString[1];


        //    //  if (Session["Reportdoc"] != null)
        //    // {
        //    CrystalReportViewer2.ReportSource = Session["Reportdoc"];
        //    CrystalReportViewer2.DisplayToolbar = true;

        //    //ReportDocument crystalReport = new ReportDocument();
        //    //crystalReport.Load(Server.MapPath("~/Reports/rptAverage.rpt"));
        //    //crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //CrystalReportViewer3.ReportSource = crystalReport;


        //    if (MODE == "Customermailinglbl")
        //    {
        //        // SortedList sf = new SortedList();
        //        // sf.Add("@mode", "selectqry");
        //        // DataTable dt = erp.GetDataTableSP("[rpt_Customer_mail]", sf);
        //        //  ReportDocument crystalReport = new ReportDocument();
        //        crystalReport.Load(Server.MapPath("~/Reports/rptCustomerMailingLabel.rpt"));
        //        crystalReport.SetDataSource(Session["Reportdoc"]);
        //        CrystalReportViewer2.ReportSource = crystalReport;
        //    }


        //    //if (MODE == "CustomerRegister1")
        //    //{
        //    //    //SortedList sf = new SortedList();
        //    //    //sf.Add("@mode", "selectqry");
        //    //    //DataTable dt = erp.GetDataTableSP("[usp_Customer_List]", sf);
        //    //    ////  ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptCustomerRegister.rpt"));
        //    //    crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "VendorRegister1")
        //    //{
        //    //    //SortedList sf = new SortedList();
        //    //    //sf.Add("@mode", "selectqry");
        //    //    //DataTable dt = erp.GetDataTableSP("[rpt_Vendor_List]", sf);
        //    //    //// ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptVendorRegister.rpt"));
        //    //    crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}



        //    //if (MODE == "VendorMailingLable")
        //    //{
        //    //    //SortedList sf = new SortedList();
        //    //    //sf.Add("@mode", "selectqry");
        //    //    //DataTable dt = erp.GetDataTableSP("[rpt_Vendor_List]", sf);
        //    //    //// ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptVendorMailingLabel.rpt"));
        //    //    crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "CustomerPendingReminders")
        //    //{
        //    //    //SortedList sf = new SortedList();
        //    //    //sf.Add("@mode", "selectqry");
        //    //    //DataTable dt = erp.GetDataTableSP("[rpt_Vendor_List]", sf);
        //    //    //// ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptCustpendingReminder.rpt"));
        //    //    crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "Bookingslip")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@i_RecID", id);
        //    //    DataTable dt = erp.GetDataTableSP("[rpt_Driver_Duty_Voucher]", sf);
        //    //    //    ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rpt_Booking_Slip.rpt"));


        //    //    TextObject T = (TextObject)crystalReport.ReportDefinition.Sections["Section3"].ReportObjects["txtkm"];
        //    //    if (dt.Rows[0]["RatePerKMs"].ToString() == "1")
        //    //    {
        //    //        T.Text = "Rate per Km";
        //    //    }
        //    //    if (dt.Rows[0]["RatePerKMs"].ToString() == "2")
        //    //    {
        //    //        T.Text = "Rate per Day";
        //    //    }
        //    //    if (dt.Rows[0]["RatePerKMs"].ToString() == "3")
        //    //    {
        //    //        T.Text = "Fix Rate";
        //    //    }


        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "BookingRegister")
        //    //{
        //    //    //SortedList sf = new SortedList();
        //    //    //sf.Add("@mode", "selectqry");
        //    //    //DataTable dt = erp.GetDataTableSP("[usp_Booking_List]", sf);
        //    //    // ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptBookingReg.rpt"));
        //    //    crystalReport.SetDataSource(Session["Reportdoc"]);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "SalesVoucher")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@i_SaleID", id);
        //    //    DataTable dt = erp.GetDataTableSP("[rpt_Sale_Voucher]", sf);
        //    //    // ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptSalesVoucher.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "PaymentReg")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@mode", "selectqry");
        //    //    DataTable dt = erp.GetDataTableSP("[usp_CustomerReceipt_List]", sf);
        //    //    // ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptDailyPaymentRegister.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "Vendorpayment")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@mode", "selectqry");
        //    //    DataTable dt = erp.GetDataTableSP("[rpt_VendorPayment]", sf);
        //    //    // ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptVendorPaymentRegister.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "VendorRegister")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@mode", "selectqry");
        //    //    DataTable dt = erp.GetDataTableSP("[usp_VendorPayment_List]", sf);
        //    //    //  ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptVendorReg.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "AccountLedger")
        //    //{
        //    //    id = Request.QueryString[0];
        //    //    MODE = Request.QueryString[1];
        //    //    frmdt = DateTime.ParseExact(Request.QueryString[2], "yyyy-MM-dd", null);
        //    //    todate = DateTime.ParseExact(Request.QueryString[3], "yyyy-MM-dd", null);



        //    //    SortedList sd = new SortedList();
        //    //    sd.Add("@i_AccountID", id);
        //    //    sd.Add("@i_FromDate", frmdt);
        //    //    sd.Add("@i_ToDate", todate);
        //    //    DataTable dt = erp.GetDataTableSP("rpt_AccountLedger", sd);



        //    //    //ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptLedger.rpt"));



        //    //    TextObject frm = (TextObject)crystalReport.ReportDefinition.ReportObjects["txtfrm"];
        //    //    frm.Text = frmdt.ToString("dd/MM/yyyy");

        //    //    TextObject to = (TextObject)crystalReport.ReportDefinition.ReportObjects["txtto"];
        //    //    to.Text = todate.ToString("dd/MM/yyyy");

        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "CartypeRegister")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@i_CarTypeID", id);
        //    //    DataTable dt = erp.GetDataTableSP("[rpt_Car_SaleList]", sf);
        //    //    // ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptCarTypeWiseRegister.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}



        //    //if (MODE == "LocationRegister")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@i_mode", "");
        //    //    DataTable dt = erp.GetDataTableSP("[rpt_CountryStateCityArea]", sf);
        //    //    //  ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptLocationReg.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    //if (MODE == "CustomerReg")
        //    //{
        //    //    SortedList sf = new SortedList();
        //    //    sf.Add("@mode", "selectqry");
        //    //    DataTable dt = erp.GetDataTableSP("[usp_CustomerReceipt_List]", sf);
        //    //    //  ReportDocument crystalReport = new ReportDocument();
        //    //    crystalReport.Load(Server.MapPath("~/Reports/rptCustomerReg.rpt"));
        //    //    crystalReport.SetDataSource(dt);
        //    //    CrystalReportViewer2.ReportSource = crystalReport;
        //    //}

        //    if (MODE == "inquiry")
        //    {
        //        try
        //        {
        //            SortedList sd1 = new SortedList();
        //            sd1.Add("@i_CompId", CurrentUser.CompId);
        //            dtgrid = erp.GetDataTableSP("usp_Lead_List", sd1);
        //            DataView DVReport;
        //            DVReport = dtgrid.DefaultView;
        //            crystalReport.Load(Server.MapPath("~/Reports/rptLeadRegister.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtgrid);
        //            CurrentUser.AddReportParameters(crystalReport, dtgrid, true, "Inquiry Register", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;


        //        }
        //        catch (Exception ex)
        //        {

        //        }
        //    }

        //    if (MODE == "quotationreg")
        //    {
        //        try
        //        {
        //            SortedList sd1 = new SortedList();
        //            sd1.Add("@i_CompId", CurrentUser.CompId);
        //            dtgrid = erp.GetDataTableSP("usp_Quotation_List", sd1);
        //            DataView DVReport;
        //            DVReport = dtgrid.DefaultView;
        //            crystalReport.Load(Server.MapPath("~/Reports/rptQuotationRegister.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtgrid);
        //            CurrentUser.AddReportParameters(crystalReport, dtgrid,true, "Quotation Register", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }
        //        catch (Exception ex)
        //        {

        //        }
        //    }

        //    if (MODE == "salesreg")
        //    {
        //        try
        //        {
        //            SortedList sdreg = new SortedList();
        //            // sdreg.Add("@i_FYID", CurrentUser.FYID);
        //            sdreg.Add("@i_CompId", CurrentUser.CompId);
        //            //  sdreg.Add("@i_UserId", CurrentUser.UserID);
        //            dtsalesreg = erp.GetDataTableSP("rpt_SalesInvoiceRegister", sdreg);
        //            // dtsalesreg = erp.GetDataTableSP("usp_SalesInvoice_List", sdreg);      
        //            //  DataView DVReport;
        //            //DVReport = dtsalesreg.DefaultView;
        //            crystalReport.Load(Server.MapPath("~/Reports/rptSalesInvoiceRegister-GST.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtsalesreg);
        //            CurrentUser.AddReportParameters(crystalReport, dtsalesreg,true , "SalesInvoice GST Register", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }

        //        catch (Exception ex)
        //        {

        //        }
        //    }

        //    if (MODE == "salesregdetail")
        //    {
        //        try
        //        {
        //            SortedList sd1 = new SortedList();
        //            sd1.Add("@i_SIID", SIID);
        //            dtsalesdetailreg = erp.GetDataTableSP("rpt_SalesInvoiceDetail", sd1);
        //            DataView DVReport;
        //            DVReport = dtsalesdetailreg.DefaultView;
        //            crystalReport.Load(Server.MapPath("~/Reports/rptSalesInvoiceRegisterWithDetail.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtsalesdetailreg);
        //            CurrentUser.AddReportParameters(crystalReport, dtsalesdetailreg,true , "SalesInvoice Detail Register", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }
        //        catch (Exception ex)
        //        {

        //        }
        //    }

        //    if (MODE == "Sales")
        //    {
        //        try
        //        {
        //            SortedList sf = new SortedList();
        //            sf.Add("@i_RecID",id);
        //            sf.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dt = erp.GetDataTableSP("rpt_SalesInvoice", sf);
        //            //SortedList para2 = new SortedList();
        //            //para2.Add("@i_CompId", CurrentUser.CompId.ToString());
        //            //DataTable dtCompany = erp.GetDataTableSP("rpt_Company", para2);
        //            SortedList para = new SortedList();
        //            para.Add("@i_RecID", id);
        //            para.Add("@i_TNC_Sub", "Sales");
        //            para.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dtTNC = erp.GetDataTableSP("rpt_Sales_TNC", para);
        //            //DataTable dtLogo = new DataTable();
        //            //  ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath("~/Reports/rptSalesInvoice.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dt);
        //            crystalReport.Subreports[0].Database.Tables[0].SetDataSource(dtTNC);
        //            CurrentUser.AddReportParameters(crystalReport, dt,true, "TAX INVOICE", false, false, false, false, false);

        //            CrystalReportViewer2.ReportSource = crystalReport;

        //        }
        //        catch (Exception exc)
        //        {

        //        }
        //    }

        //    if (MODE == "Performa")
        //    {
        //        try
        //        {
        //            SortedList sf1 = new SortedList();
        //            sf1.Add("@i_RecID", id);
        //            sf1.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dt1 = erp.GetDataTableSP("rpt_SalesInvoice", sf1);
        //            //SortedList para2 = new SortedList();
        //            //para2.Add("@i_CompId", CurrentUser.CompId.ToString());
        //            //DataTable dtCompany = erp.GetDataTableSP("rpt_Company", para2);
        //            SortedList para1 = new SortedList();
        //            para1.Add("@i_RecID", id);
        //            para1.Add("@i_TNC_Sub", "Sales");
        //            para1.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dtTNC1 = erp.GetDataTableSP("rpt_Sales_TNC", para1);
        //            //DataTable dtLogo = new DataTable();
        //            //  ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath("~/Reports/rptSalesInvoice.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dt1);
        //            crystalReport.Subreports[0].Database.Tables[0].SetDataSource(dtTNC1);
        //            CurrentUser.AddReportParameters(crystalReport, dt1,true , "PERFORMA INVOICE", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;

        //        }
        //        catch (Exception exc)
        //        {

        //        }
        //    }

        //    if (MODE == "Deliverychalan")
        //    {
        //        try
        //        {
        //            SortedList sf2 = new SortedList();
        //            sf2.Add("@i_RecID", id);
        //            sf2.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dt2 = erp.GetDataTableSP("rpt_SalesInvoice", sf2);
        //            //SortedList para2 = new SortedList();
        //            //para2.Add("@i_CompId", CurrentUser.CompId.ToString());
        //            //DataTable dtCompany = erp.GetDataTableSP("rpt_Company", para2);
        //            SortedList para2 = new SortedList();
        //            para2.Add("@i_RecID", id);
        //            para2.Add("@i_TNC_Sub", "Sales");
        //            para2.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dtTNC2 = erp.GetDataTableSP("rpt_Sales_TNC", para2);
        //            //DataTable dtLogo = new DataTable();
        //            //  ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath("~/Reports/rptDeliveryChallan.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dt2);
        //            crystalReport.Subreports[0].Database.Tables[0].SetDataSource(dtTNC2);
        //            CurrentUser.AddReportParameters(crystalReport, dt2,true, "DELIVERY CHALLAN", false, false, false, false, false);
        //            CurrentUser.AddExtraParameter(crystalReport);
        //            CrystalReportViewer2.ReportSource = crystalReport;

        //        }
        //        catch (Exception exc)
        //        {

        //        }

        //    }

        //    if (MODE == "servicereg")
        //    {
        //        try
        //        {
        //            SortedList sd1 = new SortedList();
        //            sd1.Add("@i_CompId", CurrentUser.CompId);
        //            dtservicegrid = erp.GetDataTableSP("usp_ServiceModule_List", sd1);
        //            DataView DVReport;
        //            DVReport = dtservicegrid.DefaultView;
        //            crystalReport.Load(Server.MapPath("~/Reports/rptServiceRegister-GST.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtservicegrid);
        //            CurrentUser.AddReportParameters(crystalReport, dtservicegrid, true, "SalesInvoice Register", false, false, false, false,false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }
        //        catch (Exception ex)
        //        {

        //        }
        //    }

        //    if (MODE == "Service")
        //    {
        //        try
        //        {
        //            SortedList sf4 = new SortedList();
        //            sf4.Add("@i_RecID", id);
        //            sf4.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dtservice = erp.GetDataTableSP("rpt_ServiceInvoice", sf4);
        //            SortedList para2 = new SortedList();
        //            para2.Add("@i_CompId", CurrentUser.CompId.ToString());
        //            DataTable dtCompany = erp.GetDataTableSP("rpt_Company", para2);
        //            SortedList para4 = new SortedList();
        //            para4.Add("@i_RecID", id);
        //            para4.Add("@i_TNC_Sub", "Service");
        //            para4.Add("@i_CompId", CurrentUser.CompId);
        //            DataTable dtTNC3 = erp.GetDataTableSP("rpt_Service_TNC", para4);
        //            //DataTable dtLogo = new DataTable();
        //            //  ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath("~/Reports/rptServiceInvoice.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtservice);
        //            crystalReport.Subreports[0].Database.Tables[0].SetDataSource(dtTNC3);
        //            CurrentUser.AddReportParameters(crystalReport, dtservice,true , "Service Invoice", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }
        //        catch (Exception exc)
        //        {

        //        }
        //    }

        //    if (MODE == "serviceorder")
        //    {
        //        try
        //        {
        //            SortedList sf3 = new SortedList();
        //            sf3.Add("@i_RecID", id);
        //            DataTable dtservice = erp.GetDataTableSP("rpt_Service_Order", sf3);
        //            //SortedList para2 = new SortedList();
        //            //para2.Add("@i_CompId", CurrentUser.CompId.ToString());
        //            //DataTable dtCompany = erp.GetDataTableSP("rpt_Company", para2);
        //            //para3.Add("@i_TNC_Sub", "Service");
        //            //para3.Add("@i_CompId", CurrentUser.CompId);
        //            //DataTable dtTNC3 = erp.GetDataTableSP("rpt_Service_TNC", para3);
        //            //DataTable dtLogo = new DataTable();
        //             ReportDocument crystalReport = new ReportDocument();
        //            crystalReport.Load(Server.MapPath("~/Reports/rptServiceOrder.rpt"));
        //            crystalReport.Database.Tables[0].SetDataSource(dtservice);
        //            //crystalReport.Subreports[0].Database.Tables[0].SetDataSource(dtTNC3);
        //            CurrentUser.AddReportParameters(crystalReport, dtservice,true , "Service Order", false, false, false, false, false);
        //            CrystalReportViewer2.ReportSource = crystalReport;
        //        }
        //        catch (Exception exc)
        //        {

        //        }
        //    }
        //}
    }
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}
}