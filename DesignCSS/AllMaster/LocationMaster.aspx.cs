using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NewCRMService;
public partial class AllMaster_CityMaster : System.Web.UI.Page
{
    NewCRMService.ServiceClient crmclient = new NewCRMService.ServiceClient();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void bindcountry()
    {
        List<ParaList> para = new List<ParaList>()
        {

        };
    }
}