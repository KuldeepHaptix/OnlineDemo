using NewCRMService;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Quotation_QuotationFollowup : System.Web.UI.Page
{
    string QFollowupId;
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        QFollowupId = Session["FollowupId"].ToString();

        if (!IsPostBack)
        {
            bindEmployee();

            bindFollowupData();
        }
    }
    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtNextDate.Text = datepicker.SelectedDate.ToShortDateString();
        datepicker.Visible = false;
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

    protected void Calender1_Click(object sender, EventArgs e)
    {
        if (datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    }

    public void bindFollowupData()
    {
        DataSet dsFollowup = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=QFollowupId },
        };
        dsFollowup = crmclient.Select(para, "Quotation");
        if (dsFollowup.Tables[0].Rows.Count > 0)
        {
            txtCode.Text = dsFollowup.Tables[0].Rows[0]["Code"].ToString();
            txtDate.Text = dsFollowup.Tables[0].Rows[0]["QDate"].ToString();
            txtcustname.Text = dsFollowup.Tables[0].Rows[0]["CustomerName"].ToString();
            txtLastFollowupDate.Text = dsFollowup.Tables[0].Rows[0]["FollowUpDate"].ToString();
            drpApptaken.SelectedValue = dsFollowup.Tables[0].Rows[0]["EmpAllToID"].ToString();
        }

    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        DataSet dsApptaken = new DataSet();
        List<ParaList> para = new List<ParaList>() {


         new ParaList { Key = "@i_QuotationId", Value =QFollowupId.ToString()},
          new ParaList { Key = "@i_FollowupDate", Value =txtNextDate.Text},
           new ParaList { Key = "@i_Remarks", Value =txtRemarks.Text},
            new ParaList { Key = "@i_UserID", Value =CurrentUser.UserId},

        };



        crmclient.Insert(para, "QuotationFollowUp");
        Response.Redirect("../Quotation/QuotationList.aspx");
    }
}