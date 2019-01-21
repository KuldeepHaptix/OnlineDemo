using System;
using System.Collections.Generic;
using System.Data;
using System.Net.Mail;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.IO;
using NewCRMService;

public partial class Quotation_QuotationNew : System.Web.UI.Page
{

    //SaleskitCRMServices.ServiceClient crmclient = new SaleskitCRMServices.ServiceClient();

    // NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    Service crmclient = new Service();
    DataRow dtrow;
    DataRow dtitemrow;
    static DataTable dtDocList1 = new DataTable();
    DataTable DTres = new DataTable();
    DataRow R1;
    DataTable dtqitem = new DataTable();
    DataTable dtAddedItem = new DataTable();
    DataRow drAddedRow;
    string XMLString = string.Empty;
    decimal _sgst = 0;
    decimal _cgst = 0;
    decimal _igst = 0;
    int CntTNC = 0;
    int Cnt = 0;
    string QidForRevised;
    DataSet dsTNC;


    decimal FinalAMount = 0.00m;
    decimal finalNetAmount = 0.00m;

    //ReportDocument crystalreport = new ReportDocument();
    public string PdfFile
    {
        get { return mpdfFile; }
        set { mpdfFile = value; }
    }

    string mpdfFile;
    DataSet dsgetEid = new DataSet();
    DataSet dtQContDetail = new DataSet();
    DataSet dtblUser = new DataSet();
    DataSet dtDocList = new DataSet();
    
    protected void Page_Unload(object sender, EventArgs e)
    {
        string page = "PageUnload";
    }
    protected void Page_Load(object sender, EventArgs e)
    {


        //if (Session["QDTItem"] != null)
        //{
        // dtqitem = (DataTable)Session["QDTItem"];
        //}
        //    if (Session["Addeditem"] != null)
        //{
        //    dtAddedItem = (DataTable)Session["Addeditem"];
        //    GvIQitem.DataSource = (DataTable)Session["Addeditem"];
        //    GvIQitem.DataBind();
        //}
        
        if (!IsPostBack)
        {
         
            bindItemDetail();
            ItemCode();
            DeleteItemfromTEmp();
            dtDocList1.Columns.Clear();
            dtDocList1.Rows.Clear();
            dtDocList1.Columns.Add("QDocID");
            dtDocList1.Columns.Add("DocName");
            if (Session["QMode"] != null)
            {
                if (Session["QMode"].ToString() == "Revised")
                {
                    QidForRevised= Request.QueryString["QIdRevised"];
                    //QidForRevised = Session["RevisedId"].ToString();
                    bindRevisedQuotation();
                }

                if (Session["QMode"].ToString() == "Edit")
                {
                    QidForRevised = Request.QueryString["QidEdit"];
                    // QidForRevised = Session["QEditID"].ToString();
                    Session["QEditID"] = QidForRevised;
                    bindforEdit();
                }
            }
            
            //if(Session["QMode"].ToString() == "Edit")
            //{
            // QidForRevised = Session["QEditID"].ToString();
            //}
            bindLeadDDL();
            bindEmployee();
            bindTermsAndConditions();
            txtDate.Text = DateTime.Today.ToShortDateString();

            bindcity();
            bindState();
            bindCountry();
            bindArea();
            //bindQitemgrid();
            //bindItemDDL();

            // if (dtDocList1.Columns.Count == 0)
            //{
         
            //}
            
            
        }

    }

    public void DeleteItemfromTEmp()
    {
        List<ParaList> paraTempItem = new List<ParaList>()
        {
            new ParaList {Key="@i_Code", Value=txtCode.Text },
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
        };

        crmclient.Delete(paraTempItem, "Temp_QuotationDetailAll");
    }

   public void bindforEdit()
    {
        string Qcode = "";

        DataSet dsCode = new DataSet();
        DataSet dspino = new DataSet();

        List<ParaList> parafindCode = new List<ParaList>()
                {
                    new ParaList {Key="@i_RecID", Value=QidForRevised },

                };

        dsCode = crmclient.Select(parafindCode, "Quotation");
        if (dsCode.Tables[0].Rows.Count > 0)
        {
            Qcode = dsCode.Tables[0].Rows[0]["Code"].ToString();
            ViewState["CodeForRevised"] = Qcode;
        }

       
        txtDate.Text = dsCode.Tables[0].Rows[0]["QDate"].ToString();
        txtCode.Text = dsCode.Tables[0].Rows[0]["Code"].ToString();
        drpcustomer.SelectedValue = dsCode.Tables[0].Rows[0]["LeadId"].ToString();
        txtInqDate.Text = dsCode.Tables[0].Rows[0]["LeadDate"].ToString();
        txtCustCode.Text = dsCode.Tables[0].Rows[0]["LeadNo"].ToString();
        txtContPerson.Text = dsCode.Tables[0].Rows[0]["ContactPerson"].ToString();
        // drpApptaken.SelectedValue= dsCode.Tables[0].Rows[0]["ContactPerson"].ToString();
        txtAddressline1.Text = dsCode.Tables[0].Rows[0]["Address1"].ToString();
        txtAddressline2.Text = dsCode.Tables[0].Rows[0]["Address2"].ToString();
        drpCity.SelectedValue = dsCode.Tables[0].Rows[0]["CityID"].ToString();
        drpState.SelectedValue = dsCode.Tables[0].Rows[0]["stateid"].ToString();
        drpCountry.SelectedValue = dsCode.Tables[0].Rows[0]["countryid"].ToString();
        drpArea.SelectedValue = dsCode.Tables[0].Rows[0]["AreaID"].ToString();
        txtPincode.Text = dsCode.Tables[0].Rows[0]["Pincode"].ToString();
        txtMobile.Text = dsCode.Tables[0].Rows[0]["LeadMobile"].ToString();
        txtPhone1.Text = dsCode.Tables[0].Rows[0]["Phone1"].ToString();

        txtRef.Text = dsCode.Tables[0].Rows[0]["Reference"].ToString();
        txtAmount.Text = dsCode.Tables[0].Rows[0]["TotalAmount"].ToString();
        txtNetAmount.Text = dsCode.Tables[0].Rows[0]["NetAmount"].ToString();
        txtEmail.Text = dsCode.Tables[0].Rows[0]["LeadEmail"].ToString();
        drpApptaken.SelectedValue = dsCode.Tables[0].Rows[0]["EmpID"].ToString();
        drpAllocated.SelectedValue = dsCode.Tables[0].Rows[0]["EmpAllToID"].ToString();
        //}
        bindItemforRevised();
        bindDocumentRevised();

    }


    public void bindRevisedQuotation()
    {

        string Qcode = "";
        // if (Session["Revised"].ToString() == "True")
        // {
        DataSet dsCode = new DataSet();
        DataSet dspino = new DataSet();

        List<ParaList> parafindCode = new List<ParaList>()
                {
                    new ParaList {Key="@i_RecID", Value=QidForRevised },

                };

        dsCode = crmclient.Select(parafindCode, "Quotation");
        if (dsCode.Tables[0].Rows.Count > 0)
        {
            Qcode = dsCode.Tables[0].Rows[0]["Code"].ToString();
            ViewState["CodeForRevised"] = Qcode;
        }

        while (lblPICheck.Text != "0")
        {
            List<ParaList> parapino = new List<ParaList>()
                {
                    new ParaList {Key="@i_PiNo", Value=Qcode },
                };

            dspino = crmclient.Select(parapino, "Revised");
            txtCode.Text = dspino.Tables[0].Rows[0][0].ToString();
            Qcode = txtCode.Text;

            DataSet dscheckcode = new DataSet();

            List<ParaList> parachkcode = new List<ParaList>()
                    {
                        new ParaList {Key="@i_QuoCode", Value=Qcode },

                        new ParaList {Key="@i_CompID", Value=CurrentUser.CompId.ToString() },
                    };
            dscheckcode = crmclient.Select(parachkcode, "Check_Revised");
            lblPICheck.Text = dscheckcode.Tables[0].Rows[0][0].ToString();

        }

        txtDate.Text = dsCode.Tables[0].Rows[0]["QDate"].ToString();
        //txtCode.Text = dsCode.Tables[0].Rows[0]["Code"].ToString();
        drpcustomer.SelectedValue = dsCode.Tables[0].Rows[0]["LeadId"].ToString();
        txtInqDate.Text = dsCode.Tables[0].Rows[0]["LeadDate"].ToString();
        txtCustCode.Text = dsCode.Tables[0].Rows[0]["LeadNo"].ToString();
        txtContPerson.Text = dsCode.Tables[0].Rows[0]["ContactPerson"].ToString();
        // drpApptaken.SelectedValue= dsCode.Tables[0].Rows[0]["ContactPerson"].ToString();
        txtAddressline1.Text = dsCode.Tables[0].Rows[0]["Address1"].ToString();
        txtAddressline2.Text = dsCode.Tables[0].Rows[0]["Address2"].ToString();
        drpCity.SelectedValue = dsCode.Tables[0].Rows[0]["CityID"].ToString();
        drpState.SelectedValue = dsCode.Tables[0].Rows[0]["stateid"].ToString();
        drpCountry.SelectedValue = dsCode.Tables[0].Rows[0]["countryid"].ToString();
        txtPincode.Text = dsCode.Tables[0].Rows[0]["Pincode"].ToString();
        txtMobile.Text = dsCode.Tables[0].Rows[0]["LeadMobile"].ToString();
        txtPhone1.Text = dsCode.Tables[0].Rows[0]["Phone1"].ToString();

        txtRef.Text = dsCode.Tables[0].Rows[0]["Reference"].ToString();
        txtAmount.Text = dsCode.Tables[0].Rows[0]["TotalAmount"].ToString();
        txtNetAmount.Text = dsCode.Tables[0].Rows[0]["NetAmount"].ToString();
        txtEmail.Text = dsCode.Tables[0].Rows[0]["LeadEmail"].ToString();
        drpApptaken.SelectedValue = dsCode.Tables[0].Rows[0]["EmpID"].ToString();
        drpAllocated.SelectedValue = dsCode.Tables[0].Rows[0]["EmpAllToID"].ToString();
        //}
        bindItemforRevised();
        bindDocumentRevised();

    }

