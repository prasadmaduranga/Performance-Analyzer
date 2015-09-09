using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            DetailsView1.DataSource = PerformanceAnalyzer2.BusinessLogicLayer.StudentLogic.getStudentProfileData(Session["userID"]);
            DetailsView1.DataBind();

        }
    }
}