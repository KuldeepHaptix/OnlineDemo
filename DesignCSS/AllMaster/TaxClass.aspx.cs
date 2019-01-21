using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_TaxClass : System.Web.UI.Page
{
    // TaxServiceRefresnce.TaxClassServiceClient taxserviceclient = new TaxServiceRefresnce.TaxClassServiceClient();
    // TaxServiceRefresnce.TaxClass objtax = new TaxServiceRefresnce.TaxClass();
    Service crmclient = new Service();
    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet ds = new DataSet();
    DataRow dtrow;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindTaxData();
        }
    }

    public DataTable ReturnEmptyRow()
    {
        DataTable dtlocation = new DataTable();
        DataColumn dtId = new DataColumn("TaxClassID", typeof(System.String));

        dtlocation.Columns.Add(dtId);

        DataColumn dtName = new DataColumn("Name", typeof(System.String));
        dtlocation.Columns.Add(dtName);

        DataColumn dtFromDate = new DataColumn("FromDate", typeof(System.String));
        dtlocation.Columns.Add(dtFromDate);

        DataColumn dtSGST = new DataColumn("SGST", typeof(System.String));
        dtlocation.Columns.Add(dtSGST);

        DataColumn dtCGST= new DataColumn("CGST", typeof(System.String));
        dtlocation.Columns.Add(dtCGST);

        DataColumn dtIGST = new DataColumn("IGST", typeof(System.String));
        dtlocation.Columns.Add(dtIGST);

        dtrow = dtlocation.NewRow();
        dtlocation.Rows.Add(dtrow);

        return dtlocation;
    }
    protected void bindTaxData()
    {
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value =CurrentUser.CompId },

        };


        ds = crmclient.list(para, "TaxClass");
        if (ds.Tables[0].Rows.Count > 0)
        {
            GvTaxClass.DataSource = ds.Tables[0];
            GvTaxClass.DataBind();
        }
        else
        {
            GvTaxClass.DataSource = ReturnEmptyRow();
            GvTaxClass.DataBind();
        }


  }

   

   

    protected void GvTaxClass_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvTaxClass.EditIndex = e.NewEditIndex;
        bindTaxData();
    }

    protected void GvTaxClass_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long taxclassid = Convert.ToInt32(GvTaxClass.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=taxclassid.ToString() },
        };

        crmclient.Delete(para, "TaxClass");
        bindTaxData();


    }

    protected void GvTaxClass_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {


            TextBox Taxclassname =(TextBox)GvTaxClass.FooterRow.FindControl("txtFtaxname");
            TextBox Fromdate = (TextBox)GvTaxClass.FooterRow.FindControl("txtFFromDate");
            TextBox SGST = (TextBox)GvTaxClass.FooterRow.FindControl("txtFsgst");
            TextBox CGST = (TextBox)GvTaxClass.FooterRow.FindControl("txtFcgst");
            TextBox IGST = (TextBox)GvTaxClass.FooterRow.FindControl("txtFigst");

            if (Taxclassname.Text == "" || SGST.Text == "")
            {
                Response.Redirect("../AllMaster/TaxClass.aspx");
            }
            else { 
                        List<ParaList> para = new List<ParaList>()
                         {
                         new ParaList {Key="@i_TaxClass", Value=(Taxclassname.Text).ToString() },
                         new ParaList {Key="@i_FromDate", Value=(Convert.ToDateTime(Fromdate.Text).ToShortDateString()) },
                         new ParaList {Key="@i_SGST", Value=(Convert.ToDecimal(SGST.Text).ToString()) },
                         new ParaList {Key="@i_CGST", Value=(Convert.ToDecimal(CGST.Text).ToString()) },
                         new ParaList {Key="@i_IGST", Value=(Convert.ToDecimal(IGST.Text).ToString()) },
                         new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
                         };

                        crmclient.Insert(para, "TaxClass");
                        bindTaxData();
                  }
           
        }
    }

    protected void GvTaxClass_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        long taxid = Convert.ToInt32(GvTaxClass.DataKeys[e.RowIndex].Value.ToString());
        //long taxclassid = Convert.ToInt32(GvTaxClass.DataKeys[e.RowIndex].Value.ToString());
        TextBox taxname = (TextBox)GvTaxClass.Rows[e.RowIndex].FindControl("txtEtaxname");
        TextBox fromdate =(TextBox)GvTaxClass.Rows[e.RowIndex].FindControl(("txtEromDate"));
        TextBox SGst = (TextBox)GvTaxClass.Rows[e.RowIndex].FindControl("txtEsgst");
        TextBox CGst = (TextBox)GvTaxClass.Rows[e.RowIndex].FindControl("txtEcgst");
        TextBox IGst = (TextBox)GvTaxClass.Rows[e.RowIndex].FindControl("txtEigst");

        List<ParaList> para = new List<ParaList>()
            {
            new ParaList {Key="@i_TaxClassID", Value=taxid.ToString() },
                new ParaList {Key="@i_TaxClass", Value=(taxname.Text).ToString() },
                 new ParaList {Key="@i_FromDate", Value=(Convert.ToDateTime(fromdate.Text).ToShortDateString()) },
                  new ParaList {Key="@i_SGST", Value=(Convert.ToDecimal(SGst.Text).ToString()) },
                  new ParaList {Key="@i_CGST", Value=(Convert.ToDecimal(CGst.Text).ToString()) },
                 new ParaList {Key="@i_IGST", Value=(Convert.ToDecimal(IGst.Text).ToString()) },
                  new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
            };

        crmclient.Update(para, "TaxClass");
        GvTaxClass.EditIndex = -1;
        bindTaxData();


        //objtax.TaxClassID = taxid;
        //objtax.TaxName = taxname.Text;
        //objtax.FromDate =fromdate.Text;
        //objtax.SGST = Convert.ToDecimal(SGst.Text);
        //objtax.CGST = Convert.ToDecimal(CGst.Text);
        //objtax.IGST= Convert.ToDecimal(IGst.Text);


       
     
       
    }

    protected void GvTaxClass_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GvTaxClass.EditIndex = -1;
        bindTaxData();
    }

    protected void GvTaxClass_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (GvTaxClass.Rows.Count < 0)
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

    protected void GvTaxClass_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvTaxClass.PageIndex = e.NewPageIndex;
        bindTaxData();
    }
}