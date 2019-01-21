using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_Employee : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsitemteritory = new DataSet();
    string empid;
    protected void Page_Load(object sender, EventArgs e)
    {

        empid = Request.QueryString["empid"];

        if (!IsPostBack)
        {
           
            if (Session["EmpMode"].ToString() == "Edit")
            {
                DataTable dt = this.GetData(0);
                this.PopulateTreeView(dt, 0, null);
                TreeView1.Enabled = false;
                loadEditdata();
                txtCompname.ReadOnly = true;
            }
            else if(Session["EmpMode"].ToString() == "Insert")
            {
                DataTable dt = this.GetData(0);
                this.PopulateTreeView(dt, 0, null);
                TreeView1.Enabled = false;
            }
        }
    }


    public void loadEditdata()
    {
        DataSet ds = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value =empid },

        };
        ds = crmclient.Select(para, "Employee");

        txtCompname.Text= ds.Tables[0].Rows[0]["Company"].ToString();
       
        DrpBranch.SelectedValue = ds.Tables[0].Rows[0]["BranchId"].ToString();
        // txtcurrentStock.Text = ds.Tables[0].Rows[0]["QOH"].ToString();
        txtName.Text = ds.Tables[0].Rows[0]["EmpName"].ToString();
        txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
        txtdepartment.Text = ds.Tables[0].Rows[0]["Department"].ToString();
        txtDesignation.Text = ds.Tables[0].Rows[0]["DesignationID"].ToString();
        drpUserType.SelectedItem.Text = ds.Tables[0].Rows[0]["UserType"].ToString();
        
       
        btnInvite.Text = "Update";
        btnBack.Visible = false;
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
                TreeView2.Nodes.Add(child);
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
        dsitemteritory.Tables.Add(dt);
        DataTable dt1 = new DataTable();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_ParentId", Value = ParentId.ToString() },
        new ParaList { Key = "@i_CompId", Value =CurrentUser.CompId.ToString() },
        };

        dsitemteritory = crmclient.list(para, "Territory");
        dt1 = dsitemteritory.Tables[0];
        return dt1;

    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AllMaster/EmployeeList.aspx");
    }



    protected void chkCreateUser_CheckedChanged(object sender, EventArgs e)
    {
        if(chkCreateUser.Checked==true)
        {
            TreeView1.Enabled = true;
        }
        if(chkCreateUser.Checked==false)
        {
            TreeView1.Enabled = false;
        }
    }

    protected void btnInvite_Click(object sender, EventArgs e)
    {
        DataSet dsgetGUID = new DataSet();
        Common comn = new Common();
        //string otp = comn.GenerateOTP();
        
        int chk = chkCreateUser.Checked ? 1 : 0;

        if (Session["EmpMode"].ToString() == "Edit")
        {


            if (chk == 1)
            {
                List<ParaList> para = new List<ParaList>()
                {
                  
                    new ParaList {Key="@i_EmpId",Value=empid },
                   new ParaList {Key="@i_BranchId",Value=CurrentUser.BranchId },
                     //new ParaList {Key="@i_CompId",Value="1" },
                      new ParaList {Key="@i_EmpName",Value=txtName.Text },
                      new ParaList {Key="@i_Department",Value=txtdepartment.Text },
                      new ParaList {Key="@i_DesignationId",Value=TreeView2.SelectedNode.Value.ToString() },
                       new ParaList {Key="@i_Email",Value=txtEmail.Text },
                      // new ParaList { Key ="@i_Otp", Value =otp },
                       new ParaList {Key="@i_IsUser",Value="1"},
                      new ParaList {Key="@i_UserType",Value=drpUserType.SelectedItem.Text },
                };

                  crmclient.Update(para, "Employee");
                Response.Redirect("~/AllMaster/EmployeeList.aspx");
                //string Guid = dsgetGUID.Tables[0].Rows[0][0].ToString();
                //comn.sendOtpByMail(txtEmail.Text, Guid);

            }
            else 
            {
                List<ParaList> para2 = new List<ParaList>()
                {
                     
                   new ParaList {Key="@i_EmpId",Value=empid.ToString() },
                   new ParaList {Key="@i_BranchId",Value="1" },
                     //new ParaList {Key="@i_CompId",Value="1" },
                      new ParaList {Key="@i_EmpName",Value=txtName.Text },
                      new ParaList {Key="@i_Department",Value=txtdepartment.Text },
                      new ParaList {Key="@i_DesignationId",Value=TreeView2.SelectedNode.Value },
                       new ParaList {Key="@i_Email",Value=txtEmail.Text },
                      // new ParaList { Key ="@i_Otp", Value =otp },
                       new ParaList {Key="@i_IsUser",Value="0"},
                      new ParaList {Key="@i_UserType",Value=drpUserType.SelectedItem.Text },
                };

                crmclient.Update(para2, "Employee");
                Response.Redirect("~/AllMaster/EmployeeList.aspx");
            }



            //if(chk==1)
            //{
            //    comn.sendOtpByMail(txtEmail.Text, otp);
            //    Response.Write("Mail hasbeen sent ");
            //}
        }
        else if(Session["EmpMode"].ToString() == "Insert")
        {
            if (chk == 1)
            {
                List<ParaList> para = new List<ParaList>()
                {
                     new ParaList {Key="@i_mode",Value="CreateUser" },
                     new ParaList {Key="@i_compname",Value=txtCompname.Text },
                    new ParaList {Key="@i_BranchId",Value=CurrentUser.BranchId },
                     new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
                      new ParaList {Key="@i_EmpName",Value=txtName.Text },
                      new ParaList {Key="@i_Department",Value=txtdepartment.Text },
                      new ParaList {Key="@i_DesignationId",Value=TreeView2.SelectedNode.Value },
                       new ParaList {Key="@i_Email",Value=txtEmail.Text },
                      // new ParaList { Key ="@i_Otp", Value =otp },
                       new ParaList {Key="@i_IsUser",Value="1"},
                       new ParaList {Key="@i_Createdby",Value=CurrentUser.UserId },
                      new ParaList {Key="@i_UserType",Value=drpUserType.SelectedItem.Text },
                };

                dsgetGUID = crmclient.InsertWithDataset(para, "Employee");
                string Guid = dsgetGUID.Tables[0].Rows[0][0].ToString();
                comn.sendGUIDByMail(txtEmail.Text, Guid);
                Response.Redirect("~/AllMaster/EmployeeList.aspx");
            }
            else
            {
                List<ParaList> para = new List<ParaList>()
                {
                     new ParaList {Key="@i_mode",Value="Employee" },
                     new ParaList {Key="@i_compname",Value=txtCompname.Text },
                    new ParaList {Key="@i_BranchId",Value=CurrentUser.BranchId },
                     new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
                      new ParaList {Key="@i_EmpName",Value=txtName.Text },
                      new ParaList {Key="@i_Department",Value=txtdepartment.Text},
                      new ParaList {Key="@i_DesignationId",Value=TreeView2.SelectedNode.Value},
                       new ParaList {Key="@i_Email",Value=txtEmail.Text },
                         //new ParaList { Key ="@i_Otp", Value ="" },
                        new ParaList {Key="@i_Createdby",Value=CurrentUser.UserId },
                       new ParaList {Key="@i_IsUser",Value="0"},
                      new ParaList {Key="@i_UserType",Value=drpUserType.SelectedItem.Text },
                };

                crmclient.Insert(para, "Employee");
                Response.Redirect("~/AllMaster/EmployeeList.aspx");
            }

        }

    }

    protected void TreeView2_SelectedNodeChanged(object sender, EventArgs e)
    {
        //txtDesignation.Text = TreeView2.SelectedNode.Value.ToString();
        txtDesignation.Text=TreeView2.SelectedNode.Text;
       
    }

    //protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    //{
      
    //    foreach (TreeNode t in TreeView2.Nodes)
    //    {
    //        for (int iParent = 0; iParent < t.ChildNodes.Count; iParent++)
    //        {
    //            for (int iChild = 0; iChild < t.ChildNodes[iParent].ChildNodes.Count; iChild++)
    //            {
    //                if (t.ChildNodes[iChild].Checked==true)
    //                {
    //                    t.Parent.Checked = true;
    //                }
    //            }
    //        }
    //    }
    //}
}