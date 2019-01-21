using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrystalDecisions.CrystalReports.Engine;
using System.Data;
/// <summary>
/// Summary description for CurrentCompany
/// </summary>
public class CurrentUser
{
    #region Private Properties

    private static string _name;
    private static string _UserId;
    private static string _ActivationStatus;
    private static string _CreatedDate;
    private static string _CreatedBy;
    private static string _ModifiedDate;
    private static string _CompId;
    private static string _BranchId;
    private static string _UserEmail;
    private static string _UserPwd;
    private static string _User_ssl;
    private static string _User_Port;
    private static string _User_Host;
    private static string _User_Mail_Password;
    private static string _TerritoryID;
    private static string _UserRole;
    private static string _UserActiveID;
    private static string _company;

    #endregion

    #region Public Properties

    public static string Name
    {
        get
        { return _name; }
        set
        { _name = value; }
    }

    public static string UserId
    {
        get
        { return _UserId; }
        set
        { _UserId = value; }
    }
    public static string ActivationStatus
    {
        get
        { return _ActivationStatus; }
        set
        { _ActivationStatus = value; }
    }


    public static string CreatedDate
    {
        get
        { return _CreatedDate; }
        set
        { _CreatedDate = value; }
    }

    public static string CreatedBy
    {
        get
        { return _CreatedBy; }
        set
        { _CreatedBy = value; }
    }
    public static string ModifiedDate
    {
        get
        { return _ModifiedDate; }
        set
        { _ModifiedDate = value; }
    }

    public static string CompId
    {
        get
        { return _CompId; }
        set
        { _CompId = value; }
    }
    public static string BranchId
    {
        get
        { return _BranchId; }
        set
        { _BranchId = value; }
    }

    public static string UserEmail
    {
        get
        { return _UserEmail; }
        set
        { _UserEmail = value; }
    }

    public static string UserPwd
    {
        get
        { return _UserPwd; }
        set
        { _UserPwd = value; }
    }

    public static string User_ssl
    {
        get
        { return _User_ssl; }
        set
        { _User_ssl = value; }
    }


    public static string User_port
    {
        get
        { return _User_Port; }
        set
        { _User_Port = value; }
    }

    public static string User_host
    {
        get
        { return _User_Host; }
        set
        { _User_Host = value; }
    }

    public static string UserMailPassword
    {
        get
        { return _User_Mail_Password; }
        set
        { _User_Mail_Password = value; }
    }

    public static string TerritoryId
    {
        get
        { return _TerritoryID; }
        set
        { _TerritoryID = value; }
    }

    public static string UserRole
    {
        get
        { return _UserRole; }
        set
        { _UserRole = value; }
    }

    public static string UserActivationId
    {
        get
        { return _UserActiveID; }
        set
        { _UserActiveID = value; }
    }

    public static string company
    {
        get
        { return _company; }
        set
        { _company = value; }
    }

    #endregion


    #region "Public methods ..."
    public static void AddReportParameters(CrystalDecisions.CrystalReports.Engine.ReportDocument rpt, DataSet ds, bool CompanyName, string ReportName, bool Address1, bool Address2, bool City, bool phone, bool Email)
    {
        rpt.SetDataSource(ds);

        if (CompanyName == true)
        {
            rpt.SetParameterValue("pCompanyName", CurrentCompany.Name);
        }

        if (ReportName != "")
        {
            rpt.SetParameterValue("pReportName", ReportName);
        }

        if (Address1 == true)
        {
            rpt.SetParameterValue("pAddress1", CurrentCompany.Address1);
        }

        if (Address2 == false)
        {
            rpt.SetParameterValue("pAddress2", CurrentCompany.Address2);
        }

        if (City == true)
        {
            rpt.SetParameterValue("pCity", CurrentCompany.City);
        }

        if (phone == true)
        {
            rpt.SetParameterValue("pPhone", CurrentCompany.Phone);
        }

        if (Email == true)
        {
            rpt.SetParameterValue("pEmail", CurrentCompany.Email);
        }

        //if (State == true)
        //{
        //    rpt.SetParameterValue("pState", "");
        //}
        //if (PinCode == true)
        //{
        //    rpt.SetParameterValue("pPinCode", CurrentCompany.Pincode);
        //}

        //if (Phone2 == true)
        //{
        //    rpt.SetParameterValue("pPhone2", CurrentCompany.Phone2);
        //}
        //if (Fax == true)
        //{
        //    rpt.SetParameterValue("pFax", CurrentCompany.Fax);
        //}



    }
}
#endregion