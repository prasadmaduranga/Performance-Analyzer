using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace PerformanceAnalyzer2.PresentationLayer.Lecturer
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 263;
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
            }
            }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {

    }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).Text.Equals(" More..."))
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                SqlDataSource1.SelectParameters["courseIDin"].DefaultValue = GridView1.DataKeys[rowindex].Value.ToString();
                DetailsView1.DataSource = SqlDataSource1;
                DetailsView1.DataBind();

            }
            if (((LinkButton)e.CommandSource).Text.Equals("Unfollow | "))
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                int courseID=Convert.ToInt32( GridView1.DataKeys[rowindex].Value.ToString());
                PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
                dataContext.spUnfollowCourse(Convert.ToInt32(Session["userID"].ToString()), courseID);
                GridView1.DataBind();

                DetailsView1.DataSource = null;
                DetailsView1.DataBind();


            }



        }
        //=================================================================================

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).Text.Equals("Send Request"))
            { 
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                int courseID=Convert.ToInt32( GridView2.DataKeys[rowindex].Value.ToString());
              
                PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
                dataContext.sendRequest(Convert.ToInt32(Session["userID"].ToString()), courseID);
                GridView2.DataBind();


            }
            else if (((LinkButton)e.CommandSource).Text.Equals(" | More..."))
            {

                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                SqlDataSource5.SelectParameters["courseIDin"].DefaultValue = GridView2.DataKeys[rowindex].Value.ToString();
                DetailsView2.DataSource = SqlDataSource5;
                DetailsView2.DataBind();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedValue.Equals("-1"))
            {
                GridView2.DataBind();
                DetailsView2.DataSource = null;
               DetailsView2.DataBind();


            }
            else {
               DetailsView2.DataSource = null;
                DetailsView2.DataBind();
                GridView2.DataBind();
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RadioButtonList1.SelectedValue.Equals("1")) {

                MultiView1.ActiveViewIndex = 0;
            }
            else if (RadioButtonList1.SelectedValue.Equals("2"))
            {

                MultiView1.ActiveViewIndex = 1;
            }
        }
    }
}