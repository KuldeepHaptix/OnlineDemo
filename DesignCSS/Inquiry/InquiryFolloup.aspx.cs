using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class InquiryFolloup : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    string FllowId;
    protected void Page_Load(object sender, EventArgs e)
    {
        FllowId = Request.QueryString["FID"].ToString();
        if (!IsPostBack)
        {
            bindEmployee();

            bindFollowupData();
        }
    }

    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtNextDate.Focus();
        txtNextDate.Text = datepicker.SelectedDate.ToString("dd/MM/yyyy");
        datepicker.Visible = false;
    }

   public void bindFollowupData()
    {
        DataSet dsFollowup = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=FllowId },
        };
      dsFollowup= crmclient.Select(para, "Lead");
        if(dsFollowup.Tables[0].Rows.Count>0)
        {
            txtCode.Text = dsFollowup.Tables[0].Rows[0]["LeadNo"].ToString();
            txtDate.Text = dsFollowup.Tables[0].Rows[0]["LeadDate"].ToString();
            txtcustname.Text = dsFollowup.Tables[0].Rows[0]["CustomerName"].ToString();
            txtLastFollowupDate.Text = dsFollowup.Tables[0].Rows[0]["NextFollowUpDate"].ToString();
            drpApptaken.SelectedValue= dsFollowup.Tables[0].Rows[0]["Apptaken"].ToString();
        }

    }

    protected void lnknextfollowp_Click(object sender, EventArgs e)
    {
        txtNextDate.Focus();
        if (datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    }


    public void bindEmployee()
    {
        DataSet dsApptaken = new DataSet();
        List<ParaList> para = new List<ParaList>() {


         new ParaList { Key = "@i_Compid", Value =CurrentUser.CompId},


        };

        drpApptaken.DataValueField = "EmpID";
        drpApptaken.DataTextField = "EmpName";


        dsApptaken = crmclient.FillDDL(para, "Employee");
        drpApptaken.DataSource = dsApptaken.Tables[0];
        drpApptaken.DataBind();
        drpApptaken.Items.Insert(0, new ListItem("--Select--", "0"));
        
    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        DataSet dsApptaken = new DataSet();
        List<ParaList> para = new List<ParaList>() {


         new ParaList { Key = "@i_LeadID", Value =FllowId.ToString()},
          new ParaList { Key = "@i_NextFollowupDate", Value =txtNextDate.Text},
           new ParaList { Key = "@i_Remarks", Value =txtRemarks.Text},
            new ParaList { Key = "@i_UserID", Value =CurrentUser.UserId},

        };

        crmclient.Insert(para, "LeadFollowUp");
        Response.Redirect("../Inquiry/InquiryList.aspx");

    }
}