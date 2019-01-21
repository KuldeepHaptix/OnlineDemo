using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_ItemRegister : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new ServiceClient();
    DataSet dscurrency = new DataSet();
    DataSet dsAnum = new DataSet();
    string itemid;
    DataSet dstax = new DataSet();
    DataSet dsitemteritory = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        // ClearData();
        itemid = Request.QueryString["itemid"];

        if (!IsPostBack)
        {
            fillCurrency();
            fillUOM();
       
            if (Session["ItemMode"].ToString() == "Edit")
            {
                fillTaxClass();
                DataTable dt = this.GetData(0);
                this.PopulateTreeView(dt, 0, null);
                // itemid = Request.QueryString["itemid"];
                //txtcurrentStock.ReadOnly = true;
                txtItemCode.ReadOnly = true;
                LoadDataforEdit();
                
            }
            else if (Session["ItemMode"].ToString() == "InsertItem")
            {
                fillTaxClass();
               
                DataTable dt = this.GetData(0);
                this.PopulateTreeView(dt, 0, null);
                ItemCode();
                txtItemCode.Text = dsAnum.Tables[0].Rows[0][0].ToString();
               // txtcurrentStock.ReadOnly = true;
            }
            
        }
    }

    public void LoadDataforEdit()
    {
        DataSet ds = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value =itemid },

        };
        ds = crmclient.Select(para, "Item");


        txtItemCode.Text = ds.Tables[0].Rows[0]["Code"].ToString();
        txtPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
        // txtcurrentStock.Text = ds.Tables[0].Rows[0]["QOH"].ToString();
        txtitemName.Text = ds.Tables[0].Rows[0]["Name"].ToString();
        txtDescription.Text = ds.Tables[0].Rows[0]["Specification"].ToString();
        drpUOM.SelectedValue = ds.Tables[0].Rows[0]["CUOMID"].ToString();
        txtHsnCode.Text = ds.Tables[0].Rows[0]["HSNCode"].ToString();
        txtProductCode.Text = ds.Tables[0].Rows[0]["ProductCode"].ToString();
        txtcategory.Text = ds.Tables[0].Rows[0]["CategoryID"].ToString();
        drpTaxClass.SelectedValue = ds.Tables[0].Rows[0]["ItemClassID"].ToString();
        // drpgodown.SelectedValue = ds.Tables[0].Rows[0]["GodownID"].ToString();
        //txtRackNo.Text = ds.Tables[0].Rows[0]["RackNo"].ToString();
        //txtlocation.Text= ds.Tables[0].Rows[0]["Location"].ToString();
        // txtReorderLevel.Text = ds.Tables[0].Rows[0]["ReorderLvl"].ToString();
        // txtOpeningStock.Text = ds.Tables[0].Rows[0]["QOH"].ToString();

        // ViewState["StockId"] = Convert.ToInt32(ds.Tables[0].Rows[0]["StockID"].ToString()); ;
        // _StockID = Convert.ToInt32(ds.Tables[0].Rows[0]["StockID"].ToString());

        btnSubmitInq.Text = "Update";
        btnlist.Visible = false;


    }
    public void ItemCode()
    {
        List<ParaList> paraANum = new List<ParaList>()
        {
             new ParaList { Key="@i_Module", Value="Item"},
            new ParaList { Key="@i_YearCode",Value=""},
             new ParaList { Key="@i_FYID",Value=""},
              new ParaList { Key="@i_CompId",Value=CurrentUser.CompId},
        };
        dsAnum = crmclient.AutomaticNumber(paraANum);
    }


    public void UOMDDL()
    {
        DataSet dsUom = new DataSet();
      

        List<ParaList> paraUOM = new List<ParaList>()
                    {
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                    };
        drpUOM.DataValueField = "UOMID";
        drpUOM.DataTextField = "Name";
        dsUom = crmclient.FillDDL(paraUOM, "UOM");
        drpUOM.DataSource = dsUom.Tables[0];
        drpUOM.DataBind();
    }
    public void fillTaxClass()
    {
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = "1" },

        };

        drpTaxClass.DataValueField = "TaxClassID";
        drpTaxClass.DataTextField = "TaxClass";


        dstax = crmclient.FillDDL(para, "TaxClass");
        drpTaxClass.DataSource = dstax.Tables[0];
        drpTaxClass.DataBind();
    }
    public void fillCurrency()
    {

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = "1" },
       
        };

        DrpCurrency.DataValueField = "CurrencyID";
        DrpCurrency.DataTextField = "Currency";


        dscurrency = crmclient.FillDDL(para, "Currency");
        DrpCurrency.DataSource = dscurrency.Tables[0];
        DrpCurrency.DataBind();
    }
    public void fillUOM()
    {
        DataSet dsUom = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId },

        };

        drpUOM.DataValueField = "UOMID";
        drpUOM.DataTextField = "Name";


        dsUom = crmclient.FillDDL(para, "UOM");
        drpUOM.DataSource = dsUom.Tables[0];
        drpUOM.DataBind();
    }
    //public void fillGodown()
    //{
    //    DataSet dsGodown = new DataSet();
    //    List<ParaList> para = new List<ParaList>() {

    //    new ParaList { Key = "@i_CompId", Value = "1" },

    //    };

    //    drpgodown.DataValueField = "GodownID";
    //    drpgodown.DataTextField = "Godown_name";


    //    dsGodown = crmclient.FillDDL(para.ToArray(), "Godown");
    //    drpgodown.DataSource = dsGodown.Tables[0];
    //    drpgodown.DataBind();
    //}

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        if (Session["ItemMode"].ToString() == "Edit")
        {
            List<ParaList> para1 = new List<ParaList>()
             {
            new ParaList { Key="@i_ItemID", Value=itemid.ToString()},
            new ParaList { Key="@i_Code", Value=txtItemCode.Text},
            new ParaList { Key="@i_ItemName",Value=txtitemName.Text},
             new ParaList { Key="@i_Specification",Value=txtDescription.Text},
              new ParaList { Key="@i_CUOMID",Value=drpUOM.SelectedValue},
              new ParaList { Key="@i_taxClassId", Value=drpTaxClass.SelectedValue},
              new ParaList { Key="@i_Category",Value=txtcategory.Text},
               //new ParaList { Key="@i_GodownID",Value=drpgodown.SelectedValue},
              new ParaList { Key="@i_CurrencyID",Value=DrpCurrency.SelectedValue },
              new ParaList { Key="@i_HSNCode",Value=txtHsnCode.Text },
              new ParaList { Key="@i_ProductCode",Value=txtProductCode.Text },
               new ParaList { Key="@i_Price",Value=Convert.ToDecimal(txtPrice.Text).ToString() },
               //new ParaList { Key="@i_QOH",Value=Convert.ToDecimal(txtOpeningStock.Text).ToString() },
              //new ParaList { Key="@i_ReOrderLvl",Value=Convert.ToDecimal(txtReorderLevel.Text).ToString() },
             // new ParaList { Key="@i_Location",Value=txtlocation.Text },
             // new ParaList { Key="@i_RackNo",Value=txtRackNo.Text },
                 //new ParaList { Key="@i_StockID",Value= ViewState["StockId"].ToString() },
              new ParaList { Key="@i_CompId",Value="1" },
             };
            crmclient.Update(para1, "Item");
            Session["ItemMode"] = "";
            Response.Redirect("../AllMaster/ItemList.aspx");
        }
        else
        {

            List<ParaList> para = new List<ParaList>()
             {
            new ParaList { Key="@i_Code", Value=txtItemCode.Text},
            new ParaList { Key="@i_ItemName",Value=txtitemName.Text},
             new ParaList { Key="@i_Specification",Value=txtDescription.Text},
              new ParaList { Key="@i_taxClassId", Value=drpTaxClass.SelectedValue.ToString()},
              new ParaList { Key="@i_Category",Value=txtcategory.Text},
              new ParaList { Key="@i_CUOMID",Value=drpUOM.SelectedValue},
               //new ParaList { Key="@i_GodownID",Value=drpgodown.SelectedValue},
              new ParaList { Key="@i_CurrencyID",Value=DrpCurrency.SelectedValue },
              new ParaList { Key="@i_HSNCode",Value=txtHsnCode.Text },
              new ParaList { Key="@i_ProductCode",Value=txtProductCode.Text },
               new ParaList { Key="@i_Price",Value=Convert.ToDecimal(txtPrice.Text).ToString() },
               //new ParaList { Key="@i_QOH",Value=Convert.ToDecimal(txtOpeningStock.Text).ToString() },
             // new ParaList { Key="@i_ReOrderLvl",Value=Convert.ToDecimal(txtReorderLevel.Text).ToString() },
             // new ParaList { Key="@i_Location",Value=txtlocation.Text },
              //new ParaList { Key="@i_RackNo",Value=txtRackNo.Text },
              new ParaList { Key="@i_CompId",Value=CurrentUser.CompId },
              new ParaList { Key="@i_BranchId",Value=CurrentUser.BranchId },
               new ParaList { Key="@i_createdby",Value=CurrentUser.UserId },
                };

            crmclient.Insert(para, "Item");
            Response.Redirect("../AllMaster/ItemRegister.aspx");
        }

    }

    public void ClearData()
    {
       ItemCode();
        txtitemName.Text = "";
        txtPrice.Text = "";
        //drpgodown.Text = "";
        //txtOpeningStock.Text = "";
        //txtcurrentStock.Text = "";
        //DrpCurrency.SelectedValue = "0";
        //drpUOM.SelectedValue = "";
        txtProductCode.Text = "";
        txtHsnCode.Text = "";
        txtDescription.Text = "";
       // txtReorderLevel.Text = "";
       // txtlocation.Text = "";
       // txtRackNo.Text = "";

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("/AllMaster/ItemList.aspx");
    }

    protected void btnlist_Click(object sender, EventArgs e)
    {
        Response.Redirect("/AllMaster/ItemList.aspx");
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
        dsitemteritory.Tables.Add(dt);
        DataTable dt1 = new DataTable();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_ParentId", Value = ParentId.ToString() },
        new ParaList { Key = "@i_CompId", Value = "1" },
        };

        dsitemteritory = crmclient.list(para, "ItemTeritory");
        dt1 = dsitemteritory.Tables[0];   
        return dt1;
        
    }
    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        txtcategory.Text = TreeView1.SelectedNode.Text;
    }

}