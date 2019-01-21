using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class OrderBooking_OrderBookingList : System.Web.UI.Page
{
    Service crmclient = new Service();
   // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindAllOrder();
            Removesession();
        }
      
    }

    protected void btnNewInq_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderNew.aspx");
    }
    protected void Removesession()
    {
        Session.Remove("QuotationID");

        Session.Remove("OrderNo");

        Session.Remove("Apptaken");

        Session.Remove("Allocatedto");

        Session.Remove("Cstomer");

        Session.Remove("Address");

        Session.Remove("Mobile");

        Session.Remove("Email");
        Session.Remove("Narration");
        Session.Remove("Status");
        Session.Remove("chalanNo");

        Session.Remove("paymentMode");


        Session.Remove("BankIn");

        Session.Remove("BankOut");


        Session.Remove("chequeNo");

        Session.Remove("chequeDate");



        Session.Remove("Duedays");

        Session.Remove("recdays");


      
    }
    public void bindAllOrder()
    {
        DataSet ds = new DataSet();
        List<ParaList> para = new List<ParaList>()
       {
           new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
       };
        ds = crmclient.list(para, "SalesInvoice");
        if(ds.Tables[0].Rows.Count>0)
        {
            GvOrder.DataSource = ds.Tables[0];
            GvOrder.DataBind();
        }

    }

    protected void GvOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string SalesId = (GvOrder.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para1 = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = SalesId.ToString() },


        };

        crmclient.Delete(para1, "SalesInvoice");
        bindAllOrder();
    }

    protected void GvOrder_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RecordEdit")
        {
            string OIDEdit = e.CommandArgument.ToString();
            Session["OEditID"] = OIDEdit;
            Session["OMode"] = "Edit";
            Response.Redirect("../OrderBooking/OrderNew.aspx?OidEdit=" + OIDEdit);

        }
    }
}