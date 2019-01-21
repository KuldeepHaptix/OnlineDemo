using NewCRMService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Quotation_QuotationFollowupList : System.Web.UI.Page
{
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindLeadFollowUp();
        }
    }

    public void bindLeadFollowUp()
    {
        DataSet dsFolllowup = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
            new ParaList {Key="@i_UserId", Value=CurrentUser.UserId },
        };

        dsFolllowup = crmclient.list(para, "Reminder");

        if (dsFolllowup.Tables[0].Rows.Count > 0)
        {
            GvQuotationFollowup.DataSource = dsFolllowup;
            GvQuotationFollowup.DataBind();
        }
    }

    protected void GvQuotationFollowup_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string Fid = e.CommandArgument.ToString();
            Session["FollowupId"] = Fid;
        }
    }

    protected void btnNewFollowup_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Quotation/QuotationFollowup.aspx");
    }
}