using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class UOMmaster : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsuom = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindUOMData();
        }
    }
    public void bindUOMData()
    {
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},
        };

        dsuom = crmclient.list(para, "UOM");
        gvUOM.DataSource = dsuom.Tables[0];
        gvUOM.DataBind();

    }

    protected void gvUOM_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvUOM.EditIndex = e.NewEditIndex;
        bindUOMData();
    }

    protected void gvUOM_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string uomid = gvUOM.DataKeys[e.RowIndex].Value.ToString();

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_RecId",Value=uomid.ToString() },
        };
        crmclient.Delete(para, "UOM");
        bindUOMData();
    }

    protected void gvUOM_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName=="AddNew")
        {
            TextBox Uom = (TextBox)gvUOM.FooterRow.FindControl("txtFName");
            TextBox Abbr = (TextBox)gvUOM.FooterRow.FindControl("txtFAbbr");

            if (Uom.Text == "" || Abbr.Text == "")
            {
                Response.Redirect("../AllMaster/CurrencyMaster.aspx");
            }
            else
            {

                List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_UOMName", Value=Uom.Text},
                 new ParaList {Key = "@i_Abbr", Value = Abbr.Text},
                 new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
                 new ParaList {Key="@i_CreatedBy",Value=CurrentUser.UserId },
            };

                crmclient.Insert(para, "UOM");
                bindUOMData();
            }
        }
    }

    protected void gvUOM_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int UomId = Convert.ToInt32(gvUOM.DataKeys[e.RowIndex].Value.ToString());
        TextBox UomName = (TextBox)gvUOM.Rows[e.RowIndex].FindControl("txtEName");
        TextBox Abbr = (TextBox)gvUOM.Rows[e.RowIndex].FindControl("txtEAbbr");

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_UOMID",Value=UomId.ToString()},
            new ParaList { Key="@i_UOMName",Value=UomName.Text},
            new ParaList {Key="@i_Abbr",Value=Abbr.Text },
            new ParaList {Key="@i_CompId",Value="1" },

        };

        crmclient.Update(para, "UOM");
        gvUOM.EditIndex = -1;
        bindUOMData();
    }

    protected void gvUOM_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvUOM.EditIndex = -1;
        bindUOMData();
    }

    protected void gvUOM_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvUOM.PageIndex = e.NewPageIndex;
        bindUOMData();
    }
}