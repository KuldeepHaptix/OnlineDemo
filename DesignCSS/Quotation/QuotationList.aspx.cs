using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class Quotation_QuotationList : System.Web.UI.Page
{
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataView DV;
    DataSet ds = new DataSet();
    string id;

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            RemoveSession();
            bindQuotation();
        }
    }

    protected void btnNewInq_Click(object sender, EventArgs e)
    {
        Session.Remove("QDTItem");
        Session.Remove("Addeditem");
        Response.Redirect("QuotationNew.aspx");
    }
    public void RemoveSession()
    {
        Session.Remove("QMode");
        Session.Remove("griddoc");
        Session.Remove("QDTitem");
        Session.Remove("FileName");
    }


    //protected void Calender_Click(object sender, ImageClickEventArgs e)
    //{
    //    if (datepicker.Visible == true)
    //    {
    //        datepicker.Visible = false;
    //    }
    //    else
    //    {
    //        datepicker.Visible = true;
    //    }
    //}

    //protected void datepicker_SelectionChanged(object sender, EventArgs e)
    //{
    //    txtNextDate.Text = datepicker.SelectedDate.ToLongDateString();
    //    datepicker.Visible = false;
    //}


    protected void btn_QuoteFollowup_Click(object sender, EventArgs e)
    {
        Response.Redirect("QuotationFollowup.aspx");
    }

    protected void btn_RevisedQuote_Click(object sender, EventArgs e)
    {
        Session["QMode"] = "Revised";
        
        Response.Redirect("QuotationNew.aspx?QIdRevised=" + Session["RevisedId"].ToString());
    }

    public void bindQuotation()
    {

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value =CurrentUser.CompId.ToString() },
        // new ParaList { Key = "@i_UserId", Value =CurrentUser.UserId },

        };


        ds = crmclient.list(para, "Quotation");

        Session["QuotListDS"] = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {
            GvQuotaion.DataSource = ds.Tables[0];
            GvQuotaion.DataBind();
        }
    }

    protected void GvQuotaion_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RecordEdit")
        {
            string QIDEdit = e.CommandArgument.ToString();
            Session["QEditID"] = QIDEdit;
            Session["QMode"] = "Edit";
            Response.Redirect("../Quotation/QuotationNew.aspx?QidEdit=" + QIDEdit);

        }

        if (e.CommandName == "Select")
        {
            string Qid = e.CommandArgument.ToString();
            Session["RevisedId"] = Qid;
            //Response.Redirect("../Inquiry/InquiryFolloup.aspx?FId=" + Fid);
            Session["FollowupId"] = Qid;
        }

        if (e.CommandName == "report")
        {
            Response.Redirect("~/Reportviewr.aspx?id=" + e.CommandArgument.ToString() + "&frm=Quotation");
        }
    }

    protected void GvQuotaion_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string QuotationId = (GvQuotaion.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = QuotationId.ToString() },


        };

        crmclient.Delete(para, "Quotation");
        bindQuotation();
    }

    protected void GvQuotaion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvQuotaion.PageIndex = e.NewPageIndex;
        bindQuotation();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable ds1 = new DataTable();
        ds1 = (DataTable)Session["QuotListDS"];
        string strFilter = "";

        strFilter = strFilter + " Code LIKE '%" + txtsearch.Text + "%' OR " +
        " CustomerName LIKE '%" + txtsearch.Text + "%' OR " +
        "ContactPerson LIKE '%" + txtsearch.Text + "%' OR " +
        "QDate LIKE '%" + txtsearch.Text + "%' OR " +
        "LeadMobile LIKE '%" + txtsearch.Text + "%' OR " +
        "LeadEmail LIKE '%" + txtsearch.Text + "%' OR " +
        "FollowupDate1 LIKE '%" + txtsearch.Text + "%' OR " +
        "Remark LIKE '%" + txtsearch.Text + "%' OR " +
        "Convert(TotalAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR " +
        "Convert(NetAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR ";

        strFilter = strFilter.Substring(0, strFilter.Length - 3);

        DV = ds1.DefaultView;
        DV.RowFilter = strFilter;
        GvQuotaion.DataSource = DV.Table;
        GvQuotaion.DataBind();
    }

    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        DataTable ds1 = new DataTable();
        ds1 = (DataTable)Session["QuotListDS"];
        string strFilter = "";

       
        strFilter = strFilter + " Code LIKE '%" + txtsearch.Text + "%' OR " +
        " CustomerName LIKE '%" + txtsearch.Text + "%' OR " +
        "ContactPerson LIKE '%" + txtsearch.Text + "%' OR " +
        "QDate LIKE '%" + txtsearch.Text + "%' OR " +
        "LeadMobile LIKE '%" + txtsearch.Text + "%' OR " +
        "LeadEmail LIKE '%" + txtsearch.Text + "%' OR " +
        "FollowupDate1 LIKE '%" + txtsearch.Text + "%' OR " +
        "Remark LIKE '%" + txtsearch.Text + "%' OR " +
        "Convert(TotalAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR " +
        "Convert(NetAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR ";

        strFilter = strFilter.Substring(0, strFilter.Length - 3);
        
        DV = ds1.DefaultView;
        DV.RowFilter = strFilter;
        GvQuotaion.DataSource = DV.Table;
        GvQuotaion.DataBind();
    }

    protected void btn_refresh_Click(object sender, EventArgs e)
    {
        bindQuotation();
    }

    //protected void btn_generateQuotation_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("~/Reportviewr.aspx?id =" + id + "&frm=Quotation");
    //}
}