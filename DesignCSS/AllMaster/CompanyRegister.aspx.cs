using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class CompanyRegister : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsitemteritory = new DataSet();
    string Otp;
    Common cmn = new Common();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }

    }

    protected void btnNext1_Click(object sender, EventArgs e)
    {
        lblemailmsg.Text = "";
        DataSet dsemail = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
             new ParaList {Key="@i_Email",Value=txtEmail.Text },
        };

         dsemail = crmclient.Select(para, "CompanyRegCheck");
        if (dsemail.Tables[0].Rows.Count > 0)
        {
            lblemailmsg.Text = "This Email Id is Already Registerd";
        }
        else
        {
            Otp = cmn.GenerateOTP();
            ViewState["Otp"] = Otp;
            cmn.sendOtpByMail(txtEmail.Text, Otp);
            MultiView1.ActiveViewIndex = 1;
        }

    }

   
    protected void btnNext3_Click(object sender, EventArgs e)
    {
        DataSet dscompid = new DataSet();
        if(txtpwd.Text==txtCpwd.Text)
        {

            List<ParaList> para = new List<ParaList>()
            {
            new ParaList {Key="@i_CompanyName",Value=txtCompanyName.Text },
            new ParaList {Key="@i_Email",Value=txtEmail.Text },
            new ParaList { Key = "@i_FirstName", Value = txtFirstName.Text },
            new ParaList { Key = "@i_LastName", Value = txtLastName.Text },
            new ParaList { Key = "@i_otp", Value = ViewState["Otp"].ToString() },
            new ParaList { Key = "@i_Password", Value = txtpwd.Text },
            };
           dscompid= crmclient.InsertWithDataset(para, "CompanyInfo");
            string compid="";
            string CompName="";
           if (dscompid.Tables[0].Rows.Count>0)
            {
               compid = dscompid.Tables[0].Rows[0]["CompId"].ToString();
               CompName = dscompid.Tables[0].Rows[0]["CompanyName"].ToString();
            }
            Response.Redirect("../AllMaster/Company.aspx?Id="+compid+"&CompanyName="+CompName);
        }
        else
        {
            lblmsgpwd.Text = "Confirm Password does,t match";
        }
       
    }

    protected void btnNext2_Click1(object sender, EventArgs e)
    {
        if(txtotp.Text==ViewState["Otp"].ToString())
        {
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
            lblmsgotp.Text = "Enter Correct OTP";
        }
       
    }

    protected void btnPrev_Click(object sender, EventArgs e)
    {
        lblemailmsg.Text = "";
        ViewState["Otp"] = "";
        MultiView1.ActiveViewIndex = 0;
    }
}