using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using NewCRMService;


public partial class AllMaster_CurrencyMaster : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();



    DataSet dtCurrency = new DataSet();
    DataRow dtrow;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGridData();
        }
    }
    protected void bindGridData()
    {


        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId },

        };




        dtCurrency = crmclient.list(para, "Currency");
        if (dtCurrency.Tables[0].Rows.Count > 0)
        {
            GvCurrency.DataSource = dtCurrency.Tables[0];
            GvCurrency.DataBind();
        }
        else
        {
            GvCurrency.DataSource = ReturnEmptyRow();
            GvCurrency.DataBind();
        }



    }

    protected void GvCurrency_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int CrrId = Convert.ToInt32(GvCurrency.DataKeys[e.RowIndex].Value.ToString());
        TextBox CurrencyName = (TextBox)GvCurrency.Rows[e.RowIndex].FindControl("txtECurencyName");
        TextBox Currency = (TextBox)GvCurrency.Rows[e.RowIndex].FindControl("txtECurrency");

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_CurrencyID",Value=CrrId.ToString()},
            new ParaList { Key="@i_CurrencyName",Value=CurrencyName.Text},
            new ParaList {Key="@i_Currency",Value=Currency.Text },
            new ParaList {Key="@i_CompId",Value="1" },

        };

        crmclient.Update(para, "Currency");
        GvCurrency.EditIndex = -1;
        bindGridData();
        //--------old one-------------------------
        //currObj.CurencyName = CurrencyName.Text;
        //currObj.CurrencyAbr = Currency.Text;
        //currObj.CompanyID =1;
        //currObj.CurrencyID = CrrId;

        //currClient.UpdateCurrency(currObj);
        //GvCurrency.EditIndex = -1;
        //bindGridData();

    }

    protected void GvCurrency_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvCurrency.EditIndex = e.NewEditIndex;
        bindGridData();
    }

    protected void GvCurrency_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long CrrId = Convert.ToInt32(GvCurrency.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = CrrId.ToString() },


        };

        crmclient.Delete(para, "Currency");
        bindGridData();


        //long CrrId = Convert.ToInt32(GvCurrency.DataKeys[e.RowIndex].Value.ToString());

        //currClient.DeleteCurrency(CrrId);

        //bindGridData();

    }
    public DataTable ReturnEmptyRow()
    {
        DataTable dtlocation = new DataTable();
        DataColumn dtCname = new DataColumn("CurrencyName", typeof(System.String));

        dtlocation.Columns.Add(dtCname);

        DataColumn dtcurrency = new DataColumn("Currency", typeof(System.String));
        dtlocation.Columns.Add(dtcurrency);

        DataColumn dtId = new DataColumn("CurrencyID", typeof(System.String));
        dtlocation.Columns.Add(dtId);


        dtrow = dtlocation.NewRow();
        dtlocation.Rows.Add(dtrow);

        return dtlocation;
    }
    protected void GvCurrency_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {


            TextBox CurrencyName = (TextBox)GvCurrency.FooterRow.FindControl("txtFCurencyName");
            TextBox Currency = (TextBox)GvCurrency.FooterRow.FindControl("txtFCurrency");

            if (CurrencyName.Text == "" || Currency.Text == "")
            {
                Response.Redirect("../AllMaster/CurrencyMaster.aspx");
            }
            else
            {
                List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_CurrencyName", Value=CurrencyName.Text},
                 new ParaList {Key = "@i_Currency", Value = Currency.Text},
                 new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
                 new ParaList {Key="@i_Createdby",Value=CurrentUser.UserId },
            };

                crmclient.Insert(para, "Currency");
                bindGridData();
            }
            //---------old one---------------
            //currObj.CurencyName= CurrencyName.Text;
            //currObj.CurrencyAbr = Currency.Text;

            //currClient.InsertCurrency(currObj);
            //bindGridData();
        }
    }

    protected void GvCurrency_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GvCurrency.EditIndex = -1;
        bindGridData();
    }

    protected void GvCurrency_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
           
            if (GvCurrency.Rows.Count < 0)
            {
                e.Row.Visible = false;
            }
            else
            {
                e.Row.Visible = true;
            }
        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
           
            e.Row.Visible = true;
        }
    }
}
