using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 1;
            DetailsView1.DataSource = AdminLogic.getAdminProfileData(Session["userID"]);
            DetailsView1.DataBind();

        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
           
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            AdminLogic.updateAdminProfileData(Session["userID"], e.NewValues[0].ToString(), e.NewValues[1].ToString(), e.NewValues[2].ToString(), e.NewValues[3].ToString());
            Response.Redirect("ViewProfileView.aspx");
        }
    }
}