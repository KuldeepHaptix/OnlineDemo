using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class InerInquiryTesting : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataView DV;
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindLeadList();
        }
    }

    public void bindLeadList()
    {
        
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value =CurrentUser.CompId },
         new ParaList { Key = "@i_UserId", Value =CurrentUser.UserId },

        };


        ds = crmclient.list(para, "Lead");

        Session["LeadListDS"] = ds.Tables[0];
        if (ds.Tables[0].Rows.Count > 0)
        {
            GvLeadList.DataSource = ds.Tables[0];
            GvLeadList.DataBind();
        }
      

    }
    protected void btnNewInq_Click(object sender, EventArgs e)
    {
        Session["EmpMode"] = "Insert";
        Response.Redirect("~/Inquiry/NewInquiry.aspx");
        
    }
    protected void btn_followup_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("~/Inquiry/InquiryFolloup.aspx?FId=" + Session["FollowUpId"].ToString());
    }

    protected void GvLeadList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvLeadList.PageIndex = e.NewPageIndex;
        bindLeadList();
    }

    protected void GvLeadList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RecordEdit")
        {
            string LeadId = e.CommandArgument.ToString();
            
            Session["EmpMode"] = "Edit";
            Response.Redirect("../Inquiry/NewInquiry.aspx?LeadId=" + LeadId);

        }
        if(e.CommandName == "Select")
        {
            string Fid = e.CommandArgument.ToString();
            Session["FollowUpId"] = Fid;
            //Response.Redirect("../Inquiry/InquiryFolloup.aspx?FId=" + Fid);

        }
    }

    protected void GvLeadList_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        string Leadid = (GvLeadList.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para1 = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = Leadid.ToString() },


        };

        crmclient.Delete(para1, "Lead");
        bindLeadList();
    }

    protected void btn_refresh_Click(object sender, EventArgs e)
    {
        bindLeadList();
    }

    protected void txtsearch_TextChanged(object sender, EventArgs e)
    {
        DataTable ds1 = new DataTable();
        ds1 = (DataTable)Session["LeadListDS"];
        string strFilter = "";

        strFilter = strFilter + " LeadDate LIKE '%" + txtsearch.Text + "%' OR " +
        " LeadNo LIKE '%" + txtsearch.Text + "%' OR " +
        " CustomerName LIKE '%" + txtsearch.Text + "%' OR " +
        "Phone1 LIKE '%" + txtsearch.Text + "%' OR " +
        "Email LIKE '%" + txtsearch.Text + "%' OR ";
        //"LeadMobile LIKE '%" + txtsearch.Text + "%' OR " +
        //"LeadEmail LIKE '%" + txtsearch.Text + "%' OR " +
        //"FollowupDate1 LIKE '%" + txtsearch.Text + "%' OR " +
        //"Remark LIKE '%" + txtsearch.Text + "%' OR " +
        //"Convert(TotalAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR " +
        //"Convert(NetAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR ";

        strFilter = strFilter.Substring(0, strFilter.Length - 3);

        DV = ds1.DefaultView;
        DV.RowFilter = strFilter;
        GvLeadList.DataSource = DV.Table;
        GvLeadList.DataBind();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DataTable ds1 = new DataTable();
        ds1 = (DataTable)Session["LeadListDS"];
        string strFilter = "";

        strFilter = strFilter + " LeadDate LIKE '%" + txtsearch.Text + "%' OR " +
        " LeadNo LIKE '%" + txtsearch.Text + "%' OR " +
        " CustomerName LIKE '%" + txtsearch.Text + "%' OR " +
        "Phone1 LIKE '%" + txtsearch.Text + "%' OR " +
        "Email LIKE '%" + txtsearch.Text + "%' OR ";
        //"LeadMobile LIKE '%" + txtsearch.Text + "%' OR " +
        //"LeadEmail LIKE '%" + txtsearch.Text + "%' OR " +
        //"FollowupDate1 LIKE '%" + txtsearch.Text + "%' OR " +
        //"Remark LIKE '%" + txtsearch.Text + "%' OR " +
        //"Convert(TotalAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR " +
        //"Convert(NetAmount,'System.String') LIKE '" + txtsearch.Text + "%' OR ";

        strFilter = strFilter.Substring(0, strFilter.Length - 3);

        DV = ds1.DefaultView;
        DV.RowFilter = strFilter;
        GvLeadList.DataSource = DV.Table;
        GvLeadList.DataBind();
    }
}