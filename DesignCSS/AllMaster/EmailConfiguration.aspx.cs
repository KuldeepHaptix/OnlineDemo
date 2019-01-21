using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class EmailConfiguration : System.Web.UI.Page
{
    Service crmclient = new Service();

    // NewCRMService.ServiceClient crmclient = new ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindEmailDetail();
        }
    }

    public void bindEmailDetail()
    {
        
        DataSet dscompanydetail = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
        };
        dscompanydetail = crmclient.Select(para, "CompanyInfo");

        if (dscompanydetail != null)
        {
            txtEmailID.Text = dscompanydetail.Tables[0].Rows[0]["Con_Email"].ToString();
         ViewState["currentpwd"]= dscompanydetail.Tables[0].Rows[0]["Password"].ToString();
            if (ViewState["currentpwd"].ToString() == "" || ViewState["currentpwd"].ToString() == null)
            {
                panel1.Visible = false;
            }
            else
            {
                panel1.Visible = true;
            }
            txtport.Text= dscompanydetail.Tables[0].Rows[0]["port"].ToString();
            txtssl.Text= dscompanydetail.Tables[0].Rows[0]["ssl"].ToString();

        }
    }


    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        if (txtCurrentpwd.Enabled == true)
        {

            if (txtCurrentpwd.Text == ViewState["currentpwd"].ToString())
            {

                List<ParaList> parainsert = new List<ParaList>()
            {
            new ParaList {Key="@i_Con_Email", Value=txtEmailID.Text },
            new ParaList {Key="@i_Password", Value=txtnewpwd.Text },
            new ParaList {Key="@i_Con_Host", Value=drphost.SelectedItem.Text },
            new ParaList {Key="@i_Con_Port", Value=txtport.Text},
            new ParaList {Key="@i_Con_SSL", Value=txtssl.Text},
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
            new ParaList {Key="@i_ModifiedBy", Value=CurrentUser.UserId },

            };
               
                crmclient.Update(parainsert, "Email_Detail");
                Response.Redirect("~/HomeTesting.aspx");
            }
            else
            {
                Response.Write("<script LANGUAGE='JavaScript' >alert('Current password is wrong')</script>");
            }
        }

        else
        {
            List<ParaList> parainsert = new List<ParaList>()
            {
            new ParaList {Key="@i_Con_Email", Value=txtEmailID.Text },
            new ParaList {Key="@i_Password", Value=txtnewpwd.Text },
            new ParaList {Key="@i_Con_Host", Value=drphost.SelectedItem.Text },
            new ParaList {Key="@i_Con_Port", Value=txtport.Text },
            new ParaList {Key="@i_Con_SSL", Value=txtssl.Text },
            new ParaList {Key="@i_CompId",  Value=CurrentUser.CompId },
            new ParaList {Key="@i_ModifiedBy",Value=CurrentUser.UserId },

            };
        }
    }
}