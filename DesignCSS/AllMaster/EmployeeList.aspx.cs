using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class AllMaster_EmployeeList : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsitem = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindEmpData();
        }
    }

    protected void btnNewEmp_Click(object sender, EventArgs e)
    {
        Session["EmpMode"] = "Insert";
        Response.Redirect("~/AllMaster/Employee.aspx");

    }

    public void bindEmpData()
    {
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompanyID", Value=CurrentUser.CompId }
        };
        dsitem = crmclient.list(para,"Employee");
        GVEmployee.DataSource = dsitem.Tables[0];
        GVEmployee.DataBind();
    }

    protected void GVEmployee_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RecordEdit")
        {
            string EmpId = e.CommandArgument.ToString();
            //string itemid = (GVItem.DataKeys[e.RowIndex].Value.ToString());
            Session["EmpMode"] = "Edit";
            Response.Redirect("../AllMaster/Employee.aspx?empid=" + EmpId);

        }
    }

    protected void GVEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVEmployee.EditIndex = e.NewEditIndex;
        bindEmpData();
    }

    protected void GVEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVEmployee.EditIndex = -1;
        bindEmpData();
    }

    protected void GVEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string empid = (GVEmployee.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = empid.ToString() },


        };

        crmclient.Delete(para, "Employee");
        bindEmpData();

    }
}