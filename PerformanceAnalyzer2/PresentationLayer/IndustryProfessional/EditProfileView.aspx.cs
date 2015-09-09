using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;


namespace PerformanceAnalyzer2.PresentationLayer.IndustryProfessional
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
               
        
                DetailsView1.DataBind();
            }
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {

        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            //AdminLogic.updateAdminProfileData(Session["userID"], e.NewValues[0].ToString(), e.NewValues[1].ToString(), e.NewValues[2].ToString(), e.NewValues[3].ToString());


            SqlDataSource1.UpdateParameters["userID"].DefaultValue = Session["userID"].ToString();
            SqlDataSource1.UpdateParameters["userName"].DefaultValue = ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource1.UpdateParameters["email"].DefaultValue = ((TextBox)DetailsView1.Rows[2].Cells[1].FindControl("TextBox2")).Text;
            SqlDataSource1.UpdateParameters["linkedin"].DefaultValue = ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text;
            SqlDataSource1.UpdateParameters["description"].DefaultValue = ((TextBox)DetailsView1.Rows[4].Cells[1].FindControl("TextBox4")).Text;
            SqlDataSource1.UpdateParameters["companyName"].DefaultValue = ((TextBox)DetailsView1.Rows[5].Cells[1].FindControl("TextBox5")).Text;


            SqlDataSource1.Update();
            Response.Redirect("ViewProfileView.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

            SqlDataSource1.UpdateParameters["userID"].DefaultValue = Session["userID"].ToString();
            SqlDataSource1.UpdateParameters["userName"].DefaultValue = ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource1.UpdateParameters["email"].DefaultValue = ((TextBox)DetailsView1.Rows[2].Cells[1].FindControl("TextBox2")).Text;
            SqlDataSource1.UpdateParameters["linkedin"].DefaultValue = ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text;
            SqlDataSource1.UpdateParameters["description"].DefaultValue = ((TextBox)DetailsView1.Rows[4].Cells[1].FindControl("TextBox4")).Text;
            SqlDataSource1.UpdateParameters["companyName"].DefaultValue = ((TextBox)DetailsView1.Rows[5].Cells[1].FindControl("TextBox5")).Text;


            SqlDataSource1.Update();
            Response.Redirect("ViewProfileView.aspx");
        }
    }
}