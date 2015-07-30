using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            string i=((DropDownList)(DetailsView1.Rows[0].Cells[1].FindControl("DropDownList1"))).SelectedValue.ToString();
            Response.Write(i);
        }
    }
}