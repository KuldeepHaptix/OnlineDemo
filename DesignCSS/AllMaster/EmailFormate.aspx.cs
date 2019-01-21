using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class AllMaster_EmailFormate : System.Web.UI.Page
{
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindEmailFormateData();
        }
    }

    public void bindEmailFormateData()
    {
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId},
        new ParaList { Key = "@i_branchId", Value = CurrentUser.BranchId },

        };

        ds = crmclient.list(para, "Email");
        GVEmail.DataSource = ds.Tables[0];
        GVEmail.DataBind();
    }

    protected void GVEmail_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVEmail.EditIndex = e.NewEditIndex;
        bindEmailFormateData();
    }

    protected void GVEmail_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVEmail.EditIndex = -1;
        bindEmailFormateData();
    }

    protected void GVEmail_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int emailtypeId = Convert.ToInt32(GVEmail.DataKeys[e.RowIndex].Value.ToString());
        TextBox Subject = (TextBox)GVEmail.Rows[e.RowIndex].FindControl("txtESubject");
        TextBox Header = (TextBox)GVEmail.Rows[e.RowIndex].FindControl("txtEHeader");
        TextBox Footer = (TextBox)GVEmail.Rows[e.RowIndex].FindControl("txtEfooter");
      
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_Email_ID",Value=emailtypeId.ToString()},
            new ParaList { Key="@i_Subject",Value=Subject.Text},
            new ParaList {Key="@i_Header",Value=Header.Text },
            new ParaList {Key="@i_Footer",Value=Footer.Text },
          //  new ParaList {Key="@i_CompId",Value="1"},

        };

        crmclient.Update(para, "Email");
        GVEmail.EditIndex = -1;
        bindEmailFormateData();
    }

    protected void GVEmail_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVEmail.PageIndex = e.NewPageIndex;
        bindEmailFormateData();
    }
}