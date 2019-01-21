using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_TypeOfServiceCall : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataRow dtrow;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGridData();
        }
    }


    public DataTable ReturnEmptyRow()
    {

        DataTable dtcalltype = new DataTable();
        DataColumn dtid = new DataColumn("CallID", typeof(System.String));
        dtcalltype.Columns.Add(dtid);

        DataColumn dtname = new DataColumn("Call_Name", typeof(System.String));

        dtcalltype.Columns.Add(dtname);

        DataColumn dtDescription = new DataColumn("Description", typeof(System.String));
        dtcalltype.Columns.Add(dtDescription);

        


        dtrow = dtcalltype.NewRow();
        dtcalltype.Rows.Add(dtrow);

        return dtcalltype;
    }
    protected void bindGridData()
    {

        DataSet dsTypeofcall = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId },
      
        };




        dsTypeofcall = crmclient.list(para, "TypeOfCall");

        if (dsTypeofcall.Tables[0].Rows.Count > 0)
        {
            GVTypeOfCall.DataSource = dsTypeofcall.Tables[0];
            GVTypeOfCall.DataBind();
        }
        else
        {
            GVTypeOfCall.DataSource = ReturnEmptyRow();
            GVTypeOfCall.DataBind();
        }

        //-----old one---------

        //currObj.CompanyID = 1;
        //currObj.BranchID = 1;
        //dtCurrency = currClient.ListCurrency(currObj);
        //GvCurrency.DataSource = dtCurrency.Tables[0];
        //GvCurrency.DataBind();

    }

    protected void GVTypeOfCall_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GVTypeOfCall.EditIndex = e.NewEditIndex;
        bindGridData();
    }

    protected void GVTypeOfCall_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {


            TextBox typename = (TextBox)GVTypeOfCall.FooterRow.FindControl("txtFcallName");
            TextBox typeDesc = (TextBox)GVTypeOfCall.FooterRow.FindControl("txtFcalDesc");

            if (typename.Text == "" || typeDesc.Text == "")
            {
                Response.Redirect("../AllMaster/TypeOdServiceCall.aspx");
            }
            else
            {
                List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_Call_Name", Value=typename.Text},
                 new ParaList {Key = "@i_Desc", Value = typeDesc.Text},
                 new ParaList {Key="@i_CompId",Value=CurrentUser.CompId},
            };

                crmclient.Insert(para, "TypeOfCall");
                bindGridData();
            }
          
        }
    }

    protected void GVTypeOfCall_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long callId = Convert.ToInt32(GVTypeOfCall.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = callId.ToString() },


        };

        crmclient.Delete(para, "TypeOfCall");
        bindGridData();

    }

    protected void GVTypeOfCall_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GVTypeOfCall.EditIndex = -1;
        bindGridData();
    }

    protected void GVTypeOfCall_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int CallId = Convert.ToInt32(GVTypeOfCall.DataKeys[e.RowIndex].Value.ToString());
        TextBox callname = (TextBox)GVTypeOfCall.Rows[e.RowIndex].FindControl("txtECallName");
        TextBox calldesc = (TextBox)GVTypeOfCall.Rows[e.RowIndex].FindControl("txtECallDesc");

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_Call_Name",Value=callname.Text},
            new ParaList { Key="@i_Desc",Value=calldesc.Text},
            new ParaList {Key="@i_CallID",Value=CallId.ToString()},
           // new ParaList {Key="@i_CompId",Value=CurrentUser.CompId},

        };

        crmclient.Update(para, "TypeOfCall");
        GVTypeOfCall.EditIndex = -1;
        bindGridData();
    }

    protected void GVTypeOfCall_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (GVTypeOfCall.Rows.Count < 0)
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

   

    protected void GVTypeOfCall_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GVTypeOfCall.PageIndex = e.NewPageIndex;
        bindGridData();
    }
}