    public void bindDocumentRevised()
    {
        DataSet dsdoc = new DataSet();
        List<ParaList> paraDoc = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=QidForRevised},
        };
        dsdoc = crmclient.Select(paraDoc, "Quotation_Doc");
        dtDocList1 = dsdoc.Tables[0];
        Session["griddoc"] = dtDocList1;
        dtDocList1 = (DataTable)Session["griddoc"];
        GVAttachment.DataSource = dtDocList1;
        GVAttachment.DataBind();
    }

    public void bindItemforRevised()
    {


        DataSet dsitem = new DataSet();
        List<ParaList> paraItem = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=QidForRevised },
        };

        dsitem = crmclient.Select(paraItem, "QuotationDetail");
        int i = dsitem.Tables[0].Rows.Count;

        for (int j = 0; j < i; j++)
        {
            List<ParaList> paratemp = new List<ParaList>()

            {
           new ParaList {Key="@i_Code", Value=txtCode.Text },
            new ParaList {Key="@i_ItemId", Value=dsitem.Tables[0].Rows[j]["ItemID"].ToString() },
             new ParaList {Key="@i_ItemDesc", Value=dsitem.Tables[0].Rows[j]["Specification"].ToString() },
              new ParaList {Key="@i_Qnty", Value= dsitem.Tables[0].Rows[j]["Qty"].ToString()},
               new ParaList {Key="@i_Price", Value=dsitem.Tables[0].Rows[j]["Rate"].ToString() },
                new ParaList {Key="@i_Amount", Value=dsitem.Tables[0].Rows[j]["Amount"].ToString() },
                 new ParaList {Key="@i_UOM", Value=dsitem.Tables[0].Rows[j]["CUOMID"].ToString() },
                  new ParaList {Key="@i_TaxclassId", Value=dsitem.Tables[0].Rows[j]["TaxClassID"].ToString() },
                   new ParaList {Key="@i_NetAmount", Value=dsitem.Tables[0].Rows[j]["NetAmount"].ToString() },
                    new ParaList {Key="@i_Discount", Value=dsitem.Tables[0].Rows[j]["Discount"].ToString() },
                    new ParaList {Key="@i_GodownId", Value=dsitem.Tables[0].Rows[j]["GodownID"].ToString() },
                    new ParaList {Key="@i_CurrencyID", Value= dsitem.Tables[0].Rows[j]["CurrencyID"].ToString()},
                    new ParaList {Key="@i_SGSTAmount", Value=dsitem.Tables[0].Rows[j]["SGSTAmount"].ToString() },
                    new ParaList {Key="@i_CGSTAmount", Value=dsitem.Tables[0].Rows[j]["CGSTAmount"].ToString() },
                    new ParaList {Key="@i_IGSTAmount", Value= dsitem.Tables[0].Rows[j]["IGSTAmount"].ToString()},


       };
            crmclient.Insert(paratemp, "Temp_QuotationDetail");
        }


        bindItemDetail();
        //if (dsitem.Tables[0].Rows.Count>0)
        //{
        //    GvIQitem.DataSource = dsitem;
        //    GvIQitem.DataBind();
        //}     

    }
    public void ItemCode()
    {

        DataSet dscode = new DataSet();


        {
            List<ParaList> para = new List<ParaList>()
        {

            new ParaList { Key="@i_Module", Value="QU"},
            new ParaList { Key="@i_YearCode", Value=""},
            new ParaList {Key="@i_FYID", Value="1" },
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
        };

            dscode = crmclient.list(para, "Automatic_Number");
            if (dscode.Tables[0].Rows.Count > 0)
            {
                txtCode.Text = dscode.Tables[0].Rows[0][0].ToString();
            }

        }
    }
    public void bindTermsAndConditions()
    {//----Opens TNC grid in Modal Popup
        DataSet dsTNC = new DataSet();
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
            new ParaList {Key="@i_TNC_Sub", Value="QUOTATION" },
        };

        dsTNC = crmclient.LOV(para, "TNC");
        if (dsTNC.Tables[0].Rows.Count > 0)
        {
            GVTNC.DataSource = dsTNC.Tables[0];
            GVTNC.DataBind();
        }
    }
    public void bindItemDetail()
    {
        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_Code", Value=txtCode.Text },


        };

        DataSet dsitemlist = new DataSet();
        dsitemlist = crmclient.Select(para, "Temp_QuotationDetail");
        if (dsitemlist.Tables[0].Rows.Count > 0)
        {
            GvIQitem.DataSource = dsitemlist;
            GvIQitem.DataBind();
        }
        else
        {
            GvIQitem.DataSource = ReturnEmptyRow();
            GvIQitem.DataBind();
        }
    }
    public DataTable ReturnEmptyRow()
    {
        DataTable dtItemDetail = new DataTable();

        DataColumn dtItemid = new DataColumn("ItemId", typeof(System.String));

        dtItemDetail.Columns.Add(dtItemid);
        DataColumn dtQitemid = new DataColumn("QDetailID", typeof(System.String));

        dtItemDetail.Columns.Add(dtQitemid);

        DataColumn dtCname = new DataColumn("Name", typeof(System.String));

        dtItemDetail.Columns.Add(dtCname);

        DataColumn dtQnty = new DataColumn("Qty", typeof(System.String));
        dtItemDetail.Columns.Add(dtQnty);

        DataColumn dtuom = new DataColumn("UOM", typeof(System.String));
        dtItemDetail.Columns.Add(dtuom);

        DataColumn dtprice = new DataColumn("Rate", typeof(System.String));
        dtItemDetail.Columns.Add(dtprice);

        DataColumn dtCuurency = new DataColumn("CurrencyID", typeof(System.String));
        dtItemDetail.Columns.Add(dtCuurency);

        DataColumn dtAmount = new DataColumn("Amount", typeof(System.String));
        dtItemDetail.Columns.Add(dtAmount);

        DataColumn dtDiscount = new DataColumn("Discount", typeof(System.String));
        dtItemDetail.Columns.Add(dtDiscount);

        DataColumn dtNetAmount = new DataColumn("NetAmount", typeof(System.String));
        dtItemDetail.Columns.Add(dtNetAmount);

        DataColumn dtTaxClass = new DataColumn("TaxClassID", typeof(System.String));
        dtItemDetail.Columns.Add(dtTaxClass);

        DataColumn dtSGSTAmount = new DataColumn("SGSTAmount", typeof(System.String));
        dtItemDetail.Columns.Add(dtSGSTAmount);

        DataColumn dtCGSTAmount = new DataColumn("CGSTAmount", typeof(System.String));
        dtItemDetail.Columns.Add(dtCGSTAmount);

        DataColumn dtIGSTAmount = new DataColumn("IGSTAmount", typeof(System.String));
        dtItemDetail.Columns.Add(dtIGSTAmount);

        DataColumn dtSpecification = new DataColumn("Specification", typeof(System.String));
        dtItemDetail.Columns.Add(dtSpecification);

        dtitemrow = dtItemDetail.NewRow();
        dtItemDetail.Rows.Add(dtitemrow);

        return dtItemDetail;
    }


    //public void bindQitemgrid()
    //{

    //    if (dtqitem.Columns.Count == 0)
    //    {

    //        dtqitem.Columns.Add("ItemID");
    //        dtqitem.Columns.Add("Name");
    //        dtqitem.Columns.Add("Qnty");
    //        dtqitem.Columns.Add("UOM");
    //        dtqitem.Columns.Add("Price");
    //        dtqitem.Columns.Add("Currency");
    //        dtqitem.Columns.Add("Amount");
    //        dtqitem.Columns.Add("Discount");
    //        dtqitem.Columns.Add("NetAmount");
    //        dtqitem.Columns.Add("TaxClass");
    //        dtqitem.Columns.Add("sgst");
    //        dtqitem.Columns.Add("cgst");
    //        dtqitem.Columns.Add("igst");

    //        dtqitem.Columns.Add("Specification");



    //    }

    //    dtrow = dtqitem.NewRow();
    //    dtrow["ItemID"] = ViewState["ItemID"];
    //    dtrow["Name"] = drpItem.SelectedItem.Text;
    //    dtrow["Price"] = ViewState["Price"].ToString();
    //    dtrow["Qnty"] = 0.00;

    //    dtrow["UOM"] = ViewState["UOM"].ToString();
    //    dtqitem.Rows.Add(dtrow);

    //    Session["QDTItem"] = dtqitem;
    //    GvIQitem.DataSource = (DataTable)Session["QDTItem"];


    //    dtqitem = (DataTable)Session["QDTItem"];

    //    GvIQitem.DataBind();



    //    //----------------newly added code -------------


    //}
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
    //public void bindItemDDL()
    //{
    //    DataSet dsitem = new DataSet();
    //    List<ParaList> para = new List<ParaList>()
    //  {
    //      new ParaList {Key="@i_CompId", Value=CurrentUser.CompId }
    //  };

    //    dsitem = crmclient.FillDDL(para.ToArray(), "Item");

    //    drpItem.DataValueField = "ItemID";
    //    drpItem.DataTextField = "Name";
    //    if (dsitem.Tables[0].Rows.Count > 0)
    //    {

    //        drpItem.DataSource = dsitem.Tables[0];
    //        drpItem.DataBind();
    //        drpItem.Items.Insert(0, new ListItem("--Select--", "0"));
    //    }
    //}


    public void bindLeadDDL()
    {
        DataSet dscust = new DataSet();
        List<ParaList> para = new List<ParaList>()
      {
          new ParaList {Key="@i_compid", Value=CurrentUser.CompId }
      };

        dscust = crmclient.FillDDL(para, "Lead");

        drpcustomer.DataValueField = "LeadId";
        drpcustomer.DataTextField = "CustomerName";
        if (dscust.Tables[0].Rows.Count > 0)
        {

            drpcustomer.DataSource = dscust.Tables[0];
            drpcustomer.DataBind();
            drpcustomer.Items.Insert(0, new ListItem("--Select--", "0"));
        }
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

    protected void Calender_Click(object sender, EventArgs e)
    {
        txtDate.Focus();
        if (datepicker.Visible == true)
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
        txtDate.Text = datepicker.SelectedDate.ToShortDateString();
        datepicker.Visible = false;
    }

    protected void Calender1_Click(object sender, EventArgs e)
    {
        txtNextDate.Focus();
        if (Calendar1.Visible == true)
        {
            Calendar1.Visible = false;
        }
        else
        {
            Calendar1.Visible = true;
        }
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtNextDate.Focus();
        txtNextDate.Text = Calendar1.SelectedDate.ToShortDateString();
        Calendar1.Visible = false;
    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {

        List<ParaList> parafinalitem = new List<ParaList>()
        {
            new ParaList {Key="@i_Code", Value=txtCode.Text },


        };

        DataSet dsFinalItem = new DataSet();
        dsFinalItem = crmclient.Select(parafinalitem, "Temp_QuotationDetail");
        if (dsFinalItem.Tables[0].Rows.Count > 0)
        {
            //-----ITEM XMLSTRING----------------
            //int Cnt = 0;
            //if (Session["QDTItem"] != null)
            //{


            dtqitem = (DataTable)Session["QDTItem"];
            XMLString = "<NewDataSet>";


            for (int i = 0; i < GvIQitem.Rows.Count; i++)
            {
                XMLString = XMLString + "<Table>";
                XMLString = XMLString + "<ItemId>" + dsFinalItem.Tables[0].Rows[i]["ItemID"].ToString() + "</ItemId>";
                XMLString = XMLString + "<CurrencyID>" + dsFinalItem.Tables[0].Rows[i]["CurrID"] + "</CurrencyID>";
                XMLString = XMLString + "<GodownID>" + "1" + "</GodownID>";
                XMLString = XMLString + "<ItemDesc>" + dsFinalItem.Tables[0].Rows[i]["Specification"].ToString() + "</ItemDesc>";
                //  XMLString = XMLString + "<Name>" + dtqitem.Rows[i]["Name"].ToString() + "</Name>";

                XMLString = XMLString + "<Qty>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["Qty"]).ToString() + "</Qty>";
                XMLString = XMLString + "<Rate>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["Rate"]).ToString() + "</Rate>";
                XMLString = XMLString + "<UOM>" + dsFinalItem.Tables[0].Rows[i]["UOMID"].ToString() + "</UOM>";
                XMLString = XMLString + "<Amount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["Amount"]).ToString() + "</Amount>";
                XMLString = XMLString + "<TaxClassID>" + dsFinalItem.Tables[0].Rows[i]["taxID"].ToString() + "</TaxClassID>";

                XMLString = XMLString + "<SGSTAmount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["SGSTAmount"]).ToString("#0.00") + "</SGSTAmount>";
                XMLString = XMLString + "<CGSTAmount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["CGSTAmount"]).ToString("#0.00") + "</CGSTAmount>";
                XMLString = XMLString + "<IGSTAmount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["IGSTAmount"]).ToString("#0.00") + "</IGSTAmount>";
                XMLString = XMLString + "<NetAmount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["NetAmount"]).ToString() + "</NetAmount>";

                XMLString = XMLString + "<Discount>" + Convert.ToDecimal(dsFinalItem.Tables[0].Rows[i]["Discount"]).ToString() + "</Discount>";

                XMLString = XMLString + "</Table> ";


                //XMLString = XMLString + "<Table>";
                //XMLString = XMLString + "<ItemId>" + dtqitem.Rows[i]["ItemID"].ToString() + "</ItemId>";
                //XMLString = XMLString + "<CurrencyID>1</CurrencyID>";
                //XMLString = XMLString + "<GodownID>" + "1" + "</GodownID>";
                //XMLString = XMLString + "<ItemDesc>" + dtqitem.Rows[i]["Specification"].ToString() + "</ItemDesc>";
                ////  XMLString = XMLString + "<Name>" + dtqitem.Rows[i]["Name"].ToString() + "</Name>";

                //XMLString = XMLString + "<Qty>" + Convert.ToDecimal(dtqitem.Rows[i]["Qnty"]).ToString() + "</Qty>";
                //XMLString = XMLString + "<Rate>" + Convert.ToDecimal(dtqitem.Rows[i]["Price"]).ToString() + "</Rate>";
                //XMLString = XMLString + "<UOM>" + Convert.ToInt32(dtqitem.Rows[i]["UOM"]).ToString() + "</UOM>";
                //XMLString = XMLString + "<Amount>" + Convert.ToDecimal(dtqitem.Rows[i]["Amount"]).ToString() + "</Amount>";
                //XMLString = XMLString + "<TaxClassID>" + "1" + "</TaxClassID>";

                //XMLString = XMLString + "<SGSTRate>" + Convert.ToDecimal(dtqitem.Rows[i]["sgst"]).ToString() + "</SGSTRate>";
                //XMLString = XMLString + "<CGSTRate>" + Convert.ToDecimal(dtqitem.Rows[i]["cgst"]).ToString() + "</CGSTRate>";
                //XMLString = XMLString + "<IGSTRate>" + Convert.ToDecimal(dtqitem.Rows[i]["igst"]).ToString() + "</IGSTRate>";
                //XMLString = XMLString + "<NetAmount>" + Convert.ToDecimal(dtqitem.Rows[i]["NetAmount"]).ToString() + "</NetAmount>";

                //XMLString = XMLString + "<Discount>" + Convert.ToDecimal(dtqitem.Rows[i]["Discount"]).ToString() + "</Discount>";

                //XMLString = XMLString + "</Table> ";



                Cnt = Cnt + 1;
            }
            XMLString = XMLString + "</NewDataSet>";
        }
        // }
        //---------------------------------------------------------------------


        //----------------DOCUMENT XMLSTRNG--------------------


        int CntImg = 0;
        string XMLStringImg = string.Empty;
        XMLStringImg = "<NewDataSet>";
        for (int i = 0; i < GVAttachment.Rows.Count; i++)
        {
            if (GVAttachment.Rows[i].Cells[0].ToString() != null)
            {
                XMLStringImg = XMLStringImg + "<Table>";
                //XMLStringImg = XMLStringImg + "<DocName>" + GVAttachment.Rows[i].Cells[0].Text+ "</DocName>";

                XMLStringImg = XMLStringImg + "<DocName>" + dtDocList1.Rows[i]["DocName"].ToString() + "</DocName>";

                XMLStringImg = XMLStringImg + "</Table> ";
                //CntImg++;
                CntImg = CntImg + 1;
            }
        }
        XMLStringImg = XMLStringImg + "</NewDataSet>";

        ///=-----------------------------------------------------

        //--Check and Add Terms and conmditions using xml

        string XMLStringTNC = string.Empty;
        XMLStringTNC = "<NewDataSet>";
        for (int i = 0; i < GVTNC.Rows.Count; i++)
        {
            CheckBox SelectedChk = (CheckBox)GVTNC.Rows[i].FindControl("chkSelect");
            Label TNCid = (Label)GVTNC.Rows[i].FindControl("lblId");
            Label TNCDesc = (Label)GVTNC.Rows[i].FindControl("lbltandc");
            if (SelectedChk.Checked == true)
            {
                XMLStringTNC = XMLStringTNC + "<Table>";
                XMLStringTNC = XMLStringTNC + "<Code>" + txtCode.Text + "</Code>";
                XMLStringTNC = XMLStringTNC + "<TNC_Sub>QUOTATION</TNC_Sub>";
                XMLStringTNC = XMLStringTNC + "<TNC_Desc>" + TNCDesc.Text + "</TNC_Desc>";
                XMLStringTNC = XMLStringTNC + "<TNCID>" + TNCid.Text + "</TNCID>";
                XMLStringTNC = XMLStringTNC + "<CompId>" + CurrentUser.CompId + "</CompId>";

                XMLStringTNC = XMLStringTNC + "</Table> ";
                //CntImg++;
                CntTNC = CntTNC + 1;
            }
        }
        XMLStringTNC = XMLStringTNC + "</NewDataSet>";

        if (CntTNC > 0)
        {
            List<ParaList> paraTNC = new List<ParaList>()
            {
                new ParaList {Key="@i_Cnt1", Value=Convert.ToInt32(CntTNC).ToString()},
                new ParaList {Key="@i_XMLString1",Value=XMLStringTNC }
            };
            crmclient.Insert(paraTNC, "QuotationTNC");
        }
        //----------------------------------------------


        List<ParaList> para = new List<ParaList>()
        {
             
                new ParaList {Key="@i_Code",Value=txtCode.Text },
          
           // new ParaList {Key="@i_LeadDate",Value= DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString()},
            new ParaList {Key="@i_QDate",Value= txtDate.Text},

            new ParaList {Key="@i_custid",Value=drpcustomer.SelectedValue },
            new ParaList {Key="@I_UserId",Value=CurrentUser.UserId.ToString() },
            new ParaList {Key="@i_Conprsn",Value=txtContPerson.Text },
            new ParaList {Key="@i_email",Value=txtEmail.Text },
            new ParaList {Key="@i_Mobile",Value=txtMobile.Text },
            new ParaList {Key="@i_category",Value=drpCategory.SelectedItem.Text },
            new ParaList {Key="@i_Reference",Value=txtRef.Text },
            new ParaList {Key="@i_apptaken",Value=drpApptaken.SelectedValue },
            new ParaList {Key="@i_allocated",Value=drpAllocated.SelectedValue },
            new ParaList {Key="@i_remarks",Value="Remarks" },
            new ParaList {Key="@i_TotalAmount",Value=txtAmount.Text },
            new ParaList {Key="@i_NetAmount",Value=txtNetAmount.Text },
            new ParaList {Key="@i_FollowupDate",Value=txtNextDate.Text },

            new ParaList {Key="@i_Cnt",Value=Convert.ToInt32(Cnt).ToString()},
               // new ParaList {Key="@i_followupDate",Value=DateTime.ParseExact(txtNextFolowUp.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture).ToString() },
            new ParaList {Key="@i_XMLString",Value=XMLString},
            new ParaList {Key="@i_CC",Value=txtCC.Text },
            new ParaList {Key="@i_BCC",Value=txtBCC.Text },
            new ParaList {Key="@i_Is_SendMail",Value="0"},
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId},
            new ParaList {Key="@i_Subject",Value=txtSubject.Text},
            new ParaList {Key="@i_DocXMLStirng",Value=XMLStringImg},
            new ParaList {Key="@i_DocCount",Value=CntImg.ToString()},



        };

        if (Session["QMode"] != null)
        {
            if (Session["QMode"].ToString() == "Edit")
            {
                para.Add(new ParaList { Key = "@i_QuotationID", Value = Session["QEditID"].ToString() });

                crmclient.Update(para, "Quotation");
            }
            else
            {
                crmclient.Insert(para, "Quotation");
            }
        }
        else
        {
            crmclient.Insert(para, "Quotation");
        }

        //if (Session["QMode"] != null)
      //  {
         //   if (Session["Qmode"].ToString() == "Edit")
            //{
             //   crmclient.Update(para.ToArray(), "Quotation");
           // }
        //}
       

        Session.Remove("griddoc");
        dtDocList1.Rows.Clear();
        dtAddedItem.Rows.Clear();

        if (chkSendmail.Checked == true)
        {
            SendToMail();
        }
        DeleteItemfromTEmp();
        RemoveSession();
        Response.Redirect("../Quotation/QuotationList.aspx");
    }

    protected void drpcustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dsleaddata = new DataSet();
        string LeadId = drpcustomer.SelectedValue;

        List<ParaList> para = new List<ParaList>()
       {
           new ParaList {Key="@i_RecID", Value=LeadId.ToString() },
       };

        dsleaddata = crmclient.Select(para, "Lead");
        if (dsleaddata.Tables[0].Rows.Count > 0)
        {
            txtCustCode.Text = dsleaddata.Tables[0].Rows[0]["LeadNo"].ToString();
            txtInqDate.Text = dsleaddata.Tables[0].Rows[0]["LeadDate"].ToString();
            txtContPerson.Text = dsleaddata.Tables[0].Rows[0]["ContactPerson"].ToString();
            drpApptaken.SelectedValue = dsleaddata.Tables[0].Rows[0]["Apptaken"].ToString();
            drpAllocated.SelectedValue = dsleaddata.Tables[0].Rows[0]["AllocatedToEmpID"].ToString();
            txtAddressline1.Text = dsleaddata.Tables[0].Rows[0]["Address1"].ToString();
            txtAddressline2.Text = dsleaddata.Tables[0].Rows[0]["Address2"].ToString();
            drpCity.SelectedValue = dsleaddata.Tables[0].Rows[0]["CityID"].ToString();
            drpState.SelectedValue = dsleaddata.Tables[0].Rows[0]["stateid"].ToString();
            drpCountry.SelectedValue = dsleaddata.Tables[0].Rows[0]["countryid"].ToString();
            drpArea.SelectedValue = dsleaddata.Tables[0].Rows[0]["AreaID"].ToString();
            txtPincode.Text = dsleaddata.Tables[0].Rows[0]["Pincode"].ToString();
            txtMobile.Text = dsleaddata.Tables[0].Rows[0]["MobileNo"].ToString();
            txtPhone1.Text = dsleaddata.Tables[0].Rows[0]["Phone1"].ToString();
            txtEmail.Text = dsleaddata.Tables[0].Rows[0]["Email"].ToString();
            drpCategory.SelectedItem.Text = dsleaddata.Tables[0].Rows[0]["Category"].ToString();
            //txtStatus.Text = dsleaddata.Tables[0].Rows[0]["Status"].ToString();
        }
        else
        {
            Response.Redirect("../Quotation/QuotationNew.aspx");
        }
    }

    protected void GvIQitem_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (Session["QMode"] != null)
        //{
        //    if (Session["QMode"].ToString() == "Revised")
        //    {
        //    //GvIQitem.Columns[]
        //    }
        //}

        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (GvIQitem.Rows.Count < 0)
            {
                e.Row.Visible = false;
            }
            else
            {
                e.Row.Visible = true;
            }



            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList drEItemName = (DropDownList)e.Row.FindControl("drpEItemName");
                //-----bind itemname in editmode
                DataSet dsitem = new DataSet();
                List<ParaList> para = new List<ParaList>()
              {
                  new ParaList {Key="@i_CompId", Value=CurrentUser.CompId }
              };

                dsitem = crmclient.FillDDL(para, "Item");
                drEItemName.DataValueField = "ItemID";
                drEItemName.DataTextField = "Name";
                if (dsitem.Tables[0].Rows.Count > 0)
                {

                    drEItemName.DataSource = dsitem.Tables[0];
                    drEItemName.DataBind();

                    string Name = DataBinder.Eval(e.Row.DataItem, "ItemID").ToString();
                    drEItemName.SelectedItem.Text = Name;
                    drEItemName.SelectedValue = Name;
                    //  drEItemName.Items.Insert(0, new ListItem("--Select--", "0"));
                }



                //--------------------bind currency in editmode

                DropDownList drEcurrency = (DropDownList)e.Row.FindControl("drpEcurrency");

                DataSet dsEcurrency = new DataSet();


                List<ParaList> paraCurrency = new List<ParaList>()
                   {
                   new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                  };
                drEcurrency.DataValueField = "CurrencyID";
                drEcurrency.DataTextField = "Currency";
                dsEcurrency = crmclient.FillDDL(paraCurrency, "Currency");
                drEcurrency.DataSource = dsEcurrency.Tables[0];
                drEcurrency.DataBind();

                string CurrencyID = DataBinder.Eval(e.Row.DataItem, "CurrencyID").ToString();
                drEcurrency.SelectedItem.Text = CurrencyID;
                drEcurrency.SelectedValue = CurrencyID;

                //------------------bind taxclass

                DataSet dsETaxclass = new DataSet();
                DropDownList drpETaxclass = (DropDownList)e.Row.FindControl("drpETaxClass");

                List<ParaList> paraTaxclass = new List<ParaList>()
                    {
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                    };
                drpETaxclass.DataValueField = "TaxClassID";
                drpETaxclass.DataTextField = "TaxClass";
                dsETaxclass = crmclient.FillDDL(paraTaxclass, "TaxClass");
                drpETaxclass.DataSource = dsETaxclass.Tables[0];
                drpETaxclass.DataBind();

                string TaxClassID = DataBinder.Eval(e.Row.DataItem, "TaxClassID").ToString();// bind selected value
                drpETaxclass.SelectedItem.Text = TaxClassID;
                drpETaxclass.SelectedValue = TaxClassID;

                //----bind UOM

                DataSet dsEUom = new DataSet();
                DropDownList drpEUOM = (DropDownList)e.Row.FindControl("drpEUom");

                List<ParaList> paraUOM = new List<ParaList>()
                    {
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                    };
                drpEUOM.DataValueField = "UOMID";
                drpEUOM.DataTextField = "Name";
                dsEUom = crmclient.FillDDL(paraUOM, "UOM");
                drpEUOM.DataSource = dsEUom.Tables[0];
                drpEUOM.DataBind();


                string UOMID = DataBinder.Eval(e.Row.DataItem, "UOMID").ToString();// bind selected value
                drpEUOM.SelectedItem.Text = UOMID;
                drpEUOM.SelectedValue = UOMID;
            }

        }

        if (e.Row.RowType == DataControlRowType.Footer)
        {
            e.Row.Visible = true;
            DropDownList drItemName = (DropDownList)e.Row.FindControl("drpFItemName");
            //-----bind itemname
            DataSet dsitem = new DataSet();
            List<ParaList> para = new List<ParaList>()
              {
                  new ParaList {Key="@i_CompId", Value=CurrentUser.CompId }
              };

            dsitem = crmclient.FillDDL(para, "Item");

            drItemName.DataValueField = "ItemID";
            drItemName.DataTextField = "Name";
            if (dsitem.Tables[0].Rows.Count > 0)
            {

                drItemName.DataSource = dsitem.Tables[0];
                drItemName.DataBind();
                drItemName.Items.Insert(0, new ListItem("--Select--", "0"));
            }


            //-----------------------bind currency


            DropDownList drcurrency = (DropDownList)e.Row.FindControl("drpFcurrency");

            DataSet dscurrency = new DataSet();


            List<ParaList> paraCurrency = new List<ParaList>()
                   {
                   new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                  };
            drcurrency.DataValueField = "CurrencyID";
            drcurrency.DataTextField = "Currency";
            dscurrency = crmclient.FillDDL(paraCurrency, "Currency");
            drcurrency.DataSource = dscurrency.Tables[0];
            drcurrency.DataBind();

            //----------------------bind taxclass
            DataSet dsTaxclass = new DataSet();
            DropDownList drpTaxclass = (DropDownList)e.Row.FindControl("drpFTaxClass");

            List<ParaList> paraTaxclass = new List<ParaList>()
                    {
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                    };
            drpTaxclass.DataValueField = "TaxClassID";
            drpTaxclass.DataTextField = "TaxClass";
            dsTaxclass = crmclient.FillDDL(paraTaxclass, "TaxClass");
            drpTaxclass.DataSource = dsTaxclass.Tables[0];
            drpTaxclass.DataBind();


            //-----bind uom----
            DataSet dsUom = new DataSet();
            DropDownList drpUOM = (DropDownList)e.Row.FindControl("drpFUom");

            List<ParaList> paraUOM = new List<ParaList>()
                    {
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

                    };
            drpUOM.DataValueField = "UOMID";
            drpUOM.DataTextField = "Name";
            dsUom = crmclient.FillDDL(paraUOM, "UOM");
            drpUOM.DataSource = dsUom.Tables[0];
            drpUOM.DataBind();


            //---------------------------------

            TextBox Sgst = (TextBox)e.Row.FindControl("txtFsgst");
            TextBox Cgst = (TextBox)e.Row.FindControl("txtFcgst");
            TextBox Igst = (TextBox)e.Row.FindControl("txtFigst");
            TextBox Discount = (TextBox)e.Row.FindControl("txtFDiscount");
            TextBox Qnty = (TextBox)e.Row.FindControl("txtFQnty");
            TextBox NetAmount = (TextBox)e.Row.FindControl("txtFNetAmount");

            TextBox Amount = (TextBox)e.Row.FindControl("txtFAmount");


            Discount.Text = "0.00";
            Sgst.Text = "0.00";
            Cgst.Text = "0.00";
            Igst.Text = "0.00";
            Qnty.Text = "0.00";
            NetAmount.Text = "0.00";
            Amount.Text = "0.00";

        }



        ////---------------------------------------------------------

        //DataSet dsuom = new DataSet();
        ////if (e.Row.RowType == DataControlRowType.DataRow)
        ////{


        //        DropDownList drpuom = (DropDownList)e.Row.FindControl("drpUom");

        //        List<ParaList> paraUom = new List<ParaList>()
        //        {
        //        new ParaList {Key="@i_Compid", Value=CurrentUser.CompId },
        //        };
        //        drpuom.DataValueField = "UOMID";
        //        drpuom.DataTextField = "Name";
        //        dsuom = crmclient.FillDDL(paraUom.ToArray(), "UOM");
        //        drpuom.DataSource = dsuom.Tables[0];
        //        drpuom.DataBind();


        //        //----- bind curruncy------//
        //        DataSet dscurrency = new DataSet();
        //        DropDownList drCurrency = (DropDownList)e.Row.FindControl("drpcurrency");

        //        List<ParaList> paraCurrency = new List<ParaList>()
        //        {
        //        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

        //        };
        //        drCurrency.DataValueField = "CurrencyID";
        //        drCurrency.DataTextField = "Currency";
        //        dscurrency = crmclient.FillDDL(paraCurrency.ToArray(), "Currency");
        //        drCurrency.DataSource = dscurrency.Tables[0];
        //        drCurrency.DataBind();


        //        //------bind Taxclass--------
        //        DataSet dsTaxclass = new DataSet();
        //        DropDownList drpTaxclass = (DropDownList)e.Row.FindControl("drpTaxClass");

        //        List<ParaList> paraTaxclass = new List<ParaList>()
        //        {
        //        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },

        //        };
        //        drpTaxclass.DataValueField = "TaxClassID";
        //        drpTaxclass.DataTextField = "TaxClass";
        //        dsTaxclass = crmclient.FillDDL(paraTaxclass.ToArray(), "TaxClass");
        //        drpTaxclass.DataSource = dsTaxclass.Tables[0];
        //        drpTaxclass.DataBind();



        //        TextBox Sgst = (TextBox)e.Row.FindControl("txtsgst");
        //        TextBox Cgst = (TextBox)e.Row.FindControl("txtcgst");
        //        TextBox Igst = (TextBox)e.Row.FindControl("txtigst");

        //        Sgst.Text = "0.00";
        //        Cgst.Text = "0.00";
        //        Igst.Text = "0.00";

        //    //}
        //    //else
        //    //{
        //    //    if (Session["QDTItem"] != null)
        //    //    {
        //    //       // e.Row.Enabled = false;
        //    //        string data = "as it is data";
        //    //        GvIQitem.DataSource = (DataTable)Session["QDTItem"];
        //    //        GvIQitem.DataBind();
        //    //    }

        //    //}


        ////}

        ////----------------------------------------------------------------------
    }

    //protected void drpItem_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    DataSet dsitemgrid = new DataSet();
    //    List<ParaList> para = new List<ParaList>()
    //  {
    //      new ParaList {Key="@i_RecID", Value=drpItem.SelectedValue },
    //  };
    //    dsitemgrid = crmclient.Select(para.ToArray(), "Item");
    //    if (dsitemgrid.Tables[0].Rows.Count > 0)
    //    {
    //        ViewState["UOM"] = dsitemgrid.Tables[0].Rows[0]["CUOMID"].ToString();
    //        ViewState["Price"] = dsitemgrid.Tables[0].Rows[0]["Price"].ToString();
    //        ViewState["ItemID"] = dsitemgrid.Tables[0].Rows[0]["ItemID"].ToString();
    //       // ViewState["default"] = 0.00;
    //    }
    //    bindQitemgrid();

    //}

    public void calculateFinal_Amount()
    {
        if (GvIQitem.Rows.Count >= 0)
        {
            for (int i = 0; i < GvIQitem.Rows.Count; i++)
            {

                string amount = (GvIQitem.Rows[i].FindControl("lblAmount") as Label).Text;
                string netAmount = (GvIQitem.Rows[i].FindControl("lblNetamount") as Label).Text;
                // FinalAMount += Convert.ToDecimal(GvIQitem.Rows[i].Cells[12].Text.ToString());

                //string cellvalueamount = GvIQitem.DataKeys[i]["Amount"].ToString();
                if (amount != "" && netAmount != "")
                {
                    FinalAMount += Convert.ToDecimal((GvIQitem.Rows[i].FindControl("lblAmount") as Label).Text);
                    finalNetAmount += Convert.ToDecimal((GvIQitem.Rows[i].FindControl("lblNetamount") as Label).Text);
                }
            }
            txtAmount.Text = FinalAMount.ToString();
            txtNetAmount.Text = finalNetAmount.ToString();
        }
    }

    protected void GvIQitem_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {
            DropDownList Itemname = (DropDownList)GvIQitem.FooterRow.FindControl("drpFItemName");
            TextBox Qnty = (TextBox)GvIQitem.FooterRow.FindControl("txtFQnty");

            TextBox Rate = (TextBox)GvIQitem.FooterRow.FindControl("txtFRate");
            DropDownList Curency = (DropDownList)GvIQitem.FooterRow.FindControl("drpFcurrency");
            TextBox Amount = (TextBox)GvIQitem.FooterRow.FindControl("txtFAmount");
            TextBox Discount = (TextBox)GvIQitem.FooterRow.FindControl("txtFDiscount");
            TextBox Netamount = (TextBox)GvIQitem.FooterRow.FindControl("txtFNetAmount");
            DropDownList taxclass = (DropDownList)GvIQitem.FooterRow.FindControl("drpFTaxClass");
            DropDownList drpUOM = (DropDownList)GvIQitem.FooterRow.FindControl("drpFUom");
            TextBox Sgst = (TextBox)GvIQitem.FooterRow.FindControl("txtFsgst");
            TextBox Cgst = (TextBox)GvIQitem.FooterRow.FindControl("txtFcgst");
            TextBox igst = (TextBox)GvIQitem.FooterRow.FindControl("txtFigst");
            TextBox Desc = (TextBox)GvIQitem.FooterRow.FindControl("txtFdescription");


            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_Code", Value=txtCode.Text },
                 new ParaList {Key="@i_ItemId", Value=Itemname.SelectedValue },
                  new ParaList {Key="@i_ItemDesc", Value=Desc.Text },
                   new ParaList {Key="@i_Qnty", Value=Qnty.Text },
                    new ParaList {Key= "@i_Price", Value=Rate.Text },
                     new ParaList {Key="@i_Amount", Value=Amount.Text },
                      new ParaList {Key="@i_TaxclassId", Value=taxclass.SelectedValue },
                       new ParaList {Key="@i_NetAmount", Value=Netamount.Text },
                        new ParaList {Key="@i_Discount", Value =Discount.Text},
                         new ParaList {Key="@i_GodownId", Value="1" },
                         new ParaList {Key="@i_UOM",Value=drpUOM.SelectedValue },
                        new ParaList {Key="@i_CurrencyID", Value=Curency.SelectedValue },
                        new ParaList {Key="@i_SGSTAmount", Value=Sgst.Text },
                        new ParaList {Key="@i_CGSTAmount", Value=Cgst.Text },
                       new ParaList {Key="@i_IGSTAmount", Value=igst.Text },

            };
            crmclient.Insert(para, "Temp_QuotationDetail");

            bindItemDetail();


            //-------

            calculateFinal_Amount();
            //---------
            //bindItemDetail();





        }

        if (e.CommandName == "OK")
        {


            //-----------------------------------------new edited-------------------
            if (Session["QDTItem"] != null)
            {
                dtqitem = (DataTable)Session["QDTItem"];
            }
            int rowindex = GvIQitem.SelectedRow.RowIndex;

            GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);

            TextBox Name = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtSubject");
            TextBox Qnty = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtQnty");
            DropDownList UOM = (DropDownList)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("drpUom");
            TextBox Rate = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtRate");
            DropDownList Currency = (DropDownList)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("drpcurrency");
            TextBox Amount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtAmount");
            TextBox Discount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtDiscount");
            TextBox NetAmount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtNetAmount");
            DropDownList Taxclass = (DropDownList)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("drpTaxClass");
            TextBox Sgst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtsgst");
            TextBox Cgst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtcgst");
            TextBox Igst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtigst");

            TextBox Description = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtdescription");
            dtqitem.Rows[rowindex]["ItemId"] = ViewState["ItemID"].ToString();
            dtqitem.Rows[rowindex]["Name"] = Name.Text;
            dtqitem.Rows[rowindex]["Qnty"] = Qnty.Text;
            dtqitem.Rows[rowindex]["UOM"] = UOM.SelectedValue;
            dtqitem.Rows[rowindex]["Price"] = Rate.Text;
            dtqitem.Rows[rowindex]["Currency"] = Currency.SelectedValue;
            dtqitem.Rows[rowindex]["Amount"] = Amount.Text;
            dtqitem.Rows[rowindex]["Discount"] = Discount.Text;
            dtqitem.Rows[rowindex]["NetAmount"] = NetAmount.Text;

            dtqitem.Rows[rowindex]["TaxClass"] = Taxclass.SelectedValue;
            dtqitem.Rows[rowindex]["sgst"] = Sgst.Text;

            dtqitem.Rows[rowindex]["cgst"] = Cgst.Text;
            dtqitem.Rows[rowindex]["igst"] = Igst.Text;
            dtqitem.Rows[rowindex]["Specification"] = ViewState["ItemID"].ToString();
            // dtqitem = (DataTable)Session["QDTItem"];
            //GvIQitem.DataSource = dtqitem;
            //GvIQitem.DataBind();


            Session["QDTItem"] = dtqitem;
            GvIQitem.DataSource = (DataTable)Session["QDTItem"];
            GvIQitem.DataBind();

            GvIQitem.Rows[rowindex].Enabled = false;

            //-------------------------- insert data into Temp_QuotationDetail ------------ 

            //    List<ParaList> paar = new List<ParaList>()
            //{
            //    new ParaList {Key="@i_SSID",Value=ViewState["ItemID"].ToString()},
            //     new ParaList {Key="@i_ItemId",Value= },
            //      new ParaList {Key="@i_ItemDesc",Value= },
            //       new ParaList {Key="@i_Qnty",Value= },
            //        new ParaList {Key="@i_Price",Value= },
            //         new ParaList {Key="@i_Amount",Value= },
            //          new ParaList {Key="@i_TaxclassId",Value= },
            //           new ParaList {Key="@i_NetAmount",Value= },
            //            new ParaList {Key="@i_Discount",Value= },

            //          new ParaList {Key="@i_GodownId",Value= },
            //          new ParaList {Key="@i_CurrencyID",Value= },
            //          new ParaList {Key="@i_SGSTAmount",Value= },
            //          new ParaList {Key="@i_CGSTAmount",Value= },
            //          new ParaList {Key="@i_IGSTAmount",Value= },
            //};




        }
    }

    protected void txtQnty_TextChanged(object sender, EventArgs e)
    {

        CalculateAmount();




    }

    public void CalculateEditAmount(int i)
    {

     //   GridViewRow rw = (GridViewRow)GvIQitem.Rows[e.RowIndex];
     


        TextBox Amount = GvIQitem.Rows[i].FindControl("txtEAmount") as TextBox;
        // string amnt = Amount.Text;
        TextBox Qnty = GvIQitem.Rows[i].FindControl("txtEQnty") as TextBox;
        TextBox Price = GvIQitem.Rows[i].FindControl("txtERate") as TextBox; 
        TextBox Discount = GvIQitem.Rows[i].FindControl("txtEDiscount") as TextBox; 
        TextBox NetAmount = GvIQitem.Rows[i].FindControl("txtENetAmount") as TextBox; 
        TextBox sgst = GvIQitem.Rows[i].FindControl("txtEsgst") as TextBox; 
        TextBox cgst = GvIQitem.Rows[i].FindControl("txtEcgst") as TextBox; 
        TextBox igst = GvIQitem.Rows[i].FindControl("txtEigst") as TextBox; 



        try
        {
            
            double TotalAmount = Convert.ToDouble(Qnty.Text) * Convert.ToDouble(Price.Text);
            double SGSTAmt = 0;
            double CGSTAmt = 0;
            double IGSTAmt = 0;


            double NetAmt = 0;

            if (Discount.Text != "0.00")
            {
                // TotalAmount = Convert.ToDouble(Discount.Text);
                TotalAmount = Convert.ToDouble(NetAmount.Text);
            }
            sgst.Text = _sgst.ToString();
            cgst.Text = _cgst.ToString();
            igst.Text = _igst.ToString();
            Amount.Text = (Convert.ToDouble(Qnty.Text) * Convert.ToDouble(Price.Text)).ToString("#0.00");

            SGSTAmt = (TotalAmount * Convert.ToDouble(sgst.Text)) / 100;
            sgst.Text = SGSTAmt.ToString("#0.00");

            CGSTAmt = (TotalAmount * Convert.ToDouble(cgst.Text)) / 100;
            cgst.Text = CGSTAmt.ToString("#0.00");

            IGSTAmt = (TotalAmount * Convert.ToDouble(igst.Text)) / 100;
            igst.Text = IGSTAmt.ToString("#0.00");

            NetAmt = SGSTAmt + CGSTAmt + IGSTAmt + TotalAmount;

            NetAmount.Text = NetAmt.ToString("#0.00");
            // txtamtdiscount.Text = (Convert.ToDecimal(txtamt.Text) - ((Convert.ToDecimal(txtamt.Text) * Convert.ToDecimal(txtdis.Text)) / 100)).ToString();
        }
        catch (Exception exc)
        {
            throw exc;
        }
    }
    public void CalculateAmount()
    {
        GridViewRow row = GvIQitem.FooterRow;
        TextBox Amount = ((TextBox)row.FindControl("txtFAmount"));
        TextBox Qnty = ((TextBox)row.FindControl("txtFQnty"));
        TextBox Price = ((TextBox)row.FindControl("txtFRate"));
        TextBox Discount = ((TextBox)row.FindControl("txtFDiscount"));
        TextBox NetAmount = ((TextBox)row.FindControl("txtFNetAmount"));
        TextBox sgst = ((TextBox)row.FindControl("txtFsgst"));
        TextBox cgst = ((TextBox)row.FindControl("txtFcgst"));
        TextBox igst = ((TextBox)row.FindControl("txtFigst"));

        try
        {

            //string qnty = Qnty.Text;
            double TotalAmount = Convert.ToDouble(Qnty.Text) * Convert.ToDouble(Price.Text);

            double SGSTAmt = 0;
            double CGSTAmt = 0;
            double IGSTAmt = 0;


            double NetAmt = 0;

            if (Discount.Text != "0.00")
            {
                // TotalAmount = Convert.ToDouble(Discount.Text);
                TotalAmount = Convert.ToDouble(NetAmount.Text);
            }
            sgst.Text = _sgst.ToString();
            cgst.Text = _cgst.ToString();
            igst.Text = _igst.ToString();
            Amount.Text = (Convert.ToDouble(Qnty.Text) * Convert.ToDouble(Price.Text)).ToString("#0.00");

            SGSTAmt = (TotalAmount * Convert.ToDouble(sgst.Text)) / 100;
            sgst.Text = SGSTAmt.ToString("#0.00");

            CGSTAmt = (TotalAmount * Convert.ToDouble(cgst.Text)) / 100;
            cgst.Text = CGSTAmt.ToString("#0.00");

            IGSTAmt = (TotalAmount * Convert.ToDouble(igst.Text)) / 100;
            igst.Text = IGSTAmt.ToString("#0.00");

            NetAmt = SGSTAmt + CGSTAmt + IGSTAmt + TotalAmount;

            NetAmount.Text = NetAmt.ToString("#0.00");
            // DiscountedAmount=Convert.ToDouble((Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100)).ToString());
            // txtNetAmount.Text = NetAmt.ToString();
            // txtamtdiscount.Text = (Convert.ToDecimal(txtamt.Text) - ((Convert.ToDecimal(txtamt.Text) * Convert.ToDecimal(txtdis.Text)) / 100)).ToString();
        }
        catch (Exception exc)
        {
            throw exc;
        }
    }

    protected void txtDiscount_TextChanged(object sender, EventArgs e)
    {
        TextBox Amount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtAmount");
        TextBox Discount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtDiscount");
        TextBox NetAmount = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtNetAmount");


        TextBox sgst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtsgst");
        TextBox cgst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtcgst");
        TextBox igst = (TextBox)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("txtigst");
        decimal s = Convert.ToDecimal(sgst.Text);
        decimal c = Convert.ToDecimal(cgst.Text);
        decimal i = Convert.ToDecimal(igst.Text);
        Amount.Text = (Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100)).ToString();

        decimal total = Convert.ToDecimal(Amount.Text);
        NetAmount.Text = (total + s + c + i).ToString();

    }

    protected void drpTaxClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dstaxrate = new DataSet();
        DropDownList drptaxclass = (DropDownList)GvIQitem.Rows[GvIQitem.SelectedIndex].FindControl("drpTaxClass");
        try
        {
            List<ParaList> para = new List<ParaList>()
         {
             new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
             new ParaList {Key="@i_RecID", Value=drptaxclass.SelectedValue },
         };

            dstaxrate = crmclient.Select(para, "TaxClass_GetRate");
            if (dstaxrate.Tables[0].Rows.Count > 0)
            {
                _sgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["SGST"].ToString()));
                _cgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["CGST"].ToString()));
                _igst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["IGST"].ToString()));
            }
            CalculateAmount();



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void btn_Fileupload_Click(object sender, EventArgs e)
    {
        string fupFilename;
        try
        {
            if (quotefileupload.HasFile)
            {
                // R1 = DTres.NewRow();
                quotefileupload.SaveAs(Server.MapPath(@"~/QDoc/") + quotefileupload.FileName);
                DataRow dr = dtDocList1.NewRow();
                dr["QDocID"] = "0";
                dr["DocName"] = quotefileupload.FileName;
                fupFilename = quotefileupload.FileName;

                dtDocList1.Rows.Add(dr);

                if (dtDocList1 != null)
                {
                    if (dtDocList1.Rows.Count > 0)
                    {
                        GVAttachment.DataSource = dtDocList1;
                        GVAttachment.DataBind();
                    }
                }

                quotefileupload.Focus();
            }

            Session["griddoc"] = dtDocList1;
            Session["FileName"] = quotefileupload.FileName;
        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void chkAllTNC_CheckedChanged(object sender, EventArgs e)
    {
        if (chkAllTNC.Checked == true)
        {
            for (int i = 0; i < GVTNC.Rows.Count; i++)
            {
                CheckBox chktick = (CheckBox)GVTNC.Rows[i].FindControl("chkSelect");

                chktick.Checked = true;
            }
        }
        else
        {
            for (int i = 0; i < GVTNC.Rows.Count; i++)
            {
                CheckBox chktick = (CheckBox)GVTNC.Rows[i].FindControl("chkSelect");

                chktick.Checked = false;
            }
        }
    }



    protected void GvIQitem_SelectedIndexChanged(object sender, EventArgs e)
    {
        int rowindexselected = GvIQitem.SelectedIndex;
    }

    protected void txtFQnty_TextChanged(object sender, EventArgs e)
    {
        CalculateAmount();
    }

    protected void txtFDiscount_TextChanged(object sender, EventArgs e)
    {
        //DropDownList drItemName = (DropDownList)e.Row.FindControl("drpFItemName");

        TextBox Amount = ((TextBox)GvIQitem.FooterRow.FindControl("txtFAmount"));
        TextBox Qnty = ((TextBox)GvIQitem.FooterRow.FindControl("txtFQnty"));
        TextBox Price = ((TextBox)GvIQitem.FooterRow.FindControl("txtFRate"));
        TextBox Discount = ((TextBox)GvIQitem.FooterRow.FindControl("txtFDiscount"));
        TextBox NetAmount = ((TextBox)GvIQitem.FooterRow.FindControl("txtFNetAmount"));
        TextBox sgst = ((TextBox)GvIQitem.FooterRow.FindControl("txtFsgst"));
        TextBox cgst = ((TextBox)GvIQitem.FooterRow.FindControl("txtFcgst"));
        TextBox igst = ((TextBox)GvIQitem.FooterRow.FindControl("txtFigst"));

        decimal s = Convert.ToDecimal(sgst.Text);
        decimal c = Convert.ToDecimal(cgst.Text);
        decimal i = Convert.ToDecimal(igst.Text);
        //Amount.Text = (Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100)).ToString();
        decimal total = (Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100));
        //decimal total = Convert.ToDecimal(Amount.Text);
        NetAmount.Text = (total + s + c + i).ToString();
        txtNetAmount.Text = NetAmount.Text;
        //txtAmount.Text = Amount.Text;
        //NetAmount.Text = NetAmount.Text;

    }

    protected void drpFTaxClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dstaxrate = new DataSet();
        DropDownList drptaxclass = (DropDownList)GvIQitem.FooterRow.FindControl("drpFTaxClass");
        try
        {
            List<ParaList> para = new List<ParaList>()
         {
             new ParaList {Key="@i_CompId", Value=CurrentUser.CompId.ToString() },
             new ParaList {Key="@i_RecID", Value=drptaxclass.SelectedValue },
         };

            dstaxrate = crmclient.Select(para, "TaxClass_GetRate");
            if (dstaxrate.Tables[0].Rows.Count > 0)
            {
                _sgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["SGST"].ToString()));
                _cgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["CGST"].ToString()));
                _igst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["IGST"].ToString()));
            }
            CalculateAmount();



        }
        catch (Exception)
        {

            throw;
        }
    }

    protected void drpFItemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList drpItemName = (DropDownList)GvIQitem.FooterRow.FindControl("drpFItemName");
        TextBox txtPrice = (TextBox)GvIQitem.FooterRow.FindControl("txtFRate");
        DropDownList drpuom = (DropDownList)GvIQitem.FooterRow.FindControl("drpFUom");
        TextBox txtItemID = (TextBox)GvIQitem.FooterRow.FindControl("txtFid");



        DataSet dsitemgrid = new DataSet();
        List<ParaList> para = new List<ParaList>()
      {
          new ParaList {Key="@i_RecID", Value=drpItemName.SelectedValue },
      };
        dsitemgrid = crmclient.Select(para, "Item");
        if (dsitemgrid.Tables[0].Rows.Count > 0)
        {
            txtPrice.Text = dsitemgrid.Tables[0].Rows[0]["Price"].ToString();
            drpuom.SelectedValue = dsitemgrid.Tables[0].Rows[0]["CUOMID"].ToString();
            txtItemID.Text = dsitemgrid.Tables[0].Rows[0]["ItemID"].ToString();
        }
    }

    protected void GvIQitem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long Id = Convert.ToInt32(GvIQitem.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = Id.ToString() },
        
        };

        crmclient.Delete(para, "Temp_QuotationDetail");
        bindItemDetail();
        calculateFinal_Amount();


    }

    protected void GvIQitem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GvIQitem.EditIndex = e.NewEditIndex;
        bindItemDetail();
    }

    protected void GvIQitem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

        int CrrId = Convert.ToInt32(GvIQitem.DataKeys[e.RowIndex].Value.ToString());
        DropDownList Itemname = (DropDownList)GvIQitem.Rows[e.RowIndex].FindControl("drpEItemName");
        TextBox Qnty = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEQnty");

        TextBox Rate = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtERate");
        DropDownList Curency = (DropDownList)GvIQitem.Rows[e.RowIndex].FindControl("drpEcurrency");
        TextBox Amount = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEAmount");
        TextBox Discount = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEDiscount");
        TextBox Netamount = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtENetAmount");
        DropDownList taxclass = (DropDownList)GvIQitem.Rows[e.RowIndex].FindControl("drpETaxClass");
        DropDownList drpUOM = (DropDownList)GvIQitem.Rows[e.RowIndex].FindControl("drpEUom");
        TextBox Sgst = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEsgst");
        TextBox Cgst = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEcgst");
        TextBox igst = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEigst");
        TextBox Desc = (TextBox)GvIQitem.Rows[e.RowIndex].FindControl("txtEdescription");

        List<ParaList> para = new List<ParaList>() {
            new ParaList { Key = "@i_Qitemid", Value = CrrId.ToString()},
                 new ParaList { Key = "@i_ItemId", Value = Itemname.SelectedValue },
                  new ParaList { Key = "@i_ItemDesc", Value = Desc.Text },
                   new ParaList { Key = "@i_Qnty", Value = Qnty.Text },
                    new ParaList { Key = "@i_Price", Value = Rate.Text },
                     new ParaList { Key = "@i_Amount", Value = Amount.Text },
                      new ParaList { Key = "@i_TaxclassId", Value = taxclass.SelectedValue },
                       new ParaList { Key = "@i_NetAmount", Value = Netamount.Text },
                        new ParaList { Key = "@i_Discount", Value = Discount.Text },
                         new ParaList { Key = "@i_GodownId", Value = "1" },
                         new ParaList { Key = "@i_UOM", Value = drpUOM.SelectedValue },
                        new ParaList { Key = "@i_CurrencyID", Value = Curency.SelectedValue },
                        new ParaList { Key = "@i_SGSTAmount", Value = Sgst.Text },
                        new ParaList { Key = "@i_CGSTAmount", Value = Cgst.Text },
                       new ParaList { Key = "@i_IGSTAmount", Value = igst.Text },
                       };
        crmclient.Update(para, "Temp_Quotation");
        GvIQitem.EditIndex = -1;
        bindItemDetail();
    }

    protected void txtEDiscount_TextChanged(object sender, EventArgs e)
    {


        string Amount = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEAmount")).Text;
        string Qnty = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEQnty")).Text;

        string Price = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtERate")).Text;
        string Discount = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEDiscount")).Text;
        string NetAmount = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtENetAmount")).Text;

        string sgst = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEsgst")).Text;
        string cgst = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEcgst")).Text;
        string igst = ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEigst")).Text;


        //------------------


        decimal s = Convert.ToDecimal(sgst);
        decimal c = Convert.ToDecimal(cgst);
        decimal i = Convert.ToDecimal(igst);
        Amount = ((Convert.ToDecimal(Qnty)) * (Convert.ToDecimal(Price))).ToString();

        ((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEAmount")).Text = (Convert.ToDecimal(Amount) - ((Convert.ToDecimal(Amount) * Convert.ToDecimal(Discount)) / 100)).ToString();

        // decimal total = Convert.ToDecimal(((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEAmount")).Text);
        decimal total = Convert.ToDecimal(Amount);

        NetAmount = (total + s + c + i).ToString();

    }

    protected void drpETaxClass_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        DataSet dstaxrate = new DataSet();
        DropDownList drptaxclass = (DropDownList)GvIQitem.FooterRow.FindControl("drpFTaxClass");
        try
        {
            List<ParaList> para = new List<ParaList>()
         {
             new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
             new ParaList {Key="@i_RecID", Value=drptaxclass.SelectedValue },
         };

            dstaxrate = crmclient.Select(para, "TaxClass_GetRate");
            if (dstaxrate.Tables[0].Rows.Count > 0)
            {
                _sgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["SGST"].ToString()));
                _cgst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["CGST"].ToString()));
                _igst = (Convert.ToDecimal(dstaxrate.Tables[0].Rows[0]["IGST"].ToString()));
            }
            int RowIndex = ((GridViewRow)((DropDownList)sender).NamingContainer).RowIndex;
            CalculateEditAmount(RowIndex);



        }
        catch (Exception)
        {

            throw;
        }
    }
    protected void txtFRate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            CalculateAmount();
        }
        catch (Exception ex)
        {
            throw;
        }
    }

    public void SendToMail()
    {
        try
        {
            List<ParaList> paraGetEId = new List<ParaList>()
            {
                new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },

            };

            dsgetEid = crmclient.Select(paraGetEId, "EmailConfiguration");
            string vMailFm = "", vMailTo = "", vusername = "", vSubject = "", vDetails = "";

            if (dsgetEid.Tables[0].Rows[0]["Con_Email"].ToString() != "")
            {
                vMailFm = dsgetEid.Tables[0].Rows[0]["Con_Email"].ToString();
            }


            DataSet dsQid = new DataSet();
            List<ParaList> paraQid = new List<ParaList>()
            {
                new ParaList {Key="@i_Code", Value=txtCode.Text },
                new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
            };

            dsQid = crmclient.Select(paraQid, "QuotationId");
            RPT_Sub(Convert.ToInt32(dsQid.Tables[0].Rows[0]["QuotationId"].ToString()));


            string pdfname = PdfFile;
            DataSet dsEmail = new DataSet();
            string Rcode = txtCode.Text;

            List<ParaList> paraEmail = new List<ParaList>()
            {
                new ParaList {Key="@i_Type", Value="Quotation" },
                new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
            };



            dsEmail = crmclient.LOV(paraEmail, "Email");// geting body of mail


            System.Net.Mail.MailMessage vMail = new System.Net.Mail.MailMessage(vMailFm, txtCC.Text);

            vSubject = dsEmail.Tables[0].Rows[0][0].ToString() + " For " + txtSubject.Text.Replace("\n", "<br />") + " From " + CurrentUser.Name; // SUBJECT LINE

            vDetails = dsEmail.Tables[0].Rows[0][1].ToString(); // HEADER PART OF BODY
                                                                //txtHeader.Text = dtEmail.Rows[0][1].ToString(); // HEADER PART OF BODY
                                                                //vDetails = "<p>" + txtHeader.Text.ToString() + "</p>";
            vDetails += "<br /><br />";
            vDetails += "<p>" + dsEmail.Tables[0].Rows[0][2].ToString() + "</p>"; // FOOTER PART OF BODY

            vDetails += "<br> Quotation Amount:" + txtNetAmount.Text + "' <br>";


            if (txtCC.Text.Trim() != "")
            {
                vMail.CC.Add(txtCC.Text);
            }
            if (txtBCC.Text.Trim() != "")
            {
                vMail.Bcc.Add(txtBCC.Text);
            }
            vMail.Subject = vSubject;
            vMail.Body = vDetails;

            vMail.Attachments.Add(new Attachment((Server.MapPath(@"Quotation\pdf\QuotationTAX.pdf"))));
            vMail.IsBodyHtml = true;

            foreach (DataRow dtr1 in dtDocList1.Rows)
            {
                if (File.Exists(Server.MapPath(@"~\QDoc\" + dtr1["DocName"].ToString())))
                {
                    vMail.Attachments.Add(new Attachment(Server.MapPath(@"~\QDoc\" + dtr1["DocName"].ToString())));
                }
                else
                {
                    vMail.Attachments.Add(new Attachment(Server.MapPath(dtr1["DocName"].ToString())));

                }
            }

            vMail.IsBodyHtml = true;

            System.Net.Mail.SmtpClient vSmpt = new System.Net.Mail.SmtpClient();

            string UserName = "";
            string Password = "";

            //if (dtblUser.Rows[0]["Mail_Send"].ToString() == "True")
            //{
            //vMailFm = "",

            if (dsgetEid.Tables[0].Rows[0]["Con_Email"].ToString() != "" && dsgetEid.Tables[0].Rows[0]["Password"].ToString() != "")
            {
                UserName = dsgetEid.Tables[0].Rows[0]["Con_Email"].ToString();
                Password = dsgetEid.Tables[0].Rows[0]["Password"].ToString();
            }
            /*else
            {
                UserName = CurrentUser.UserEmail;
                Password = CurrentUser.UserMailPassword;
            }*/

            vSmpt.UseDefaultCredentials = false;
            vSmpt.Timeout = 800000;

            System.Net.NetworkCredential SmtpUser = new System.Net.NetworkCredential(UserName, Password);

            if (UserName != "" && Password != "")
            {
                if (dtblUser.Tables[0].Rows[0]["Host"].ToString() == "")
                {
                    // lblmsg.Text = "Email credentials have missing Host detail.";
                }
                else
                {
                    vSmpt.Host = dsgetEid.Tables[0].Rows[0]["Host"].ToString();
                }

                //vSmpt.Host = dtblUser.Rows[0]["User_Host"].ToString();
                if (dsgetEid.Tables[0].Rows[0]["Port"].ToString() == "0")
                {
                    //lblmsg.Text = "Email credentials have missing Port detail.";
                }
                else
                {
                    vSmpt.Port = Convert.ToInt32(dsgetEid.Tables[0].Rows[0]["Port"].ToString());
                }

                //vSmpt.Port = Convert.ToInt32(dtblUser.Rows[0]["User_Port"].ToString());
                if (dsgetEid.Tables[0].Rows[0]["ssl"].ToString() == "")
                {
                   // lblmsg.Text = "Email credentials have missing SSL detail.";
                }
                else
                {
                    if (dsgetEid.Tables[0].Rows[0]["ssl"].ToString() == "0")
                    {
                        vSmpt.EnableSsl = true;
                    }
                    if (dsgetEid.Tables[0].Rows[0]["ssl"].ToString() == "1")
                    {
                        vSmpt.EnableSsl = false;
                    }
                }
            }
                /*
                vSmpt.Host = dsgetEid.Tables[0].Rows[0]["Host"].ToString();
                vSmpt.Port = Convert.ToInt32(dsgetEid.Tables[0].Rows[0]["Port"].ToString());


                if (dsgetEid.Tables[0].Rows[0]["ssl"].ToString() == "0")
                {
                    vSmpt.EnableSsl = false;
                }
                if (dsgetEid.Tables[0].Rows[0]["ssl"].ToString() == "1")
                {
                    vSmpt.EnableSsl = true;
                }
                */

                vSmpt.Credentials = SmtpUser;
            //  Application.DoEvents();
            vSmpt.Send(vMail);
            Response.Write("<script>Mail has been sent successfully.</script>;");
        }

        catch (Exception ex)
        {
            Response.Write("There is some problem to send Email");
            Response.Write(ex.Message + " actual issue");

        }
    }



    public void RPT_Sub(Int64 QuotationID)//if revised...//, string Code, Boolean _IsList)
    {
        DataSet dt = new DataSet();
        // LogoBind(dt);

        //mpdfFile =CurrentUser.DocumentPath + @"pdf\Quotation.pdf";
        mpdfFile = Server.MapPath(@"\pdf\QuotationTAX.pdf");

        DataTable dtReport = new DataTable();
        List<ParaList> para1 = new List<ParaList>()
        {
        new ParaList {Key="@i_RecID",Value= QuotationID.ToString() },
        new ParaList {Key="@i_CompId",Value= CurrentUser.CompId.ToString() },
        };

        dt = crmclient.Select(para1, "rpt_Quotation");

        List<ParaList> para2 = new List<ParaList>()
        {
        new ParaList {Key="@i_RecID",Value= QuotationID.ToString() },
        new ParaList {Key="@i_TNC_Sub",Value= "Quotation" },
         new ParaList {Key="@i_CompId",Value= CurrentUser.CompId.ToString() },
        };

        dsTNC = crmclient.Select(para2, "rpt_Quotation_TNC");

        ReportDocument crystalReport = new ReportDocument();
        crystalReport.Load(Server.MapPath(@"~/Reports/rptQuotationTAX.rpt"));


        crystalReport.Database.Tables[0].SetDataSource(dt.Tables[0]);
        crystalReport.Database.Tables[1].SetDataSource(dsTNC.Tables[0]);

        CurrentCompany.AddReportParameters(crystalReport, dt, true, "", false, false, false, false, false);

        ExportOptions CrExportOptions;
        DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
        PdfRtfWordFormatOptions CrFormatTypeOptions = new PdfRtfWordFormatOptions();
        CrDiskFileDestinationOptions.DiskFileName = mpdfFile;
        CrExportOptions = crystalReport.ExportOptions;//Report document  object has to be given here
        CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
        CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
        CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
        CrExportOptions.FormatOptions = CrFormatTypeOptions;
        // crystalReport.load();


        //if (File.Exists(Server.MapPath(@"Reports\rptQuotationTAX.rpt")))
        //{

        //if (System.IO.File.Exists(CurrentUser.ReportPath + "rptQuotationtax.rpt"))
        //{

        //ReportDocument rptDoc = new ReportDocument();
        //rptDoc.Load(Server.MapPath(@"~/Reports/rptQuotationTAX.rpt"));

        //rptDoc.Database.Tables[0].SetDataSource(dtReport);
        //rptDoc.Subreports[0].Database.Tables[0].SetDataSource(dtTNC);
        //rptDoc.Refresh();

    }

    protected void GVTNC_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (Session["QMode"] != null)
        {
            if (Session["QMode"].ToString() == "Revised" || Session["QMode"].ToString() == "Edit")
            { 
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                CheckBox chktnc = (CheckBox)e.Row.FindControl("chkselect");

                List<ParaList> paraTNC = new List<ParaList>()
            {
                new ParaList {Key="@i_Code", Value= ViewState["CodeForRevised"].ToString() },
                new ParaList {Key="@i_CompId", Value= CurrentUser.CompId },

            };

                DataSet dstnc = new DataSet();
                dstnc = crmclient.Select(paraTNC, "QuotationTNC");

                int i = dstnc.Tables[0].Rows.Count;
                for (int j = 0; j < i; j++)
                {
                    if (chktnc.Text == dstnc.Tables[0].Rows[j]["TNCID"].ToString())
                    {
                        chktnc.Checked = true;
                    }
                }

            }
        }
        }
        //---If Qutation is in Editmode

     
       
    }

    public void RemoveSession()
    {
        Session.Remove("QMode");
        Session.Remove("griddoc");
        Session.Remove("QDTitem");
        Session.Remove("FileName");
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {

        DeleteItemfromTEmp();
        RemoveSession();
        Response.Redirect("../Quotation/QuotationList.aspx");
    }

    protected void txtEQnty_TextChanged(object sender, EventArgs e)
    {

       

        int RowIndex = ((GridViewRow)((TextBox)sender).NamingContainer).RowIndex;
        // GridViewRow rw = (GridViewRow)GvIQitem.Rows[];
        CalculateEditAmount(RowIndex);
    }
}