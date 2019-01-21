using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class InqEntry : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataRow dtrow;
    DataTable dtContact = new DataTable();
    string XMLString = string.Empty;
    string leadId;
    protected void Page_Load(object sender, EventArgs e)
    {
        leadId = Request.QueryString["LeadId"];

        if (Session["ContactDetail"] != null)
        {
            dtContact = (DataTable)Session["ContactDetail"];
        }

        if (!IsPostBack)
        {
            if (Session["EmpMode"].ToString() == "Edit")
            {
                bindArea();
                bindcity();
                bindState();
                bindCountry();
                ItemCode();
                bindEmployee();
                txtCode.ReadOnly = true;
                LoadDataForEdit();
               // bindContactGrid();
            }
            else if (Session["EmpMode"].ToString() == "Insert")
            {
                Session["ContactDetail"] = null;
                bindContactGrid();
                bindArea();
                bindcity();
                bindState();
                bindCountry();
                ItemCode();
                bindEmployee();
                txtDate.Text = DateTime.Today.ToShortDateString();
                txtCode.ReadOnly = true;
            }

        }

    }


    public void ItemCode()
    {
        DataSet dscode = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {

            new ParaList { Key="@i_Module", Value="INQ"},
            new ParaList { Key="@i_YearCode", Value=""},
            new ParaList {Key="@i_FYID", Value="" },
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
        };

        dscode = crmclient.list(para, "Automatic_Number");
        if(dscode.Tables[0].Rows.Count>0)
        {
            txtCode.Text = dscode.Tables[0].Rows[0][0].ToString();
        }

    }

    public void bindContactGrid()
    {
        DataTable dtlocation = new DataTable();
        DataColumn dtId = new DataColumn("ContactName", typeof(System.String));

        dtlocation.Columns.Add(dtId);

        DataColumn dtdesignation = new DataColumn("Designation", typeof(System.String));

        dtlocation.Columns.Add(dtdesignation);

        DataColumn dtphone = new DataColumn("Phone1", typeof(System.String));

        dtlocation.Columns.Add(dtphone);

        DataColumn dtName = new DataColumn("Mobile", typeof(System.String));
        dtlocation.Columns.Add(dtName);

        DataColumn dtFromDate = new DataColumn("Email", typeof(System.String));
        dtlocation.Columns.Add(dtFromDate);

        DataColumn dtSGST = new DataColumn("DoB", typeof(System.String));
        dtlocation.Columns.Add(dtSGST);

        DataColumn dtCGST = new DataColumn("DoA", typeof(System.String));
        dtlocation.Columns.Add(dtCGST);

        dtrow = dtlocation.NewRow();
        dtlocation.Rows.Add(dtrow);
        GvContactDetail.DataSource = dtlocation;
        GvContactDetail.DataBind();
    }

    public void bindcity()
    {
        DataSet dscity = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "City" },
        new ParaList { Key = "@i_compId", Value = CurrentUser.CompId },


        };
       
        drpCity.DataValueField = "CityID";
        drpCity.DataTextField = "Name";
       

        dscity = crmclient.FillDDL(para, "City");
        drpCity.DataSource = dscity.Tables[0];
       
        drpCity.DataBind();
        drpCity.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    public void bindState()
    {
        DataSet dsState = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "State" },
        new ParaList { Key = "@i_compid", Value = CurrentUser.CompId},


        };

        drpState.DataValueField = "StateID";
        drpState.DataTextField = "Name";


        dsState = crmclient.FillDDL(para, "State");
        drpState.DataSource = dsState.Tables[0];
        drpState.DataBind();
        drpState.Items.Insert(0, new ListItem("--Select--", "0"));

    }

    public void bindArea()
    {
        DataSet dsArea = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "Area" },
        new ParaList { Key = "@i_Compid", Value =CurrentUser.CompId.ToString() },


        };

        drpArea.DataValueField = "AreaID";
        drpArea.DataTextField = "Name";


        dsArea = crmclient.FillDDL(para, "Area");
        drpArea.DataSource = dsArea.Tables[0];
        drpArea.DataBind();
        drpArea.Items.Insert(0, new ListItem("--Select--", "0"));
    }

    public void bindCountry()
    {
        DataSet dscountry = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "Country" },
         new ParaList { Key = "@i_Compid", Value =CurrentUser.CompId},


        };

        drpCountry.DataValueField = "CountryID";
        drpCountry.DataTextField = "Name";


        dscountry = crmclient.FillDDL(para, "Country");
        drpCountry.DataSource = dscountry.Tables[0];
        drpCountry.DataBind();
        drpCountry.Items.Insert(0, new ListItem("--Select--", "0"));
    }


    public void bindEmployee()
    {
        DataSet dsApptaken = new DataSet();
        List<ParaList> para = new List<ParaList>() {

       
         new ParaList { Key = "@i_Compid", Value =CurrentUser.CompId},


        };

        drpApptaken.DataValueField = "EmpID";
        drpApptaken.DataTextField = "EmpName";
      

        dsApptaken = crmclient.FillDDL(para, "Employee");
        drpApptaken.DataSource = dsApptaken.Tables[0];
        drpApptaken.DataBind();
        drpApptaken.Items.Insert(0, new ListItem("--Select--", "0"));



        drpAllocated.DataValueField = "EmpID";
        drpAllocated.DataTextField = "EmpName";


        dsApptaken = crmclient.FillDDL(para, "Employee");
        drpAllocated.DataSource = dsApptaken.Tables[0];
        drpAllocated.DataBind();
        drpAllocated.Items.Insert(0, new ListItem("--Select--", "0"));

    }



    
    protected void Calender_Click(object sender, EventArgs e)
    {
        txtDate.Focus();
        if(datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    }

    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtDate.Focus();
        txtDate.Text = datepicker.SelectedDate.ToString("dd/MM/yyyy");
        datepicker.Visible = false;
    }



    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtNextFolowUp.Focus();
        txtNextFolowUp.Text = Calendar1.SelectedDate.ToString("dd/MM/yyyy");
        Calendar1.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        txtNextFolowUp.Focus();
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }
    }

    public void LoadDataForEdit()
    {
        DataSet ds = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value =leadId },

        };
        ds = crmclient.Select(para, "Lead");
        if (ds.Tables[0].Rows.Count > 0)
        {

            txtCode.Text = ds.Tables[0].Rows[0]["LeadNo"].ToString();
            txtDate.Text = ds.Tables[0].Rows[0]["LeadDate"].ToString();
            // txtcurrentStock.Text = ds.Tables[0].Rows[0]["QOH"].ToString();
            drpApptaken.SelectedValue = ds.Tables[0].Rows[0]["Apptaken"].ToString();
            drpAllocated.SelectedValue = ds.Tables[0].Rows[0]["AllocatedToEmpID"].ToString();
            txtcustomerName.Text = ds.Tables[0].Rows[0]["CustomerName"].ToString();
            txtContactPerson.Text = ds.Tables[0].Rows[0]["ContactPerson"].ToString();
            txtAddressline1.Text = ds.Tables[0].Rows[0]["Address1"].ToString();
            txtAddressline2.Text = ds.Tables[0].Rows[0]["Address2"].ToString();
          

            drpCity.Text = ds.Tables[0].Rows[0]["CityID"].ToString();

            drpState.Text = ds.Tables[0].Rows[0]["stateid"].ToString();

            drpCountry.Text = ds.Tables[0].Rows[0]["countryid"].ToString();
            drpArea.Text = ds.Tables[0].Rows[0]["AreaID"].ToString();
            txtPincode.Text= ds.Tables[0].Rows[0]["Pincode"].ToString();
            txtMobile.Text= ds.Tables[0].Rows[0]["MobileNo"].ToString();
            txtPhone1.Text= ds.Tables[0].Rows[0]["Phone1"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["Email"].ToString();
            drpCategory.SelectedValue = ds.Tables[0].Rows[0]["Category"].ToString();
            txtWebsite.Text= ds.Tables[0].Rows[0]["Website"].ToString();
            drpSourceOfInq.SelectedItem.Text = ds.Tables[0].Rows[0]["SourceOfLead"].ToString();
            drpInqStatus.SelectedItem.Text = ds.Tables[0].Rows[0]["InterestLevel"].ToString();
            txtbudget.Text= ds.Tables[0].Rows[0]["CustomerBudget"].ToString();
            txtNextFolowUp.Text= ds.Tables[0].Rows[0]["NextFollowUpDate"].ToString();
            //txtProSerReq.Text = ds.Tables[0].Rows[0][""].ToString();
            txtRemarks.Text= ds.Tables[0].Rows[0]["Remarks"].ToString();
            txtgstinno.Text= ds.Tables[0].Rows[0]["Gstin"].ToString();
            txtPanNo.Text = ds.Tables[0].Rows[0]["PanCard"].ToString();
        }


        DataSet dscontact = new DataSet();
        List<ParaList> para1 = new List<ParaList>() {

        new ParaList { Key = "@i_RefID", Value =leadId.ToString() },
        new ParaList { Key = "@i_CompId", Value =CurrentUser.CompId },

        };
        dscontact = crmclient.list(para1, "ContactDetail");
        if (dscontact.Tables[0].Rows.Count > 0)
        {
            GvContactDetail.DataSource = dscontact;
            GvContactDetail.DataBind();
        }
        Session["ContactDetail"] = dscontact.Tables[0];
        btnSubmitInq.Text = "Update";
        btnCancel.Visible = false;
    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        int Cnt=0;
        if(Session["ContactDetail"]!=null)
        {
            XMLString = "<NewDataSet>";

            for (int i = 0; i < GvContactDetail.Rows.Count; i++)
            {
                XMLString = XMLString + "<Table>";
                XMLString = XMLString + "<ContactName>" + dtContact.Rows[i]["ContactName"].ToString() + "</ContactName>";
                XMLString = XMLString + "<Designation>" + dtContact.Rows[i]["Designation"].ToString() + "</Designation>";
                XMLString = XMLString + "<Phone>" +dtContact.Rows[i]["Phone1"]+ "</Phone>";
                XMLString = XMLString + "<Mobile>" +dtContact.Rows[i]["Mobile"] + "</Mobile>";
                XMLString = XMLString + "<Email>" + dtContact.Rows[i]["Email"] + "</Email>";
                XMLString = XMLString + "<Dob>" +dtContact.Rows[i]["DoB"] + "</Dob>";
                XMLString = XMLString + "<Doa>" +dtContact.Rows[i]["DoA"] + "</Doa>";
                XMLString = XMLString + "<CompId>"+CurrentUser.CompId+"</CompId>";

                
                XMLString = XMLString + "</Table> ";
                Cnt = Cnt + 1;
            }
            XMLString = XMLString + "</NewDataSet>";
        }


        if (Session["EmpMode"].ToString() == "Insert")
        {
            List<ParaList> para = new List<ParaList>()
        {

            new ParaList {Key="@i_Code",Value=txtCode.Text },
          
           // new ParaList {Key="@i_LeadDate",Value= DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString()},
            new ParaList {Key="@i_LeadDate",Value= txtDate.Text},

            new ParaList {Key="@i_CustName",Value=txtcustomerName.Text },
            new ParaList {Key="@i_Conprsn",Value=txtContactPerson.Text },
            new ParaList {Key="@i_Add1",Value=txtAddressline1.Text },
            new ParaList {Key="@i_Add2",Value=txtAddressline2.Text },
            new ParaList {Key="@i_CityID",Value=drpCity.SelectedValue },
            new ParaList {Key="@i_CountryID",Value=drpCountry.SelectedValue },
            new ParaList {Key="@i_stateid",Value=drpState.SelectedValue },
            new ParaList {Key="@i_areaeid",Value=drpArea.SelectedValue },
            new ParaList {Key="@i_Pincode",Value=txtPincode.Text },
            new ParaList {Key="@i_Mobile",Value=txtMobile.Text },
            new ParaList {Key="@i_Phone",Value=txtPhone1.Text },
            new ParaList {Key="@i_Email",Value=txtEmail.Text },
            new ParaList {Key="@i_category",Value=drpCategory.SelectedValue },

                new ParaList {Key="@i_website",Value=txtWebsite.Text },
                 new ParaList {Key="@i_status",Value=drpInqStatus.SelectedItem.Text },
                 new ParaList {Key="@i_sourceofinq",Value=drpSourceOfInq.SelectedItem.Text },
               new ParaList {Key="@i_budget",Value=txtbudget.Text },
               // new ParaList {Key="@i_followupDate",Value=DateTime.ParseExact(txtNextFolowUp.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString() },
               new ParaList {Key="@i_followupDate",Value=txtNextFolowUp.Text},
               new ParaList {Key="@i_product",Value=txtProSerReq.Text },
               new ParaList {Key="@i_remarks",Value=txtRemarks.Text },
               new ParaList {Key="@i_allocated",Value=drpAllocated.SelectedValue },
               new ParaList {Key="@i_apptaken",Value=drpApptaken.SelectedValue },
               new ParaList {Key="@i_CompId",Value=CurrentUser.CompId},
               new ParaList {Key="@i_userId",Value=CurrentUser.UserId.ToString()},
               new ParaList {Key="@i_gstin",Value=txtgstinno.Text},
               new ParaList {Key="@i_pan",Value=txtPanNo.Text},
               new ParaList {Key="@i_XMLString",Value=XMLString },
               new ParaList {Key="@i_Cnt",Value=Cnt.ToString()},
        };

            crmclient.Insert(para, "Lead");
            Response.Redirect("../Inquiry/InquiryList.aspx");
        }
        else if(Session["EmpMode"].ToString() == "Edit")
        {
            List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_LeadID",Value=leadId.ToString() },
             new ParaList {Key="@i_Code",Value=txtCode.Text },
          
           // new ParaList {Key="@i_LeadDate",Value= DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString()},
            new ParaList {Key="@i_LeadDate",Value= txtDate.Text},

            new ParaList {Key="@i_CustName",Value=txtcustomerName.Text },
             new ParaList {Key="@i_Conprsn",Value=txtContactPerson.Text },
            new ParaList {Key="@i_Add1",Value=txtAddressline1.Text },
            new ParaList {Key="@i_Add2",Value=txtAddressline2.Text },
            new ParaList {Key="@i_CityID",Value=drpCity.SelectedValue },
            new ParaList {Key="@i_CountryID",Value=drpCountry.SelectedValue },
            new ParaList {Key="@i_stateid",Value=drpState.SelectedValue },
            new ParaList {Key="@i_areaeid",Value=drpArea.SelectedValue },
            new ParaList {Key="@i_Pincode",Value=txtPincode.Text },
            new ParaList {Key="@i_Mobile",Value=txtMobile.Text },
            new ParaList {Key="@i_Phone",Value=txtPhone1.Text },
            new ParaList {Key="@i_Email",Value=txtEmail.Text },
            new ParaList {Key="@i_category",Value=drpCategory.SelectedValue },

            new ParaList {Key="@i_website",Value=txtWebsite.Text },
             new ParaList {Key="@i_status",Value=drpInqStatus.SelectedItem.Text },
              new ParaList {Key="@i_sourceofinq",Value=drpSourceOfInq.SelectedItem.Text },
               new ParaList {Key="@i_budget",Value=txtbudget.Text },
               // new ParaList {Key="@i_followupDate",Value=DateTime.ParseExact(txtNextFolowUp.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString() },
               new ParaList {Key="@i_followupDate",Value=txtNextFolowUp.Text},
               new ParaList {Key="@i_product",Value=txtProSerReq.Text },
               new ParaList {Key="@i_remarks",Value=txtRemarks.Text },
               new ParaList {Key="@i_allocated",Value=drpAllocated.SelectedValue },
               new ParaList {Key="@i_apptaken",Value=drpApptaken.SelectedValue },
               new ParaList {Key="@i_CompId",Value=CurrentUser.CompId},
               new ParaList {Key="@i_userId",Value=CurrentUser.UserId.ToString()},
               new ParaList {Key="@i_gstin",Value=txtgstinno.Text},
               new ParaList {Key="@i_pan",Value=txtPanNo.Text},
               new ParaList {Key="@i_XMLString",Value=XMLString },
               new ParaList {Key="@i_Cnt",Value=Cnt.ToString()},
        };

            crmclient.Update(para, "Lead");
            Session.Remove("EmpMode");
            Response.Redirect("../Inquiry/InquiryList.aspx");
            
        }
    }

    protected void GvContactDetail_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {
            TextBox Name = (TextBox)GvContactDetail.FooterRow.FindControl("txtFcontactName");
            TextBox Designation = (TextBox)GvContactDetail.FooterRow.FindControl("txtFdesignation");
            TextBox Phone = (TextBox)GvContactDetail.FooterRow.FindControl("txtFphone");
            TextBox Mobile = (TextBox)GvContactDetail.FooterRow.FindControl("txtFMobile");
            TextBox Email = (TextBox)GvContactDetail.FooterRow.FindControl("txtFEmail");
            TextBox DateOfBirth = (TextBox)GvContactDetail.FooterRow.FindControl("txtFDob");
            TextBox DateOfAniversary = (TextBox)GvContactDetail.FooterRow.FindControl("txtFDoA");

            if (dtContact.Columns.Count == 0)
            {
                dtContact.Columns.Add("ContactName");
                dtContact.Columns.Add("Designation");
                dtContact.Columns.Add("Phone1");
                dtContact.Columns.Add("Mobile");
                dtContact.Columns.Add("Email");
                dtContact.Columns.Add("DoB");
                dtContact.Columns.Add("DoA");
            }


            DataRow drow;
            drow = dtContact.NewRow();
            drow["ContactName"] = Name.Text;
            drow["Designation"] = Designation.Text;
            drow["Phone1"] = Phone.Text;
            drow["Mobile"] = Mobile.Text;
            drow["Email"] = Email.Text;
            drow["DoB"] = DateOfBirth.Text;
            drow["DoA"] = DateOfAniversary.Text;

            dtContact.Rows.Add(drow);
           
            Session["ContactDetail"] = dtContact;
            GvContactDetail.DataSource = dtContact;
            dtContact = (DataTable)Session["ContactDetail"];
            GvContactDetail.DataBind();
           
        }
    }


    protected void drpCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=drpCity.SelectedValue }
        };

        ds = crmclient.Select(para, "City_GetStateCountry");
        if (ds.Tables[0].Rows.Count > 0)
        {
            drpState.SelectedValue = ds.Tables[0].Rows[0]["StateID"].ToString();
            drpCountry.SelectedValue = ds.Tables[0].Rows[0]["CountryID"].ToString();
        }

        //--------Bind Area According to City
        DataSet dsarea = new DataSet();
        List<ParaList> paraArea = new List<ParaList>()
        {
            new ParaList {Key="@i_Cityid", Value=drpCity.SelectedValue },
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
        };

             dsarea = crmclient.LOV(paraArea, "Area");
       

            drpArea.DataValueField = "AreaID";
            drpArea.DataTextField = "Name";
            
            drpArea.DataSource = dsarea.Tables[0];
            drpArea.DataBind();
            drpArea.Items.Insert(0, new ListItem("--Select--", "0"));
       

    }

    protected void GvContactDetail_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        dtContact.Rows.RemoveAt(e.RowIndex);
        GvContactDetail.DataSource = dtContact;
        GvContactDetail.DataBind();
    }
}