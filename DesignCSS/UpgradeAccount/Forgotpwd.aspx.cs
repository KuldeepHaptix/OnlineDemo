using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpgradeAccount_Forgotpwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        panelopt.Visible = true;
    }

    protected void btncancel_Click(object sender, EventArgs e)
    {
        txtemail.Text = "";
        txtopt.Text = "";
        panelopt.Visible = false;
    }
}