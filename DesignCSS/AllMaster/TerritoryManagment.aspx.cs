using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;

public partial class AllMaster_TerritoryManagment : System.Web.UI.Page
{
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new ServiceClient();
    DataSet dsterritory = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = this.GetData(0);
            this.PopulateTreeView(dt, 0, null);
        }
    }

    protected void btnNewT_Click(object sender, EventArgs e)
    {
        Response.Redirect("../AllMaster/TerritoryNew.aspx");
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
            if (parentId == 0)
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

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if(TreeView1.SelectedNode !=null)
        {
            string SnodeId =TreeView1.SelectedNode.Value.ToString();

            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_RecID", Value=SnodeId },
            };
            crmclient.Delete(para, "Territory");
            Response.Redirect("../AllMaster/TerritoryManagment.aspx");
        }
    }
}