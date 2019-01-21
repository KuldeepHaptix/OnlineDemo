using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_locationMasterNew : System.Web.UI.Page
{
    Service crmclient = new Service();
    //NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    DataSet dsCountry = new DataSet();
    DataSet dsfillState = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {


            ViewState["SelectedMode"] = "Country";
            bindCountrydata();
        }

    }

    public DataTable ReturnEmptyRow()
    {
        DataTable dtlocation = new DataTable();
        DataColumn dtname = new DataColumn("Name", typeof(System.String));

        dtlocation.Columns.Add(dtname);

        if (ViewState["SelectedMode"].ToString() == "Country")
        {
            DataColumn dtId = new DataColumn("CountryID", typeof(System.String));
            dtlocation.Columns.Add(dtId);
         
        }
        if (ViewState["SelectedMode"].ToString() == "State")
        {
            DataColumn dtId = new DataColumn("StateID", typeof(System.String));
            dtlocation.Columns.Add(dtId);

        }
        if (ViewState["SelectedMode"].ToString() == "City")
        {
            DataColumn dtId = new DataColumn("CityID", typeof(System.String));
            dtlocation.Columns.Add(dtId);

        }
        if (ViewState["SelectedMode"].ToString() == "Area")
        {
            DataColumn dtId = new DataColumn("AreaID", typeof(System.String));
            dtlocation.Columns.Add(dtId);

        }

        DataRow dtrow = dtlocation.NewRow();
        dtlocation.Rows.Add(dtrow);

        return dtlocation;
    }
    public void fillCountry()
    {
        DataSet dsCountry = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "Country" },
        new ParaList { Key = "@i_Compid", Value = CurrentUser.CompId },

        };
        drpSelection.DataValueField = "CountryID";
        drpSelection.DataTextField = "Name";

        dsCountry = crmclient.FillDDL(para, "Country");
        drpSelection.DataSource = dsCountry.Tables[0];
        drpSelection.DataBind();
    }
    public void fillState()
    {
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "State" },
        new ParaList { Key = "@i_compid", Value = CurrentUser.CompId },

        };

        drpSelection.DataValueField = "StateID";
        drpSelection.DataTextField = "Name";


        dsfillState = crmclient.FillDDL(para, "State");
        drpSelection.DataSource = dsfillState.Tables[0];
        drpSelection.DataBind();
    }
    public void fillCity()
    {
        DataSet dsCity = new DataSet();
        List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@mode", Value = "City" },
        new ParaList {Key="@i_compId", Value=CurrentUser.CompId }

        };

        drpSelection.DataValueField = "CityID";
        drpSelection.DataTextField = "Name";


        dsCity = crmclient.FillDDL(para, "City");
        drpSelection.DataSource = dsCity.Tables[0];
        drpSelection.DataBind();
    }

    public void bindCountrydata()
    {

        //foreach (GridView row in GvLocation.Rows)
        //{
        //    LinkButton btnselect = (LinkButton)GvLocation.FindControl("btnselect");
        //    btnselect.CommandArgument = "CountryId";

        //}
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="Country"},
        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},

        };


        dsCountry = crmclient.list(para, "Country");
        GvLocation.DataSource = dsCountry.Tables[0];
        GvLocation.DataBind();
    }
    public void bindStateData()
    {
        DataSet ds = new DataSet();
        GvLocation.DataKeyNames = new string[] { "StateID" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="State"},
        new ParaList {Key="@i_compid", Value=CurrentUser.CompId},
        };

        ds = crmclient.list(para, "State");
        GvLocation.DataSource = ds.Tables[0];
        GvLocation.DataBind();
    }
    public void bindCityData()
    {
        DataSet ds = new DataSet();
        GvLocation.DataKeyNames = new string[] { "CityId" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="City"},
        new ParaList {Key="@i_StateID", Value=drpSelection.SelectedValue},
        new ParaList {Key="@i_CompID", Value=CurrentUser.CompId},


        };

        ds = crmclient.list(para, "City");
        GvLocation.DataSource = ds.Tables[0];
        GvLocation.DataBind();
    }

    public void bindAreaData()
    {
        DataSet ds = new DataSet();
        GvLocation.DataKeyNames = new string[] { "AreaID" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="Area"},
        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},
        };

        ds = crmclient.list(para, "Area");

        if (ds.Tables[0].Rows.Count > 0)
        {
            GvLocation.DataSource = ds.Tables[0];
            GvLocation.DataBind();
        }
        else
        {
            GvLocation.DataSource=ReturnEmptyRow();
            GvLocation.DataBind();
        }
    }

    protected void GvLocation_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {


            LinkButton lnkselect = (LinkButton)GvLocation.FindControl("btnselect");

            //string[] arg = new string[4];
            //arg = e.CommandArgument.ToString().Split(';');
            //Session["IdTemplate"] = arg[0];
            if (ViewState["SelectedMode"].ToString() == "Country")
            {
                //lnkselect.CommandArgument = "CountryId";
                DataSet dsCountry = new DataSet();
                // ViewState["CountryId"] = arg[0];
                ViewState["CountryId"] = e.CommandArgument.ToString();
                List<ParaList> paracountry = new List<ParaList>()
                {
                    new ParaList {Key="@i_CountryID", Value=ViewState["CountryId"].ToString() },
                };
                dsCountry = crmclient.Select(paracountry, "Country");

                lblslctdCountry.Text = dsCountry.Tables[0].Rows[0]["CountryName"].ToString();
            }
            if (ViewState["SelectedMode"].ToString() == "State")
            {
                DataSet dsstate = new DataSet();
                // ViewState["State"] = arg[1];
                List<ParaList> paraState = new List<ParaList>()
                {

                    new ParaList {Key="@State_id", Value=ViewState["State"].ToString() },
                };
                dsstate = crmclient.Select(paraState, "State");


                lblslctdState.Text = dsCountry.Tables[0].Rows[0]["StateName"].ToString();
            }

        }

        if (e.CommandName == "AddNew")
        {
            TextBox Name = (TextBox)GvLocation.FooterRow.FindControl("txtFName");
            if (ViewState["SelectedMode"].ToString() == "Country")
            {
                if (Name.Text == "")
                {
                    Response.Redirect("../AllMaster/locationMasterNew.aspx");
                }
                else
                {
                    List<ParaList> para = new List<ParaList>()
                             {
                            new ParaList {Key="@mode", Value="insertqry"},
                             new ParaList {Key = "@i_CountryName", Value = Name.Text},
                              new ParaList {Key = "@i_CompiId", Value = CurrentUser.CompId },

                            };

                    crmclient.Insert(para, "Country");
                    bindCountrydata();
                }
            }

            if (ViewState["SelectedMode"].ToString() == "State")
            {
                string countryid = drpSelection.SelectedValue.ToString();
                if (Name.Text == "")
                {
                    Response.Redirect("../AllMaster/locationMasterNew.aspx");
                }
                else
                {
                    List<ParaList> para = new List<ParaList>()
                             {
                            new ParaList {Key="@mode", Value="insertqry"},
                             new ParaList {Key = "@i_StateName", Value = Name.Text},
                             new ParaList {Key="@i_CountryID", Value=countryid },
                             new ParaList {Key="@i_compId", Value=CurrentUser.CompId },
                           };

                    crmclient.Insert(para, "State");
                    bindStateData();
                }
            }

            if (ViewState["SelectedMode"].ToString() == "City")
            {
                string Stateid = drpSelection.SelectedValue.ToString();
                if (Name.Text == "")
                {
                    Response.Redirect("../AllMaster/locationMasterNew.aspx");
                }
                else
                {
                    List<ParaList> para = new List<ParaList>()
                             {
                            new ParaList {Key="@mode", Value="insertqry"},
                             new ParaList {Key = "@i_CityName", Value = Name.Text},
                             new ParaList {Key="@i_StateID", Value=Stateid },
                             new ParaList {Key="@i_CompId",Value=CurrentUser.CompId }


                            };

                    crmclient.Insert(para, "City");
                    bindStateData();
                }
            }


            if (ViewState["SelectedMode"].ToString() == "Area")
            {
                string areaid = drpSelection.SelectedValue.ToString();
                if (Name.Text == "")
                {
                    Response.Redirect("../AllMaster/locationMasterNew.aspx");
                }
                else
                {
                    List<ParaList> para = new List<ParaList>()
                             {

                             new ParaList {Key = "@i_CityID", Value = areaid.ToString() },
                             new ParaList {Key="@i_AreaName", Value=Name.Text },
                             new ParaList {Key="@i_compid", Value=CurrentUser.CompId }


                            };

                    crmclient.Insert(para, "Area");
                    bindAreaData();
                }
            }
        }
    }
    protected void btnState_Click(object sender, EventArgs e)
    {
        ViewState["SelectedMode"] = "State";
        fillCountry();
        lblName.Visible = true;
        drpSelection.Visible = true;
        lblName.Text = "Select Country";
        DataSet dsstate = new DataSet();
        GvLocation.DataKeyNames = new string[] { "StateID" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="State"},
        new ParaList {Key="@i_compid", Value=CurrentUser.CompId},
        //new ParaList {Key="@i_CountryId", Value=CurrentUser.CompId},

        };

        dsstate = crmclient.list(para, "State");
        GvLocation.DataSource = dsstate.Tables[0];
        GvLocation.DataBind();

        //}
    }

    protected void btnCountry_Click(object sender, EventArgs e)
    {
        ViewState["SelectedMode"] = "Country";
        DataSet dscountry = new DataSet();
        fillCountry();
        lblName.Visible = false;
        drpSelection.Visible = false;

        DataSet dsstate = new DataSet();
        GvLocation.DataKeyNames = new string[] { "CountryId" };

        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="Country"},
        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},

        };

        dsCountry = crmclient.list(para, "Country");
        GvLocation.DataSource = dsCountry.Tables[0];
        GvLocation.DataBind();
        //ViewState["SelectedMode"] = "State";
        //}
    }

    protected void drpSelection_SelectedIndexChanged(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();

        ViewState["SelectedId"] = drpSelection.SelectedValue.ToString();
        if (ViewState["SelectedMode"].ToString() == "State")
        {
            if (ViewState["SelectedId"] != null)
            {

                List<ParaList> para = new List<ParaList>()
                    { new ParaList {Key="@i_id", Value=ViewState["SelectedId"].ToString()},
                    new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},


                    };

                ds = crmclient.LOV(para, "State");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GvLocation.DataSource = ds.Tables[0];
                    GvLocation.DataBind();
                }
                else
                {
                    GvLocation.DataSource = ReturnEmptyRow();
                    GvLocation.DataBind();
                }
            }
        }
        if (ViewState["SelectedMode"].ToString() == "City")
        {
            if (ViewState["SelectedId"] != null)
            {

                List<ParaList> para = new List<ParaList>()
                    {
                    new ParaList {Key="@i_id", Value=ViewState["SelectedId"].ToString()},
                     new ParaList {Key="@i_compid", Value=CurrentUser.CompId},


                    };

                ds = crmclient.LOV(para, "City");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GvLocation.DataSource = ds.Tables[0];
                    GvLocation.DataBind();
                }
                else
                {
                    GvLocation.DataSource = ReturnEmptyRow();
                    GvLocation.DataBind();
                }
            }
        }

        if (ViewState["SelectedMode"].ToString() == "Area")
        {
            if (ViewState["SelectedId"] != null)
            {

                List<ParaList> para = new List<ParaList>()
                    { new ParaList {Key="@i_id", Value=ViewState["SelectedId"].ToString()},
                     new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},
                    };

                ds = crmclient.LOV(para, "Area");
                if (ds.Tables[0].Rows.Count > 0)
                {
                    GvLocation.DataSource = ds.Tables[0];
                    GvLocation.DataBind();
                }
                else
                {
                    GvLocation.DataSource = ReturnEmptyRow();
                    GvLocation.DataBind();
                }
            }
        }
    }

    protected void GvLocation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        if (ViewState["SelectedMode"].ToString() == "Country")
        {
            GvLocation.PageIndex = e.NewPageIndex;
            bindCountrydata();
        }
        if (ViewState["SelectedMode"].ToString() == "State")
        {
            GvLocation.PageIndex = e.NewPageIndex;
            bindStateData();
        }
        if (ViewState["SelectedMode"].ToString() == "City")
        {
            GvLocation.PageIndex = e.NewPageIndex;
            bindCityData();
        }
        if (ViewState["SelectedMode"].ToString() == "Area")
        {
            GvLocation.PageIndex = e.NewPageIndex;
            bindAreaData();
        }
    }

    protected void btnCity_Click(object sender, EventArgs e)
    {
        ViewState["SelectedMode"] = "City";
        fillState();
        lblName.Visible = true;
        drpSelection.Visible = true;
        lblName.Text = "Select State";
        DataSet dsstate = new DataSet();
        GvLocation.DataKeyNames = new string[] { "CityID" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
         
        { new ParaList {Key="@mode", Value="City"},
            new ParaList {Key="@i_StateID", Value=drpSelection.SelectedValue},
             new ParaList {Key="@i_CompID", Value=CurrentUser.CompId},

        };

        dsstate = crmclient.list(para, "City");
        GvLocation.DataSource = dsstate.Tables[0];
        GvLocation.DataBind();

    }

    protected void btnarea_Click(object sender, EventArgs e)
    {
        ViewState["SelectedMode"] = "Area";
        fillCity();
        lblName.Visible = true;
        drpSelection.Visible = true;
        lblName.Text = "Select City";
        DataSet dsArea = new DataSet();
        GvLocation.DataKeyNames = new string[] { "AreaID" };
        //if (ViewState["CountryId"] != null)
        //{
        List<ParaList> para = new List<ParaList>()
        { new ParaList {Key="@mode", Value="Area"},
        new ParaList {Key="@i_CompId", Value=CurrentUser.CompId},
        };

        
        dsArea = crmclient.list(para, "Area");
        if (dsArea.Tables[0].Rows.Count > 0)
        {
            GvLocation.DataSource = dsArea.Tables[0];
            GvLocation.DataBind();
        }
        else
        {
            GvLocation.DataSource = ReturnEmptyRow();
            GvLocation.DataBind();
          
        }
    }

    protected void GvLocation_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (ViewState["SelectedMode"].ToString() == "Country")
        {

            string Countryid = GvLocation.DataKeys[e.RowIndex].Value.ToString();


            List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_CountryID", Value = Countryid.ToString() },


        };

            crmclient.Delete(para, "Country");
            bindCountrydata();
        }

        if (ViewState["SelectedMode"].ToString() == "State")
        {

            string StateId = GvLocation.DataKeys[e.RowIndex].Value.ToString();


            List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_Stateid", Value = StateId.ToString() },


        };

            crmclient.Delete(para, "State");
            bindStateData();
        }

        if (ViewState["SelectedMode"].ToString() == "City")
        {

            string CityId = GvLocation.DataKeys[e.RowIndex].Value.ToString();


            List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_Cityid", Value = CityId.ToString() },


        };

            crmclient.Delete(para, "City");
            bindCityData();
        }
        if (ViewState["SelectedMode"].ToString() == "Area")
        {

            string AreaId = GvLocation.DataKeys[e.RowIndex].Value.ToString();


            List<ParaList> para = new List<ParaList>() {

        new ParaList { Key = "@i_areaid", Value = AreaId.ToString() },


        };

            crmclient.Delete(para, "Area");
            bindAreaData();
        }

    }

    protected void GvLocation_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (ViewState["SelectedMode"].ToString() == "Country")
        {
            GvLocation.EditIndex = e.NewEditIndex;
            bindCountrydata();
        }
        if (ViewState["SelectedMode"].ToString() == "State")
        {
            GvLocation.EditIndex = e.NewEditIndex;
            bindStateData();
        }
        if (ViewState["SelectedMode"].ToString() == "City")
        {
            GvLocation.EditIndex = e.NewEditIndex;
            bindCityData();
        }
        if (ViewState["SelectedMode"].ToString() == "Area")
        {
            GvLocation.EditIndex = e.NewEditIndex;
            bindAreaData();
        }



      

    }

    protected void GvLocation_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        if (ViewState["SelectedMode"].ToString() == "Country")
        {

            int countryEID = Convert.ToInt32(GvLocation.DataKeys[e.RowIndex].Value.ToString());
            TextBox CountryName = (TextBox)GvLocation.Rows[e.RowIndex].FindControl("txtEName");


            List<ParaList> para = new List<ParaList>()
        {
          
            new ParaList { Key="@i_id",Value=countryEID.ToString()},
            new ParaList {Key="@i_CountryName",Value=CountryName.Text }, 
           // new ParaList {Key="@i_CompId",Value="1" },

        };

            crmclient.Update(para, "Country");
            GvLocation.EditIndex = -1;
            bindCountrydata();
        }

        if (ViewState["SelectedMode"].ToString() == "State")
        {

            int StateEID = Convert.ToInt32(GvLocation.DataKeys[e.RowIndex].Value.ToString());
            TextBox StateName = (TextBox)GvLocation.Rows[e.RowIndex].FindControl("txtEName");


            List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_StateID",Value=StateEID.ToString() },
            new ParaList { Key="@i_StateName",Value=StateName.Text},
            
           // new ParaList {Key="@i_CompId",Value="1" },

        };

            crmclient.Update(para, "State");
            GvLocation.EditIndex = -1;
            bindStateData();
        }


        if (ViewState["SelectedMode"].ToString() == "City")
        {

            int CityEID = Convert.ToInt32(GvLocation.DataKeys[e.RowIndex].Value.ToString());
            TextBox CityName = (TextBox)GvLocation.Rows[e.RowIndex].FindControl("txtEName");


            List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_CityID",Value=CityEID.ToString() },
            new ParaList { Key="@i_CityName",Value=CityName.Text},
            
           // new ParaList {Key="@i_CompId",Value="1" },

        };

            crmclient.Update(para, "City");
            GvLocation.EditIndex = -1;
            bindCityData();
        }


        if (ViewState["SelectedMode"].ToString() == "Area")
        {

            int AreaEID = Convert.ToInt32(GvLocation.DataKeys[e.RowIndex].Value.ToString());
            TextBox AreaName = (TextBox)GvLocation.Rows[e.RowIndex].FindControl("txtEName");


            List<ParaList> para = new List<ParaList>()
        {
            new ParaList { Key="@i_AreaID",Value=AreaEID.ToString() },
            new ParaList { Key="@i_AreaName",Value=AreaName.Text},
            
           // new ParaList {Key="@i_CompId",Value="1" },

        };

            crmclient.Update(para, "Area");
            GvLocation.EditIndex = -1;
            bindAreaData();
        }
    }
}