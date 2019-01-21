using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using NewCRMService;

public partial class AllMaster_TerritoryNew : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new ServiceClient();
    string constr = "";
    DataSet dsterritory = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = this.GetData(0);
            this.PopulateTreeView(dt, 0, null);
        }
    }

    private void PopulateTreeView(DataTable dtParent, int parentId, TreeNode treeNode)
    {
        //TreeNode childnode = new TreeNode();
        foreach (DataRow row in dtParent.Rows)
        {
            TreeNode child = new TreeNode 
            {
                Text = row["Name"].ToString(),
                Value = row["TerritoryID"].ToString()
            };
            if(parentId == 0)
            {
                TreeView1.Nodes.Add(child);
            }
            else
            {
                treeNode.ChildNodes.Add(child);
            }
            DataTable dtChild = this.GetData(int.Parse(child.Value));
            PopulateTreeView(dtChild, int.Parse(child.Value), child);
        }
    }

    private DataTable GetData(int ParentId)
    {
        DataTable dt = new DataTable();
        dsterritory.Tables.Add(dt);
        DataTable dt1 = new DataTable();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_ParentId", Value = ParentId.ToString() },
        new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId.ToString()},
        };

        dsterritory = crmclient.list(para, "Territory");
        dt1 = dsterritory.Tables[0];
        return dt1;
    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        txtParent.Text = TreeView1.SelectedNode.Text;

        
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
        if(txtNAme.Text!="" && txtParent.Text!="")
        { 
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_Name",Value=txtNAme.Text },
            new ParaList {Key="@i_ParentID",Value=TreeView1.SelectedValue.ToString() },
            new ParaList {Key="@i_BranchID",Value=CurrentUser.BranchId },
            new ParaList {Key="@i_CompID",Value=CurrentUser.CompId },
            new ParaList {Key="@i_createdBy",Value=CurrentUser.UserId }

        };
        crmclient.Insert(para, "Territory");
        Response.Redirect("../AllMaster/TerritoryManagment.aspx");
        }
        else
        {
            Response.Redirect("../AllMaster/TerritoryNew.aspx");
        }
    }
}