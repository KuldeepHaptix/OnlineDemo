using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class Service_ServiceNew : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(IsPostBack)
        {
            bindEmployee();
        }
    }

    public void bindEmployee()
    {
        DataSet dsApptaken = new DataSet();
        List<ParaList> para = new List<ParaList>() {


         new ParaList { Key = "@i_Compid", Value =CurrentUser.CompId},

        };

        DrpTaken.DataValueField = "EmpID";
        DrpTaken.DataTextField = "EmpName";


        dsApptaken = crmclient.FillDDL(para, "Employee");
        DrpTaken.DataSource = dsApptaken.Tables[0];
        DrpTaken.DataBind();
        DrpTaken.Items.Insert(0, new ListItem("--Select--", "0"));



        DrpAllocated.DataValueField = "EmpID";
        DrpAllocated.DataTextField = "EmpName";


        dsApptaken = crmclient.FillDDL(para, "Employee");
        DrpAllocated.DataSource = dsApptaken.Tables[0];
        DrpAllocated.DataBind();
        DrpAllocated.Items.Insert(0, new ListItem("--Select--", "0"));

    }
}