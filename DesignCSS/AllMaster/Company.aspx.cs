using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_Company : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new ServiceClient();
    DataSet dscompanydetail = new DataSet();
    string fileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //bindArea();
           // bindState();
           // bindcity();
                ViewState["Compid"] = Request.QueryString["Id"].ToString();
            ViewState["CompanyName"] = Request.QueryString["CompanyName"].ToString();
            txtCompName.ReadOnly=true;
            if (ViewState["CompanyName"] != null)
            {
                txtCompName.Text = ViewState["CompanyName"].ToString();
            }
        }
    }

    //public void bindcity()
    //{
    //    DataSet dscity = new DataSet();
    //    List<ParaList> para = new List<ParaList>() {

    //    new ParaList { Key = "@mode", Value = "City" },
    //    new ParaList { Key = "@i_compId", Value = CurrentUser.CompId },


    //    };

    //    drpCity.DataValueField = "CityID";
    //    drpCity.DataTextField = "Name";


    //    dscity = crmclient.FillDDL(para.ToArray(), "City");
    //    drpCity.DataSource = dscity.Tables[0];
    //    drpCity.DataBind();
    //}

    //public void bindState()
    //{
    //    DataSet dsState = new DataSet();
    //    List<ParaList> para = new List<ParaList>() {

    //    new ParaList { Key = "@mode", Value = "State" },
    //    new ParaList { Key = "@i_compid", Value = "27"},


    //    };

    //    drpState.DataValueField = "StateID";
    //    drpState.DataTextField = "Name";


    //    dsState = crmclient.FillDDL(para.ToArray(), "State");
    //    drpState.DataSource = dsState.Tables[0];
    //    drpState.DataBind();
    //}

    //public void bindArea()
    //{
    //    DataSet dsArea = new DataSet();
    //    List<ParaList> para = new List<ParaList>() {

    //    new ParaList { Key = "@mode", Value = "Area" },
    //    new ParaList { Key = "@i_Compid", Value = "27" },


    //    };

    //    drpArea.DataValueField = "AreaID";
    //    drpArea.DataTextField = "Name";


    //    dsArea = crmclient.FillDDL(para.ToArray(), "Area");
    //    drpArea.DataSource = dsArea.Tables[0];
    //    drpArea.DataBind();
    //}

    //public void bindCountry()
    //{
    //    DataSet dscountry = new DataSet();
    //    List<ParaList> para = new List<ParaList>() {

    //    new ParaList { Key = "@mode", Value = "Country" },
    //     new ParaList { Key = "@i_Compid", Value ="27"},


    //    };

    //    drpCountry.DataValueField = "CountryID";
    //    drpCountry.DataTextField = "Name";


    //    dscountry = crmclient.FillDDL(para.ToArray(), "Country");
    //    drpCountry.DataSource = dscountry.Tables[0];
    //    drpCountry.DataBind();
    //}
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Uploadlogo.HasFile)
        {
            fileName = Path.GetFileName(Uploadlogo.PostedFile.FileName);
            Uploadlogo.PostedFile.SaveAs(Server.MapPath("~/UploadImage/") + fileName);

            //Label3.Text = "Image Uploaded";
            //Label3.ForeColor = System.Drawing.Color.ForestGreen;
        }


        List<ParaList> para1 = new List<ParaList>()
             {
            new ParaList { Key="@i_CompId", Value=ViewState["Compid"].ToString()},
            new ParaList { Key="@i_Address1", Value=txtAddressline1.Text},
            new ParaList { Key="@i_Address2",Value=txtAddressline2.Text},
             new ParaList { Key="@i_Area",Value=txtarea.Text},
              new ParaList { Key="@i_State",Value=txtstate.Text},
              new ParaList { Key="@i_Country",Value=txtcountry.Text},
              new ParaList { Key="@i_City", Value=txtcity.Text},
            new ParaList { Key="@i_Pincode",Value=txtPincode.Text},
             new ParaList { Key="@i_Phone1",Value=txtPhone1.Text},
              new ParaList { Key="@i_Mobile",Value=txtMobile.Text},

               new ParaList { Key="@i_Email", Value=txtEmail.Text},
            new ParaList { Key="@i_Website",Value=txtWebsite.Text},
             new ParaList { Key="@i_Gstin",Value=txtGSTIN.Text},
              new ParaList { Key="@i_StateCode",Value=txtStateCode.Text},
               new ParaList { Key="@i_LogoName",Value=fileName.ToString()},
    };

        crmclient.Update(para1, "CompanyInfo");
        Response.Redirect("../Login.aspx");
    }
}