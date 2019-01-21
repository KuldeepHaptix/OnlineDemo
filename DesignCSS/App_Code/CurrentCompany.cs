using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.Reporting.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.ReportSource;

/// <summary>
/// Summary description for CurrentCompany
/// </summary>
public class CurrentCompany
{

    #region Private Properties

    private static string _name;
    private static string _Address1;
    private static string _Address2;
    private static string _City;
    private static string _Phone;
    private static string _Email;
    
    #endregion

    #region Public Properties

    public static string Name
    {
        get
        { return _name; }
        set
        { _name = value; }
    }
    public static string Address1
    {
        get
        { return _Address1; }
        set
        { _Address1 = value; }
    }
    public static string Address2
    {
        get
        { return _Address2; }
        set
        { _Address2 = value; }
    }

    public static string City
    {
        get
        { return _Address2; }
        set
        { _Address2 = value; }
    }

    public static string Phone
    {
        get
        { return _City; }
        set
        { _City = value; }
    }

    public static string Email
    {
        get
        { return _Email; }
        set
        { _Email = value; }
    }

    #endregion

    public static void AddReportParameters(CrystalDecisions.CrystalReports.Engine.ReportDocument rpt, DataSet dt, bool CompanyName, string ReportName, bool Address1, bool Address2, bool City, bool phone, bool Email)
    {
        rpt.SetDataSource(dt);
        if (CompanyName == true)
        {
            rpt.SetParameterValue("pCompanyName", CurrentUser.Name);
        }
        if (ReportName != "")
        {
            rpt.SetParameterValue("pReportName", ReportName);
        }
        if (Address1 == true)
        {
            rpt.SetParameterValue("pAddress1", CurrentCompany.Address1);
        }
        if (Address2 == true)
        {
            rpt.SetParameterValue("pAddress2", CurrentCompany.Address2);
        }
        if (City == true)
        {
            rpt.SetParameterValue("pCity", CurrentCompany.City);
        }
        //if (State == true)
        //{
        //    rpt.SetParameterValue("pState", "");
        //}
        //if (PinCode == true)
        //{
        //    rpt.SetParameterValue("pPinCode", CurrentCompany.Pincode);
        //}
        if (phone == true)
        {
            rpt.SetParameterValue("pPhone", CurrentCompany.Phone);
        }
        //if (Phone2 == true)
        //{
        //    rpt.SetParameterValue("pPhone2", CurrentCompany.Phone2);
        //}
        //if (Fax == true)
        //{
        //    rpt.SetParameterValue("pFax", CurrentCompany.Fax);
        //}
        if (Email == true)
        {
            rpt.SetParameterValue("pEmail", CurrentCompany.Email);
        }


    }
}
