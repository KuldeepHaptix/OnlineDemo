using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class Inquiry_InquiryFollowupList : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new ServiceClient();
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
        };

        dsFolllowup = crmclient.list(para, "Invoice");

        if(dsFolllowup.Tables[0].Rows.Count>0)
        {
            GVFollowUpList.DataSource = dsFolllowup;
            GVFollowUpList.DataBind();
        }
    }

    protected void GVFollowUpList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            string Fid = e.CommandArgument.ToString();
            Session["FollowUpId"] = Fid;
            //Response.Redirect("../Inquiry/InquiryFolloup.aspx?FId=" + Fid);

        }
    }

    protected void btnNewFollowup_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("~/Inquiry/InquiryFolloup.aspx?FId=" + Session["FollowUpId"].ToString());

    }

    protected void GVFollowUpList_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVFollowUpList.EditIndex = e.NewEditIndex;
        bindLeadFollowUp();
    }

    protected void GVFollowUpList_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVFollowUpList.EditIndex = -1;
        bindLeadFollowUp();
    }

    protected void GVFollowUpList_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        DropDownList drpstatus=(DropDownList)GVFollowUpList.Rows[e.RowIndex].FindControl("drpstatus");

        long Fid = Convert.ToInt32(GVFollowUpList.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_Status", Value=drpstatus.SelectedItem.Text },
             new ParaList {Key="@i_Id", Value=Fid.ToString() },
        };
        crmclient.Update(para, "LeadStatus");

        GVFollowUpList.EditIndex = -1;
        bindLeadFollowUp();
    }
}