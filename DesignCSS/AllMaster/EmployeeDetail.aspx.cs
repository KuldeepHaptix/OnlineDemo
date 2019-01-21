using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_EmployeeDetail : System.Web.UI.Page
{
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsupate = new DataSet();
    string QGUID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //QGUID = Request.QueryString["id"].ToString();
        if (!IsPostBack)
        {
            //paneldiv.Visible = false;
        }

    }



    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    //panelOtp.Visible = false;
    //    //paneldiv.Visible = true;

    //}

    protected void lnknextfollowp_Click(object sender, EventArgs e)
    {
        txtDOB.Focus();
        if (datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    }

    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtDOB.Focus();
        txtDOB.Text = datepicker.SelectedDate.ToLongDateString();
        datepicker.Visible = false;
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text == txtConfirmPwd.Text)
        {

            List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_Address",Value=txtAddress.Text },
             new ParaList {Key="@i_PhoneNo",Value=txtPhone.Text },
              new ParaList {Key="@i_mobile",Value=txtMobile.Text },
               new ParaList {Key="@i_DateofBirth",Value=Convert.ToDateTime(txtDOB.Text).ToShortDateString() },
                new ParaList {Key="@i_password",Value=txtPassword.Text },
                new ParaList {Key="@i_Guid",Value="80f9de9d-2d29-44b6-adcd-3aee7b2a5c36"},


               // new ParaList {Key="@i_Email",Value=txtEmail.Text },

        };

            crmclient.Update(para, "EmployeeDetail");
            Response.Redirect("../Login.aspx");
        }
        else
        {
            lblconfirmmsg.Text = "Confirm Password Does not Match";
            txtPassword.Text = "";
            txtConfirmPwd.Text = "";
            txtPassword.Focus();
        }
    }
}