using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;
using System.Data;


namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 6;
            Session["courseID"] = 8;
            if (!IsPostBack) {
                Load_DetailsView1();
                MultiView1.ActiveViewIndex = 0;
            
            
            }



        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Text.Equals("Basic Details"))
            {
                Load_DetailsView1();
                MultiView1.ActiveViewIndex = 0;
            }
            else if (e.Item.Text.Equals("Modules"))
            {
                Load_ModuleData();
                MultiView1.ActiveViewIndex = 1;

            }
            else if (e.Item.Text.Equals("Student Details"))
            {
                Load_GridView6();
                MultiView1.ActiveViewIndex = 2;

            }

        }

        private void Load_GridView6()
        {
            GridView6.DataBind();

        }

        private void Load_ModuleData()
        {

            GridView4.DataSource = StudentLogic.getModuleData(Session["courseID"]);
            GridView4.DataBind();
        }

        public void Load_DetailsView1() {

           
             DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew(Session["courseID"].ToString());
            DetailsView1.DataBind();
        }

        protected void GridView4_DataBinding(object sender, EventArgs e)
        {
            
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
             
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                   
                    int semId=Convert.ToInt32(GridView4.DataKeys[e.Row.RowIndex]["semesterID"].ToString());
                    SqlDataSource s = (SqlDataSource)e.Row.FindControl("SqlDataSource10");
                    s.SelectParameters[0].DefaultValue = semId.ToString();
                }



        }

        protected void GridView6_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsView2.DataBind();

        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            LinkButton btn=(LinkButton)sender;
          //  Response.Redirect("~/PresentationLayer/Student/Compare.aspx?UID=" + btn.CommandArgument.ToString());
        }

        protected void GridView6_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView6.PageIndex = e.NewPageIndex;
            // GridView3.DataSource = AdminLogic.getStudentBasicData(Session["courseID"].ToString());
            GridView6.DataBind();
        }
    }
}