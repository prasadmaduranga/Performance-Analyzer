using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack) {
                GridView1.DataBind();
                DetailsView1.Visible = false;

            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (((LinkButton)e.CommandSource).Text.Equals("Accept"))
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                int userId;
                int courseID;

               userId=Convert.ToInt32( GridView1.DataKeys[rowindex].Values["senderID"].ToString());
               courseID = Convert.ToInt32(GridView1.DataKeys[rowindex].Values["courseID"].ToString());

               PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
             
           //    dbcontext.Database.SqlQuery<String>(@"insert into Lecture_Course values("+userId.ToString()+","+courseID.ToString()+")");
               dbcontext.spGrantCourse(userId, courseID);
               GridView1.DataBind();
               DetailsView1.Visible = false;

            }
            else if (((LinkButton)e.CommandSource).Text.Equals("Delete"))
            {
                GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                int userId;
                int courseID;

                userId = Convert.ToInt32(GridView1.DataKeys[rowindex].Values["senderID"].ToString());
                courseID = Convert.ToInt32(GridView1.DataKeys[rowindex].Values["courseID"].ToString());

                PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();

               // dbcontext.Database.SqlQuery<String>(@"delete from [message] where senderID=" + userId.ToString());
                dbcontext.spDeleteMessage(userId);
                GridView1.DataBind();
                DetailsView1.Visible = true;

            
            }
            else if (((LinkButton)e.CommandSource).Text.Equals("More..."))
            {
                DetailsView1.Visible = true;
                 GridViewRow rowSelect = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                int rowindex = rowSelect.RowIndex;
                int userId;
                int courseID;

                userId = Convert.ToInt32(GridView1.DataKeys[rowindex].Values["senderID"].ToString());
                courseID = Convert.ToInt32(GridView1.DataKeys[rowindex].Values["courseID"].ToString());
                SqlDataSource2.SelectParameters["userID"].DefaultValue = userId.ToString();
                SqlDataSource2.DataBind();
                DetailsView1.DataBind();



            }


        }
    }
}