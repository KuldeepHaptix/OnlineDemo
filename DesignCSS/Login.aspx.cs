using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class Login : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient1 = new ServiceClient();
    DataSet dslogin = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
         if(!IsPostBack)
        {
            RemoveSession();
           // lblmsg.Text = "";
        }

    }
    public void RemoveSession()
    {
        Session.Remove("QMode");
        Session.Remove("griddoc");
        Session.Remove("QDTitem");
        Session.Remove("FileName");
        Session.Remove("Revised");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_email",Value=txtemail.Text},
            new ParaList {Key="@i_Password", Value=txtpwd.Text},
        };

        dslogin = crmclient.Select(para, "SignIn");
        if (dslogin.Tables[0].Rows.Count > 0)
        {
            Session["CompId"] = dslogin.Tables[0].Rows[0]["CompID"].ToString();
            CurrentCompany.Name = dslogin.Tables[1].Rows[0]["CompanyName"].ToString();
            CurrentUser.CompId= dslogin.Tables[0].Rows[0]["CompID"].ToString();
            CurrentUser.BranchId=dslogin.Tables[0].Rows[0]["BranchID"].ToString();
            CurrentUser.ActivationStatus = dslogin.Tables[0].Rows[0]["ActivationStatus"].ToString();
            CurrentUser.CreatedDate = dslogin.Tables[0].Rows[0]["CreatedDate"].ToString();
            CurrentUser.Name = dslogin.Tables[0].Rows[0]["Name"].ToString();
            CurrentUser.UserId = dslogin.Tables[0].Rows[0]["UserID"].ToString();
            CurrentUser.UserEmail = dslogin.Tables[0].Rows[0]["User_Email"].ToString();
            CurrentUser.UserPwd = dslogin.Tables[0].Rows[0]["User_Password"].ToString();
            CurrentUser.User_ssl = dslogin.Tables[0].Rows[0]["User_ssl"].ToString();
            CurrentUser.User_port = dslogin.Tables[0].Rows[0]["User_Port"].ToString();
            CurrentUser.User_host = dslogin.Tables[0].Rows[0]["User_Host"].ToString();
            CurrentUser.UserMailPassword = dslogin.Tables[0].Rows[0]["User_Mail_Password"].ToString();

            CurrentUser.TerritoryId = dslogin.Tables[0].Rows[0]["TerritoryID"].ToString();
            CurrentUser.UserRole = dslogin.Tables[0].Rows[0]["UserRole"].ToString();
            CurrentUser.UserActivationId = dslogin.Tables[0].Rows[0]["UserActiveID"].ToString();
            if(dslogin.Tables[0].Rows[0]["UserRole"].ToString() == "Owner")
            {
                CurrentCompany.Name = dslogin.Tables[1].Rows[0]["CompanyName"].ToString();
            }
           
            Response.Redirect("HomeTesting.aspx");
        }
        else
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Enter correct Password and Email";
        }
    }
}