using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class AllMaster_TestingofMaster : System.Web.UI.Page
{
    SqlConnection scon = new SqlConnection("Data Source=ARPITPC\\SQLEXPRESS1;Initial Catalog=SaleskitCRM;User ID=sa;Password=admin123");
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if(!IsPostBack)
        {
            binddata();
        }

    }
    protected void binddata()
    {
        scon.Open();
        SqlCommand cmd = new SqlCommand("Select * from Account", scon);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
           GvAccount.DataSource = ds;
            GvAccount.DataBind();
        }
        else
        {
            ds.Tables[0].Rows.Add(ds.Tables[0].NewRow());
            GvAccount.DataSource = ds;
            GvAccount.DataBind();
            int columncount = GvAccount.Rows[0].Cells.Count;
            GvAccount.Rows[0].Cells.Clear();
            GvAccount.Rows[0].Cells.Add(new TableCell());
            GvAccount.Rows[0].Cells[0].ColumnSpan = columncount;
            GvAccount.Rows[0].Cells[0].Text = "No Records Found";
        }
    }

    protected void GvAccount_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvAccount.EditIndex = e.NewEditIndex;
        binddata();
    }

    protected void GvAccount_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("AddNew"))
        {
            
          
          TextBox code = (TextBox)GvAccount.FooterRow.FindControl("txtFaccountCode");
            TextBox AccNAme = (TextBox)GvAccount.FooterRow.FindControl("txtFacountName");
           
            scon.Open();
            SqlCommand cmd = new SqlCommand("insert into Account(AccountCode,AccountName) values('" + code.Text + "','" + AccNAme.Text + "')", scon);
            int result = cmd.ExecuteNonQuery();
            scon.Close();
            if (result == 1)
            {
                binddata();

            }
            else
            {
                
            }
        }
    }

    protected void GvAccount_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int userid = Convert.ToInt32(GvAccount.DataKeys[e.RowIndex].Value.ToString());
        // string code = GvAccount.DataKeys[e.RowIndex].Values["AccountCode"].ToString();
        TextBox Acccode = (TextBox)GvAccount.Rows[e.RowIndex].FindControl("txtEAccountCode");
        TextBox Accname = (TextBox)GvAccount.Rows[e.RowIndex].FindControl("txtEAccountName");
     
        scon.Open();
        SqlCommand cmd = new SqlCommand("update Account set AccountCode='" + Acccode.Text + "',AccountName='" + Accname.Text + "' where AccountID=" + userid, scon);
        cmd.ExecuteNonQuery();
        scon.Close();
      
        GvAccount.EditIndex = -1;
        binddata();
    }

    protected void GvAccount_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GvAccount.EditIndex = -1;
        binddata();
    }

    protected void GvAccount_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int userid = Convert.ToInt32(GvAccount.DataKeys[e.RowIndex].Values["AccountID"].ToString());
        //string username = GvAccount.DataKeys[e.RowIndex].Values["UserName"].ToString();
        scon.Open();
        SqlCommand cmd = new SqlCommand("delete from Account where AccountID=" + userid, scon);
        int result = cmd.ExecuteNonQuery();
        scon.Close();
        if (result == 1)
        {
            binddata();
            
        }
    }
}