using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class OrderBooking_DispatchDetail : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataTable _dtDispatch = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DtdispatchAddcolumn();
        }
    }

    protected void lnkdateofinvoce_Click(object sender, EventArgs e)
    {
        txtDTInvoice.Focus();
        if (datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    
        }

    protected void lnkdatetofremoval_Click(object sender, EventArgs e)
    {
        txtRemovalOfGood.Focus();
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }

    }

    public void DtdispatchAddcolumn()
    {
        _dtDispatch.Columns.Add("BoNo");
        _dtDispatch.Columns.Add("BoDate");
        _dtDispatch.Columns.Add("DeNote");
        _dtDispatch.Columns.Add("DeDate");
        _dtDispatch.Columns.Add("SurefNo");
        _dtDispatch.Columns.Add("Destination");
        _dtDispatch.Columns.Add("DispDocNum");
        _dtDispatch.Columns.Add("DTVNo");
        _dtDispatch.Columns.Add("DTofInvoice");
        _dtDispatch.Columns.Add("DTofRemovalOfGood");
        _dtDispatch.Columns.Add("ShippingAdd");
        _dtDispatch.Columns.Add("AlternateShA");
       
       
    }



    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtRemovalOfGood.Focus();
        txtRemovalOfGood.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtDTInvoice.Focus();
        txtDTInvoice.Text = datepicker.SelectedDate.ToShortDateString();
        datepicker.Visible = false;
    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        DataRow dtrow;
        dtrow = _dtDispatch.NewRow();
        DtdispatchAddcolumn();
        dtrow["BoNo"] = txtPono.Text;
        dtrow["BoDate"] = txtOrderDate.Text;
        dtrow["DeNote"] = txtDeliveryNote.Text;
        dtrow["DeDate"] = txtDeliveryDate.Text;
        dtrow["SurefNo"] = txtSupRefNo.Text;
        dtrow["Destination"] = txtDestination.Text;
        dtrow["DispDocNum"] = txtDispatchDocNo.Text;
        dtrow["DTVNo"] = txtDisVehicalNo.Text;
        dtrow["DTofInvoice"] = txtDTInvoice.Text;
        dtrow["DTofRemovalOfGood"] = txtRemovalOfGood.Text;
        dtrow["ShippingAdd"] = txtshipbyAdddress.Text;
        dtrow["AlternateShA"] = txtShipAltrnetAdd.Text;

        _dtDispatch.Rows.Add(dtrow);
        Session["DispatchDetail"] = _dtDispatch;
       // Page.ClientScript.RegisterOnSubmitStatement(typeof(Page), "closePage", "window.onunload = CloseWindow();");
        Response.Redirect("../OrderBooking/OrderNew.aspx");
    }
}