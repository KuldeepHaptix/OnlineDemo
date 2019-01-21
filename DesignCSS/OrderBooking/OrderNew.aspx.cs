using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;


public partial class OrderBooking_OrderNew : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataRow dtrow;
    DataRow dtitemrow;
    string _QuotationID = string.Empty;
    decimal FinalAMount = 0.00m;
    decimal _sgst = 0;
    decimal _cgst = 0;
    decimal _igst = 0;
    string XMLString = string.Empty;
    int Cnt = 0;
    static DataTable dtDocList1 = new DataTable();
    DataTable dtDispatch = new DataTable();
    decimal finalNetAmount = 0.00m;
    decimal FinalSgstAmt = 0.00m;
    decimal FinalCgstAmt = 0.00m;
    decimal FinalIgstAmt = 0.00m;
    decimal DiscountAmt = 0.00m;
    decimal FinalTotalamount = 0.00m;
    static int count=0;
    string OrderID;
    string[] Code = new string[4];

    protected void Page_Load(object sender, EventArgs e)
    {
        lblAmount.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblSGST.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblIGST.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblCGST.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblDiscount.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblExtracharges.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblType1.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lbltype2.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4"); ;
        lblType3.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblNetAmount.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");
        lblPaidAmount.ForeColor = (Color)ColorTranslator.FromHtml("#b6b4b4");

        if (!IsPostBack)
        {
            dtDocList1.Columns.Clear();
            dtDocList1.Rows.Clear();
            dtDocList1.Columns.Add("QDocID");
            dtDocList1.Columns.Add("DocName");
            if (Session["OMode"] != null)
            {
                if (Session["OMode"].ToString() == "Edit")
                {
                    OrderID = Request.QueryString["QidEdit"];
                    // QidForRevised = Session["QEditID"].ToString();
                    Session["QEditID"] = OrderID;
                    bindforEdit();
                }
            }
            // DrpType.SelectedIndex = 0;
            AutoGenrateOrderNo("OD");
            bindCustomerDDL();
            bindItemGrid();
            bindEmployee();
            txtOrderDate.Text = DateTime.Now.ToShortDateString();
            DrpStatus.SelectedIndex = 3;
            txtDiscount.Text = "0.00";
            txtPaidAmount.Text = "0.00";
            txtType1Amt.Text= "0.00";
            txtType2Amt.Text = "0.00";
            txtType3Amt.Text = "0.00";
            count += count;
           RestoreSession();
        }

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



        drpAllocatedTo.DataValueField = "EmpID";
        drpAllocatedTo.DataTextField = "EmpName";


        dsApptaken = crmclient.FillDDL(para, "Employee");
        drpAllocatedTo.DataSource = dsApptaken.Tables[0];
        drpAllocatedTo.DataBind();
        drpAllocatedTo.Items.Insert(0, new ListItem("--Select--", "0"));

    }

    public void bindCustomerDDL()
    {
        DataSet ds = new DataSet();
        List<ParaList> Para = new List<ParaList>()
        {
            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
        };
        drpCustomername.Items.Insert(0, new ListItem("--Select--", "0"));
        ds = crmclient.LOV(Para, "Customer_Quotation");
        drpCustomername.DataValueField = "Code";
        drpCustomername.DataTextField = "CustomerName1";
        if (ds.Tables[0].Rows.Count > 0)
        {
            drpCustomername.DataSource = ds.Tables[0];

            drpCustomername.DataBind();
            drpCustomername.Items.Insert(0, new ListItem("--Select--", "0"));

            //Session["dsCustomer"] = ds.Tables[0];

        }

    }

    public void bindItemGrid()
    {
        if (Session["QuotationID"] != null)
        {
            List<ParaList> para = new List<ParaList>()
        {

            new ParaList {Key="@i_Qid", Value= Session["QuotationID"].ToString() },


        };

            DataSet dsitemlist = new DataSet();
            dsitemlist = crmclient.Select(para, "Temp_SalesQuotationDetail");
            if (dsitemlist.Tables[0].Rows.Count > 0)
            {
                GvItem.DataSource = dsitemlist;
                GvItem.DataBind();
            }
            else
            {
                GvItem.DataSource = ReturnEmptyRow();
                GvItem.DataBind();
            }
            if (Session["EditMode"] != null)
            {
                if (Session["EditMode"].ToString()== "True")
                {
                    // calculateFinal_Amount();
                }
                else
                {
                    calculateFinal_Amount();
                }
            }
            else
            {
                calculateFinal_Amount();
            }
        }

        else
        {
            GvItem.DataSource = ReturnEmptyRow();
            GvItem.DataBind();
        }
        //GvItem.DataSource = ReturnEmptyRow();
        //GvItem.DataBind();
    }

    protected void bindforEdit()
    {

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

    protected void datepicker_SelectionChanged(object sender, EventArgs e)
    {
        txtChequeDate.Focus();
        txtChequeDate.Text = datepicker.SelectedDate.ToLongDateString();
        datepicker.Visible = false;
    }

    protected void lnkChequeDate_Click1(object sender, EventArgs e)
    {
        txtChequeDate.Focus();
        if (datepicker.Visible == true)
        {
            datepicker.Visible = false;
        }
        else
        {
            datepicker.Visible = true;
        }
    }

    protected void btnDispatch_Click(object sender, EventArgs e)
    {
        SessionBind();
        Response.Redirect("../OrderBooking/DispatchDetail.aspx");
    }

    protected void drpCustomername_SelectedIndexChanged(object sender, EventArgs e)
    {
        //DataTable dtCustDetail = new DataTable();
        //dtCustDetail = (DataTable)Session["dsCustomer"];

        //txtAddress.Text=dtCustDetail.Rows[0][0]

        List<ParaList> para1 = new List<ParaList>()
        {
            new ParaList {Key="@i_mode", Value="Delete" },
        };
        crmclient.Delete(para1, "Temp_SalesQuotationDetailAll");

        string custid = drpCustomername.SelectedValue;
        string custname = drpCustomername.SelectedItem.Text;
        DataSet ds = new DataSet();
        //string[] Code = new string[4];
        Code = drpCustomername.SelectedItem.Text.Split('/');

        List<ParaList> para = new List<ParaList>()
        {
            new ParaList {Key="@i_CustomerCode", Value=Code[0].ToString()},

            new ParaList {Key="@i_CompId", Value=CurrentUser.CompId }
        };
        ds = crmclient.Select(para, "Sale_Customer_LOV");  //geting all information of selected lead or customer
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtAddress.Text = ds.Tables[0].Rows[0]["Address"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["EMAIL"].ToString();
            txtMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
            
            drpApptaken.SelectedValue= ds.Tables[0].Rows[0]["AllocatedToEmpID"].ToString();
            drpAllocatedTo.SelectedValue= ds.Tables[0].Rows[0]["AllocatedToEmpID"].ToString();
            _QuotationID= ds.Tables[0].Rows[0]["QuotationID"].ToString();
            Session["Qcode"]= ds.Tables[0].Rows[0]["Code"].ToString();
            Session["cntctPerson"]= ds.Tables[0].Rows[0]["ContactPerson"].ToString();


            if(drpCustomername.Text.Contains("INQ"))
            {
                Session["CustID"] = ds.Tables[0].Rows[0]["LeadId"].ToString();
            }
            if(drpCustomername.Text.Contains("QU"))
            {
                Session["CustID"] = ds.Tables[0].Rows[0]["QuotationID"].ToString();
            }
            Session["QuotationID"] = _QuotationID;
        }

        //----------------------Getting Item detail of Quotaion selected

        List<ParaList> paraItem = new List<ParaList>()
        {
            new ParaList {Key="@i_RecID", Value=_QuotationID.ToString()},
         };

        DataSet dsitemdetail = new DataSet();
        dsitemdetail = crmclient.Select(paraItem, "Sale_Quotation");
        int i = dsitemdetail.Tables[0].Rows.Count;
       
        for (int j = 0; j < i; j++)
        {
            List<ParaList> paratemp = new List<ParaList>()

            {
            
                     new ParaList {Key="@i_OrderNo",Value=txtOrderNo.Text },
                     new ParaList {Key="@i_Code", Value=dsitemdetail.Tables[0].Rows[j]["Code"].ToString() },
                     new ParaList {Key="@i_ItemId", Value=dsitemdetail.Tables[0].Rows[j]["itemID"].ToString() },
                    new ParaList {Key="@i_ItemDesc", Value=dsitemdetail.Tables[0].Rows[j]["Specification"].ToString() },
                    new ParaList {Key="@i_Qnty", Value= dsitemdetail.Tables[0].Rows[j]["Qty"].ToString()},
                     new ParaList {Key="@i_Price", Value=dsitemdetail.Tables[0].Rows[j]["Rate"].ToString() },
                          new ParaList {Key="@i_Amount", Value=dsitemdetail.Tables[0].Rows[j]["TotalAmount"].ToString() },
                           new ParaList {Key="@i_UOM", Value=dsitemdetail.Tables[0].Rows[j]["CUOMID"].ToString() },
                        new ParaList {Key="@i_TaxclassId", Value=dsitemdetail.Tables[0].Rows[j]["TaxClassID"].ToString() },
                         new ParaList {Key="@i_NetAmount", Value=dsitemdetail.Tables[0].Rows[j]["NetAmount"].ToString() },
                          new ParaList {Key="@i_Discount", Value=dsitemdetail.Tables[0].Rows[j]["Discount"].ToString() },
                    new ParaList {Key="@i_GodownId", Value=dsitemdetail.Tables[0].Rows[j]["GodownID"].ToString() },
                    new ParaList {Key="@i_CurrencyID", Value= dsitemdetail.Tables[0].Rows[j]["CurrencyID"].ToString()},
                    new ParaList {Key="@i_SGSTAmount", Value=dsitemdetail.Tables[0].Rows[j]["SGSTAmount"].ToString() },
                    new ParaList {Key="@i_CGSTAmount", Value=dsitemdetail.Tables[0].Rows[j]["CGSTAmount"].ToString() },
                    new ParaList {Key="@i_IGSTAmount", Value= dsitemdetail.Tables[0].Rows[j]["IGSTAmount"].ToString()},
                    new ParaList {Key="@i_ssiID", Value= dsitemdetail.Tables[0].Rows[j]["QuotationId"].ToString()},

       };
            

            
            crmclient.Insert(paratemp, "Temp_SalesQuotationDetail");
        }

        bindItemGrid();
       // List<ParaList> paraItem = new List<ParaList>()
       //{
       //    new ParaList {Key="@i_RecID", Value=_QuotationID.ToString()},
       // };

       // DataSet dsitemdetail = new DataSet();
       // dsitemdetail = crmclient.Select(paraItem.ToArray(), "Sale_Quotation");
       // if(dsitemdetail.Tables[0].Rows.Count>0)
       // {
       //     GvItem.DataSource = dsitemdetail.Tables[0];
       //     GvItem.DataBind();
       // }
       

    }

    protected void SessionBind()
    {
        //if (DrpType.Text != "")
        //{
        //    Session["type"] = DrpType.SelectedItem.Text;
        //}
        if (txtOrderNo.Text != "")
        {
            Session["OrderNo"] = txtOrderNo.Text;
        }
        if (txtInvoiceNo.Text != "")
        {
            Session["YourInvoice"] = txtInvoiceNo.Text;
        }
        if (drpAllocatedTo.Text != "")
        {
            Session["Allocatedto"] = drpAllocatedTo.SelectedValue;
        }
        if (drpApptaken.Text != "")
        {
            Session["Apptaken"] = drpApptaken.SelectedValue;
        }
       if (drpCustomername.Text != "")
       {
           Session["Cstomer"] = drpCustomername.SelectedValue;
        }
        if (txtAddress.Text != "")
        {
            Session["Address"] = txtAddress.Text;
        }
        if (txtEmail.Text != "")
        {
            Session["Email"] = txtEmail.Text;
        }
        if (txtMobile.Text != "")
        {
            Session["Mobile"] = txtMobile.Text;
        }
        if (txtNarration.Text != "")
        {
            Session["Narration"] = txtNarration.Text;
        }
        if (DrpStatus.Text != "")
        {
            Session["Status"] = DrpStatus.SelectedValue;
        }
        if (txtchalanNo.Text != "")
        {
            Session["chalanNo"] = txtchalanNo.Text;
        }
        if (DrpPaymentMode.Text != "")
        {
            Session["paymentMode"] = DrpPaymentMode.SelectedItem.Text;
        }
        if (txtBankIN.Text != "")
        {
            Session["BankIn"] = txtBankIN.Text;
        }
        if (txtBankOUT.Text != "")
        {
            Session["BankOut"] = txtBankOUT.Text;
        }
        if (txtChequeNo.Text != "")
        {
            Session["chequeNo"] = txtChequeNo.Text;
        }
        if (txtChequeDate.Text != "")
        {
            Session["chequeDate"] = txtChequeDate.Text;
        }
        if (txtDueDays.Text != "")
        {
            Session["Duedays"] = txtDueDays.Text;
        }
        if (txtRecDays.Text != "")
        {
            Session["recdays"] = txtRecDays.Text;
        }
    }

    protected void RestoreSession()
    {
    //    if(Session["type"] !=null)
    //    {
    //        DrpType.SelectedItem.Text = Session["type"].ToString();
    //    }
        if (Session["OrderNo"] != null)
        {
            txtOrderNo.Text = Session["OrderNo"].ToString();
        }
        if (Session["YourInvoice"] != null)
        {
            txtInvoiceNo.Text = Session["YourInvoice"].ToString();
        }
        if (Session["Allocatedto"] != null)
        {
            drpAllocatedTo.SelectedValue = Session["Allocatedto"].ToString();
        }
        if (Session["Apptaken"] != null)
        {
           drpApptaken.SelectedValue = Session["Apptaken"].ToString();
        }
       if (Session["Cstomer"] !=null)
       {
             drpCustomername.SelectedValue= Session["Cstomer"].ToString();
       }
        if (Session["Address"] != null)
        {
            txtAddress.Text = Session["Address"].ToString();
        }
        if (Session["Email"] != null)
        {
           txtEmail.Text= Session["Email"].ToString();
        }
        if (Session["Mobile"] != null)
        {
            txtMobile.Text= Session["Mobile"].ToString();
        }
        if (Session["Narration"] != null)
        {
             txtNarration.Text= Session["Narration"].ToString();
        }
        if (DrpStatus.Text !=null)
        {
            Session["Status"] = DrpStatus.SelectedValue;
        }
        if (Session["chalanNo"] != null)
        {
           txtchalanNo.Text = Session["chalanNo"].ToString();
        }
        if (Session["paymentMode"] !=null)
        {
             DrpPaymentMode.SelectedItem.Text= Session["paymentMode"].ToString();
        }
        if (Session["BankIn"] != null)
        {
           txtBankIN.Text= Session["BankIn"].ToString();
        }
        if (Session["BankOut"] !=null)
        {
            txtBankOUT.Text= Session["BankOut"].ToString();
        }
        if (Session["chequeNo"] != null)
        {
            txtChequeNo.Text= Session["chequeNo"].ToString();
        }
        if (Session["chequeDate"] != null)
        {
             txtChequeDate.Text= Session["chequeDate"].ToString();
        }
        if (Session["Duedays"] !=null)
        {
            txtDueDays.Text= Session["Duedays"].ToString();
        }
        if (Session["recdays"] != null)
        {
            txtRecDays.Text = Session["recdays"].ToString();
        }
    }
    public void calculateFinal_Amount()
    {
        if (GvItem.Rows.Count >= 0)
        {
            for (int i = 0; i < GvItem.Rows.Count; i++)
            {

               // string amount = (GvItem.Rows[i].FindControl("lblAmount") as Label).Text;
                string netAmount = (GvItem.Rows[i].FindControl("lblNetamount") as Label).Text;
                string TotalAmount= (GvItem.Rows[i].FindControl("lblAmount") as Label).Text;
                string SgstAmt= (GvItem.Rows[i].FindControl("lblSGST") as Label).Text;
                string CgstAmt = (GvItem.Rows[i].FindControl("lblCGST") as Label).Text;
                string IgstAmt = (GvItem.Rows[i].FindControl("lblIGST") as Label).Text;
                

                if (netAmount != "")
                {
                    // FinalAMount += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblAmount") as Label).Text);
                    FinalTotalamount += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblAmount") as Label).Text);
                    finalNetAmount += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblNetamount") as Label).Text);
                    FinalSgstAmt += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblSGST") as Label).Text);
                    FinalCgstAmt += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblCGST") as Label).Text);

                    FinalIgstAmt += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblIGST") as Label).Text);
                    DiscountAmt += Convert.ToDecimal((GvItem.Rows[i].FindControl("lblAmount") as Label).Text) - Convert.ToDecimal((GvItem.Rows[i].FindControl("lblNetamount") as Label).Text);
                }
            }
            //txtAmount.Text = FinalAMount.ToString();
            txtDiscount.Text = DiscountAmt.ToString();

            txtAmount.Text = FinalTotalamount.ToString();
            txtNetAmount.Text = finalNetAmount.ToString();
            txtSGST.Text = FinalSgstAmt.ToString();

            txtCGST.Text = FinalCgstAmt.ToString();
            txtIGST.Text = FinalIgstAmt.ToString();

        }
    }

    //protected void DrpType_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (DrpType.SelectedIndex == 1)
    //    {
    //        txtOrderNo.Text = AutoGenrateOrderNo("RI");
    //        //txtCustInvoiceNo.Text = objCommon.AutoNumber("RI");
    //    }
    //    else if (DrpType.SelectedIndex == 2)
    //    {

    //        txtOrderNo.Text = AutoGenrateOrderNo("TI");
    //    }
    //    else if (DrpType.SelectedIndex == 3)
    //    {
         
    //        txtOrderNo.Text = AutoGenrateOrderNo("ES");
    //    }
    //    else if(DrpType.SelectedIndex == 0)
    //    {
    //        txtOrderNo.Text = "";
    //    }
    //}

    public string AutoGenrateOrderNo(string module)
    {
        DataSet dscode = new DataSet();



        List<ParaList> para = new List<ParaList>()
        {

            new ParaList { Key="@i_Module", Value="OD"},
            new ParaList { Key="@i_YearCode", Value=""},
            new ParaList {Key="@i_FYID", Value="1" },
            new ParaList {Key="@i_CompId",Value=CurrentUser.CompId },
        };
        dscode = crmclient.list(para, "Automatic_Number");
        string code = dscode.Tables[0].Rows[0][0].ToString();
        txtOrderNo.Text= dscode.Tables[0].Rows[0][0].ToString();
        return code;
    }

    protected void GvItem_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (GvItem.Rows.Count < 0)
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
    }
    public void DtdispatchAddcolumn()
    {
        dtDispatch.Columns.Add("BoNo");
        dtDispatch.Columns.Add("BoDate");
        dtDispatch.Columns.Add("DeNote");
        dtDispatch.Columns.Add("DeDate");
        dtDispatch.Columns.Add("SurefNo");
        dtDispatch.Columns.Add("Destination");
        dtDispatch.Columns.Add("DispDocNum");
        dtDispatch.Columns.Add("DTVNo");
        dtDispatch.Columns.Add("DTofInvoice");
        dtDispatch.Columns.Add("DTofRemovalOfGood");
        dtDispatch.Columns.Add("ShippingAdd");
        dtDispatch.Columns.Add("AlternateShA");


    }
    protected void DrpPaymentMode_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(DrpPaymentMode.SelectedIndex==2)
        {
            panelchequeno.Enabled = true;
            panelcheqdate.Enabled = true;
        }
        if (DrpPaymentMode.SelectedIndex == 1)
        {
            panelchequeno.Enabled = false;
            panelcheqdate.Enabled = false;
        }
        if (DrpPaymentMode.SelectedIndex == 0)
        {
            panelchequeno.Enabled = false;
            panelcheqdate.Enabled = false;
        }
    }

    protected void btnSubmitInq_Click(object sender, EventArgs e)
    {
        List<ParaList> parafinalitem = new List<ParaList>()
        {
            new ParaList {Key="@i_Qid", Value=Session["QuotationID"].ToString() },


        };

        DataSet dsFinalItem = new DataSet();
        dsFinalItem = crmclient.Select(parafinalitem, "Temp_SalesQuotationDetail");
        if (dsFinalItem.Tables[0].Rows.Count > 0)
        {
            //-----ITEM XMLSTRING----------------
            //int Cnt = 0;
            //if (Session["QDTItem"] != null)
            //{


            //dtqitem = (DataTable)Session["QDTItem"];
            XMLString = "<NewDataSet>";


            for (int i = 0; i < GvItem.Rows.Count; i++)
            {
                XMLString = XMLString + "<Table>";
                XMLString = XMLString + "<OrderNo>" + txtOrderNo.Text + "</OrderNo>";

                XMLString = XMLString + "<ItemId>" + dsFinalItem.Tables[0].Rows[i]["ItemID"].ToString() + "</ItemId>";
                XMLString = XMLString + "<CurrencyID>" + dsFinalItem.Tables[0].Rows[i]["CurrID"] + "</CurrencyID>";
                XMLString = XMLString + "<GodownID>" + "1" + "</GodownID>";
                XMLString = XMLString + "<ItemDesc>" + dsFinalItem.Tables[0].Rows[i]["Specification"].ToString() + "</ItemDesc>";
                //XMLString = XMLString + "<Name>" + dtqitem.Rows[i]["Name"].ToString() + "</Name>";

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

                



                Cnt = Cnt + 1;
            }
            XMLString = XMLString + "</NewDataSet>";
        }

        //------------inserting document-----------

        int CntImg = 0;
        string XMLStringDoc = string.Empty;
        XMLStringDoc = "<NewDataSet>";
        for (int i = 0; i < GVAttachment.Rows.Count; i++)
        {
            if (GVAttachment.Rows[i].Cells[0].ToString() != null)
            {
                XMLStringDoc = XMLStringDoc + "<Table>";
                //XMLStringImg = XMLStringImg + "<DocName>" + GVAttachment.Rows[i].Cells[0].Text+ "</DocName>";

                XMLStringDoc = XMLStringDoc + "<FileName>" + dtDocList1.Rows[i]["DocName"].ToString() + "</FileName>";
                XMLStringDoc = XMLStringDoc + "<SaleID>" + Session["QuotationID"].ToString() + "</SaleID>";

                XMLStringDoc = XMLStringDoc + "</Table> ";
                //CntImg++;
                CntImg = CntImg + 1;
            }
        }
        XMLStringDoc = XMLStringDoc + "</NewDataSet>";

        List<ParaList> paraDoc = new List<ParaList>()
        {
            new ParaList {Key="@i_CntImg", Value=CntImg.ToString() },
            new ParaList {Key="@i_XMLStringImg", Value=XMLStringDoc.ToString() },
        };
        crmclient.Insert(paraDoc, "SaleDocList");
        //---end doc insert---------

        List<ParaList> paraInsert = new List<ParaList>()
        {
            new ParaList {Key="@i_SalesCode", Value=txtOrderNo.Text },
             new ParaList {Key="@i_SalesDate", Value=txtOrderDate.Text },
             new ParaList {Key="@i_CustomerID", Value="0" },
             new ParaList {Key="@i_IsCustomer", Value="1" },
             new ParaList {Key="@i_Conprsn", Value=Session["cntctPerson"].ToString()},
             new ParaList {Key="@i_email1", Value=txtEmail.Text },
             new ParaList {Key="@i_Mobile", Value=txtMobile.Text },
              new ParaList {Key="@i_Narration", Value= txtNarration.Text},
              new ParaList {Key="@i_DueDays", Value=txtDueDays.Text },
               new ParaList {Key="@i_RecDay", Value=txtRecDays.Text },
               new ParaList {Key="@i_TotalAmount", Value=txtAmount.Text },
                 new ParaList {Key="@i_NetAmount", Value=txtNetAmount.Text },
                  new ParaList {Key="@i_Discount", Value=txtDiscount.Text },
                  new ParaList {Key="@i_PaidAmount", Value=txtPaidAmount.Text },
                  new ParaList {Key="@i_SGSTAmount", Value=txtSGST.Text },
                  new ParaList {Key="@i_CGSTAmount", Value=txtCGST.Text },
                  new ParaList {Key="@i_IGSTAmount", Value=txtIGST.Text },

                   new ParaList {Key="@i_apptaken", Value=drpApptaken.SelectedValue },
                  new ParaList {Key="@i_allocated", Value=drpAllocatedTo.SelectedValue },
                  new ParaList {Key="@i_Type", Value="Order" },
                    new ParaList {Key="@i_CC", Value=txtCC.Text },
                  new ParaList {Key="@i_BCC", Value=txtBCC.Text },
                  new ParaList {Key="@i_CustInvoiceNo", Value=txtInvoiceNo.Text },
                     new ParaList {Key="@i_XMLString", Value=XMLString },
                  new ParaList {Key="@i_Cnt", Value=Cnt.ToString() },
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId },
                   // new ParaList {Key="@i_Qid", Value=Session["QuotationID"].ToString() },
                    };
                        
                if(drpCustomername.Text.Contains("INQ"))
                 {
                    paraInsert.Add(new ParaList { Key = "@i_inqid", Value = Session["CustID"].ToString() });
                    paraInsert.Add(new ParaList { Key = "@i_Qid", Value = "0"});
                 }
                else if(drpCustomername.Text.Contains("QU"))
                {
                    paraInsert.Add(new ParaList { Key = "@i_Qid", Value = Session["CustID"].ToString() });
                    paraInsert.Add(new ParaList { Key = "@i_inqid", Value = "0" });
                }

        if (Session["DispatchDetail"] != null)
        {
            DtdispatchAddcolumn();
            dtDispatch = (DataTable)Session["DispatchDetail"];
            
            paraInsert.Add(new ParaList { Key = "@i_ShippingAdd", Value = dtDispatch.Rows[0]["ShippingAdd"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_BONo", Value = dtDispatch.Rows[0]["BoNo"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_BODate", Value = dtDispatch.Rows[0]["BoDate"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_DNote", Value = dtDispatch.Rows[0]["DeNote"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_DNoteDate", Value = dtDispatch.Rows[0]["DeDate"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_SuRNo", Value = dtDispatch.Rows[0]["SurefNo"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_DDNo", Value = dtDispatch.Rows[0]["DispDocNum"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_DT", Value = dtDispatch.Rows[0]["DTVNo"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_D", Value = dtDispatch.Rows[0]["DTVNo"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_DtI", Value = dtDispatch.Rows[0]["DTofInvoice"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_TI", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_DtR", Value = dtDispatch.Rows[0]["DTofRemovalOfGood"].ToString() });
            paraInsert.Add(new ParaList { Key = "@i_TR", Value = "" });

           }
        else
        {
            paraInsert.Add(new ParaList { Key = "@i_ShippingAdd", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_BONo", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_BODate", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_DNote", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_DNoteDate", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_SuRNo", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_DDNo", Value = ""});
            paraInsert.Add(new ParaList { Key = "@i_DT", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_D", Value = ""});
            paraInsert.Add(new ParaList { Key = "@i_DtI", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_TI", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_DtR", Value = "" });
            paraInsert.Add(new ParaList { Key = "@i_TR", Value = "" });
        }

                crmclient.Insert(paraInsert, "SalesInvoice1");
                Response.Redirect("../OrderBooking/OrderBookingList.aspx");
    }

    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddNew")
        {
            DropDownList Itemname = (DropDownList)GvItem.FooterRow.FindControl("drpFItemName");
            TextBox Qnty = (TextBox)GvItem.FooterRow.FindControl("txtFQnty");

            TextBox Rate = (TextBox)GvItem.FooterRow.FindControl("txtFRate");
            DropDownList Curency = (DropDownList)GvItem.FooterRow.FindControl("drpFcurrency");
            TextBox Amount = (TextBox)GvItem.FooterRow.FindControl("txtFAmount");
            TextBox Discount = (TextBox)GvItem.FooterRow.FindControl("txtFDiscount");
            TextBox Netamount = (TextBox)GvItem.FooterRow.FindControl("txtFNetAmount");
            DropDownList taxclass = (DropDownList)GvItem.FooterRow.FindControl("drpFTaxClass");
            DropDownList drpUOM = (DropDownList)GvItem.FooterRow.FindControl("drpFUom");
            TextBox Sgst = (TextBox)GvItem.FooterRow.FindControl("txtFsgst");
            TextBox Cgst = (TextBox)GvItem.FooterRow.FindControl("txtFcgst");
            TextBox igst = (TextBox)GvItem.FooterRow.FindControl("txtFigst");
            TextBox Desc = (TextBox)GvItem.FooterRow.FindControl("txtFdescription");


            List<ParaList> para = new List<ParaList>()
            {
                new ParaList {Key="@i_OrderNo", Value=txtOrderNo.Text },
                new ParaList {Key="@i_Code", Value="" },//Session["Qcode"].ToString()
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
                    new ParaList {Key="@i_ssiID", Value= _QuotationID},

            };
            crmclient.Insert(para, "Temp_SalesQuotationDetail");
            Session.Remove("griddoc");
            dtDocList1.Rows.Clear();
            bindItemGrid();
        }
        }

    protected void txtFDiscount_TextChanged(object sender, EventArgs e)
    {

        TextBox Amount = ((TextBox)GvItem.FooterRow.FindControl("txtFAmount"));
        TextBox Qnty = ((TextBox)GvItem.FooterRow.FindControl("txtFQnty"));
        TextBox Price = ((TextBox)GvItem.FooterRow.FindControl("txtFRate"));
        TextBox Discount = ((TextBox)GvItem.FooterRow.FindControl("txtFDiscount"));
        TextBox NetAmount = ((TextBox)GvItem.FooterRow.FindControl("txtFNetAmount"));
        TextBox sgst = ((TextBox)GvItem.FooterRow.FindControl("txtFsgst"));
        TextBox cgst = ((TextBox)GvItem.FooterRow.FindControl("txtFcgst"));
        TextBox igst = ((TextBox)GvItem.FooterRow.FindControl("txtFigst"));

        decimal s = Convert.ToDecimal(sgst.Text);
        decimal c = Convert.ToDecimal(cgst.Text);
        decimal i = Convert.ToDecimal(igst.Text);
        //Amount.Text = (Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100)).ToString();
        decimal total = (Convert.ToDecimal(Amount.Text) - ((Convert.ToDecimal(Amount.Text) * Convert.ToDecimal(Discount.Text)) / 100));
        //decimal total = Convert.ToDecimal(Amount.Text);
        NetAmount.Text = (total + s + c + i).ToString();
        txtNetAmount.Text = NetAmount.Text;
        //txtAmount.Text = Amount.Text;
    }

    protected void drpFItemName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList drpItemName = (DropDownList)GvItem.FooterRow.FindControl("drpFItemName");
        TextBox txtPrice = (TextBox)GvItem.FooterRow.FindControl("txtFRate");
        DropDownList drpuom = (DropDownList)GvItem.FooterRow.FindControl("drpFUom");
        TextBox txtItemID = (TextBox)GvItem.FooterRow.FindControl("txtFid");



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

    protected void drpFTaxClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dstaxrate = new DataSet();
        DropDownList drptaxclass = (DropDownList)GvItem.FooterRow.FindControl("drpFTaxClass");
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
        catch (Exception exc)
        {
            throw exc;
        }
    }

    public void CalculateAmount()
    {
        GridViewRow row = GvItem.FooterRow;
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

    protected void txtFQnty_TextChanged(object sender, EventArgs e)
    {
        CalculateAmount();
    }

    protected void CalculateExtraCharges()

    {
        decimal type1 = Convert.ToDecimal(txtType1Amt.Text);
        decimal type2 = Convert.ToDecimal(txtType2Amt.Text);
        decimal type3 = Convert.ToDecimal(txtType3Amt.Text);
        decimal NetAmount= Convert.ToDecimal(txtNetAmount.Text);
        txtNetAmount.Text = (type1 + type2 + type3 + NetAmount).ToString();

    }

    protected void GvItem_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "AddNew")
        {

            if (drpCustomername.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('First Select Customer')", true);

            }
            else
            {
                DropDownList Itemname = (DropDownList)GvItem.FooterRow.FindControl("drpFItemName");
                TextBox Qnty = (TextBox)GvItem.FooterRow.FindControl("txtFQnty");

                TextBox Rate = (TextBox)GvItem.FooterRow.FindControl("txtFRate");
                DropDownList Curency = (DropDownList)GvItem.FooterRow.FindControl("drpFcurrency");
                TextBox Amount = (TextBox)GvItem.FooterRow.FindControl("txtFAmount");
                TextBox Discount = (TextBox)GvItem.FooterRow.FindControl("txtFDiscount");
                TextBox Netamount = (TextBox)GvItem.FooterRow.FindControl("txtFNetAmount");
                DropDownList taxclass = (DropDownList)GvItem.FooterRow.FindControl("drpFTaxClass");
                DropDownList drpUOM = (DropDownList)GvItem.FooterRow.FindControl("drpFUom");
                TextBox Sgst = (TextBox)GvItem.FooterRow.FindControl("txtFsgst");
                TextBox Cgst = (TextBox)GvItem.FooterRow.FindControl("txtFcgst");
                TextBox igst = (TextBox)GvItem.FooterRow.FindControl("txtFigst");
                TextBox Desc = (TextBox)GvItem.FooterRow.FindControl("txtFdescription");


                List<ParaList> para = new List<ParaList>()
            {
                    new ParaList {Key="@i_OrderNo", Value=txtOrderNo.Text },
                new ParaList {Key="@i_Code", Value=Session["Qcode"].ToString() },//Session["Qcode"].ToString()
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
                    new ParaList {Key="@i_ssiID", Value= Session["QuotationID"].ToString()},

            };
                crmclient.Insert(para, "Temp_SalesQuotationDetail");

                bindItemGrid();
            }
        }
    }

    protected void txtType1Amt_TextChanged(object sender, EventArgs e)
    {
        CalculateExtraCharges();
    }

    protected void txtType2Amt_TextChanged(object sender, EventArgs e)
    {
        CalculateExtraCharges();
    }

    protected void txtType3Amt_TextChanged(object sender, EventArgs e)
    {
        CalculateExtraCharges();
    }

   

    protected void GvItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        long Id = Convert.ToInt32(GvItem.DataKeys[e.RowIndex].Value.ToString());

        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_RecID", Value = Id.ToString() },


        };

        crmclient.Delete(para, "Temp_SalesQuotationDetail");
        bindItemGrid();
        calculateFinal_Amount();
    }

    protected void btnFileUpload_Click(object sender, EventArgs e)
    {
        string fupFilename;
        try
        {
            if (OrderFileUpload.HasFile)
            {
                // R1 = DTres.NewRow();
                OrderFileUpload.SaveAs(Server.MapPath(@"~/QDoc/") + OrderFileUpload.FileName);
                DataRow dr = dtDocList1.NewRow();
                dr["QDocID"] = "0";
                dr["DocName"] = OrderFileUpload.FileName;
                fupFilename = OrderFileUpload.FileName;

                dtDocList1.Rows.Add(dr);

                if (dtDocList1 != null)
                {
                    if (dtDocList1.Rows.Count > 0)
                    {
                        GVAttachment.DataSource = dtDocList1;
                        GVAttachment.DataBind();
                    }
                }

                OrderFileUpload.Focus();
            }

            Session["griddoc"] = dtDocList1;
            Session["FileName"] = OrderFileUpload.FileName;
        }
        catch (Exception)
        {

            throw;
        }
    }



    public void CalculateEditAmount(int i)
    {

        //   GridViewRow rw = (GridViewRow)GvIQitem.Rows[e.RowIndex];



        TextBox Amount = GvItem.Rows[i].FindControl("txtEAmount") as TextBox;
        // string amnt = Amount.Text;
        TextBox Qnty = GvItem.Rows[i].FindControl("txtEQnty") as TextBox;
        TextBox Price = GvItem.Rows[i].FindControl("txtERate") as TextBox;
        TextBox Discount = GvItem.Rows[i].FindControl("txtEDiscount") as TextBox;
        TextBox NetAmount = GvItem.Rows[i].FindControl("txtENetAmount") as TextBox;
        TextBox sgst = GvItem.Rows[i].FindControl("txtEsgst") as TextBox;
        TextBox cgst = GvItem.Rows[i].FindControl("txtEcgst") as TextBox;
        TextBox igst = GvItem.Rows[i].FindControl("txtEigst") as TextBox;



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
   

    protected void GVAttachment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

        dtDocList1.Rows.RemoveAt(e.RowIndex);
        GVAttachment.DataSource = dtDocList1;
        GVAttachment.DataBind();
      
    }

    protected void GvItem_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["EditMode"] = "True";
        GvItem.EditIndex = e.NewEditIndex;
        bindItemGrid();
    }

    protected void GvItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int CrrId = Convert.ToInt32(GvItem.DataKeys[e.RowIndex].Value.ToString());
        DropDownList Itemname = (DropDownList)GvItem.Rows[e.RowIndex].FindControl("drpEItemName");
        TextBox Qnty = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEQnty");

        TextBox Rate = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtERate");
        DropDownList Curency = (DropDownList)GvItem.Rows[e.RowIndex].FindControl("drpEcurrency");
        TextBox Amount = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEAmount");
        TextBox Discount = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEDiscount");
        TextBox Netamount = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtENetAmount");
        DropDownList taxclass = (DropDownList)GvItem.Rows[e.RowIndex].FindControl("drpETaxClass");
        DropDownList drpUOM = (DropDownList)GvItem.Rows[e.RowIndex].FindControl("drpEUom");
        TextBox Sgst = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEsgst");
        TextBox Cgst = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEcgst");
        TextBox igst = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEigst");
        TextBox Desc = (TextBox)GvItem.Rows[e.RowIndex].FindControl("txtEdescription");

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
        crmclient.Update(para, "Temp_SalesQuotation");
        GvItem.EditIndex = -1;
        bindItemGrid();
    }

    protected void drpETaxClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet dstaxrate = new DataSet();
        DropDownList drptaxclass = (DropDownList)GvItem.FooterRow.FindControl("drpFTaxClass");
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

    protected void txtEDiscount_TextChanged(object sender, EventArgs e)
    {

        string Amount = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEAmount")).Text;
        string Qnty = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEQnty")).Text;

        string Price = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtERate")).Text;
        string Discount = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEDiscount")).Text;
        string NetAmount = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtENetAmount")).Text;

        string sgst = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEsgst")).Text;
        string cgst = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEcgst")).Text;
        string igst = ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEigst")).Text;


        //------------------


        decimal s = Convert.ToDecimal(sgst);
        decimal c = Convert.ToDecimal(cgst);
        decimal i = Convert.ToDecimal(igst);
        Amount = ((Convert.ToDecimal(Qnty)) * (Convert.ToDecimal(Price))).ToString();

        ((TextBox)GvItem.Rows[GvItem.EditIndex].FindControl("txtEAmount")).Text = (Convert.ToDecimal(Amount) - ((Convert.ToDecimal(Amount) * Convert.ToDecimal(Discount)) / 100)).ToString();

        // decimal total = Convert.ToDecimal(((TextBox)GvIQitem.Rows[GvIQitem.EditIndex].FindControl("txtEAmount")).Text);
        decimal total = Convert.ToDecimal(Amount);

        NetAmount = (total + s + c + i).ToString();
    }

    protected void txtEQnty_TextChanged(object sender, EventArgs e)
    {
        int RowIndex = ((GridViewRow)((TextBox)sender).NamingContainer).RowIndex;
        // GridViewRow rw = (GridViewRow)GvIQitem.Rows[];
        CalculateEditAmount(RowIndex);
    }
}