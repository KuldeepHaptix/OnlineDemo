using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AllMaster_ItemTerritoty : System.Web.UI.Page
{
    string constr = ConfigurationManager.ConnectionStrings["SaleskitCRMConnectionString"].ConnectionString;

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
                Value = row["ItemID"].ToString()
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
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from ItemTeritory where ParentID=" + ParentId))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }


    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        txtParent.Text = TreeView1.SelectedNode.Text;
    }

    protected void btn_Submit_Click(object sender, EventArgs e)
    {
       // SqlConnection scon=new SqlConnection[]
    }
}