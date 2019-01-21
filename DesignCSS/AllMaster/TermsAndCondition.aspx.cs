using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_TermsAndCondition : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new ServiceClient();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindTermsCondition();
        }
    }

    public void bindTermsCondition()
    {

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId.ToString() },
            //new ParaList {Key="@i_BranchId", Value=CurrentUser.BranchId.ToString() },

        };

        ds = crmclient.list(para, "TNC");
        GvTermsCondition.DataSource = ds.Tables[0];
        GvTermsCondition.DataBind();

    }

    protected void DrpTncSubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        string subject = DrpTncSubject.SelectedItem.Text;
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
           // new ParaList {Key="@i_BranchId", Value=CurrentUser.BranchId },
             new ParaList {Key="@i_TNCSub", Value=subject.ToString() },
        };

        ds = crmclient.FillDDL(para, "TNC_QUE");
        GvTermsCondition.DataSource = ds.Tables[0];
        GvTermsCondition.DataBind();
    }

    protected void GvTermsCondition_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {
            string sub = DrpTncSubject.SelectedItem.Text;
            TextBox descr = (TextBox)GvTermsCondition.FooterRow.FindControl("txtFDescr");

            if (descr.Text == "")
            {
                Response.Redirect("../AllMaster/TermsAndCondition.aspx");
            }
            else
            {

                List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_subject", Value=sub.ToString()},
                 new ParaList {Key = "@i_terms", Value = descr.Text},
                 new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
                 new ParaList { Key="@i_BranchId",Value=CurrentUser.BranchId},
            };

                crmclient.Insert(para, "TNC");
                bindTermsCondition();
            }
        }
    }

    protected void GvTermsCondition_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvTermsCondition.EditIndex = e.NewEditIndex;
        bindTermsCondition();
    }





    protected void GvTermsCondition_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string tancID = GvTermsCondition.DataKeys[e.RowIndex].Value.ToString();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = tancID.ToString() },
        };

        crmclient.Delete(para, "TNC");
        bindTermsCondition();

    }

    protected void GvTermsCondition_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int tandcid = Convert.ToInt32(GvTermsCondition.DataKeys[e.RowIndex].Value.ToString());
        //TextBox tncSubject = (TextBox)GvTermsCondition.Rows[e.RowIndex].FindControl("txtESubject");
        TextBox tncDescription = (TextBox)GvTermsCondition.Rows[e.RowIndex].FindControl("txtEDescr");

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_TNCID",Value=tandcid.ToString()},
           // new ParaList { Key="@i_subject",Value=tncSubject.Text},
            new ParaList {Key="@i_Desc",Value=tncDescription.Text },
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },

        };

        crmclient.Update(para, "TNC");
        GvTermsCondition.EditIndex = -1;
        bindTermsCondition();

    }



    protected void GvTermsCondition_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataSet ds = new DataSet();
        //if (e.Row.RowType == DataControlRowType.Footer)
        //{
       
        DropDownList drpSub = e.Row.FindControl("drpsubject") as DropDownList; ;
        if (drpSub != null)
            { 
        // DropDownList drpSub = (e.Row.FindControl("drpsubject") as DropDownList);
        List<ParaList> para = new List<ParaList>()
                    {

                         new ParaList { Key = "@i_CompId", Value = CurrentUser.CompId},

                    };

            drpSub.DataValueField = "TNC_Sub";
            drpSub.DataTextField = "TNC_Sub";


            ds = crmclient.FillDDL(para, "TNCSub");
            drpSub.DataSource = ds.Tables[0];
            drpSub.DataBind();
            }
        //}
    }

    protected void GvTermsCondition_RowDeleting1(object sender, GridViewDeleteEventArgs e)
    {
        string tancID = GvTermsCondition.DataKeys[e.RowIndex].Value.ToString();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = tancID.ToString() },
        };

        crmclient.Delete(para, "TNC");
        bindTermsCondition();
    }

    protected void GvTermsCondition_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GvTermsCondition.PageIndex = e.NewPageIndex;
        bindTermsCondition();
    }

    protected void GvTermsCondition_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GvTermsCondition.EditIndex = -1;
        bindTermsCondition();
    }
}