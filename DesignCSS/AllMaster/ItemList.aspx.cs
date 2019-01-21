using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class ItemList : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsitem = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindGridItem();
        }
    }
    private void bindGridItem()

    {
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId }
        };
        dsitem = crmclient.list(para, "Item");
        GVItem.DataSource = dsitem.Tables[0];
        GVItem.DataBind();
    }

    protected void btnNewItem_Click(object sender, EventArgs e)
    {
        Session["ItemMode"] = "InsertItem";
        Response.Redirect("~/AllMaster/ItemRegister.aspx");
    }

    protected void GVItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
      
        GVItem.EditIndex = e.NewEditIndex;
        bindGridItem();
    }

    protected void GVItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVItem.EditIndex = -1;
        bindGridItem();
    }

    protected void GVItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string itemid= (GVItem.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = itemid.ToString() },


        };

        crmclient.Delete(para, "Item");
        bindGridItem();

    }

    protected void GVItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        string itemid = (GVItem.DataKeys[e.RowIndex].Value.ToString());

       Response.Redirect("../AllMaster/ItemRegister.aspx?itemid="+itemid);
        Session["ItemMode"] = "Edit";
        Label Itemcode = (Label)GVItem.Rows[e.RowIndex].FindControl("lblItemCode");
        TextBox ItemName = (TextBox)GVItem.Rows[e.RowIndex].FindControl("txtEitemname");
        TextBox Specification = (TextBox)GVItem.Rows[e.RowIndex].FindControl("txtESpecification");
        TextBox @i_CUOMI = (TextBox)GVItem.Rows[e.RowIndex].FindControl("txtESpecification");

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_ItemID",Value=itemid.ToString()},
            new ParaList { Key="@i_Code",Value=Itemcode.Text},
            new ParaList {Key="@i_ItemName",Value=ItemName.Text },
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },

        };

        crmclient.Update(para, "Item");
        GVItem.EditIndex = -1;
        bindGridItem();
    }

    protected void GVItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RecordEdit")
        {
            string itemid = e.CommandArgument.ToString();
            //string itemid = (GVItem.DataKeys[e.RowIndex].Value.ToString());
            Session["ItemMode"] = "Edit";
            Response.Redirect("../AllMaster/ItemRegister.aspx?itemid=" + itemid);
            
        }
    }

    protected void GVItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVItem.PageIndex = e.NewPageIndex;
        bindGridItem();

    }
}