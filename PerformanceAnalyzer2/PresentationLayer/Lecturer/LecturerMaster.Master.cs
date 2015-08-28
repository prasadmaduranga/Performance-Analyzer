using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceAnalyzer2.PresentationLayer.Lecturer
{
    public partial class LecturerMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    if (Session["role"].ToString().Equals("Lecturer"))
            //    {
            //        if (Session["imageURL"] != null)
            //        {
            //            ImageButton1.ImageUrl = Session["imageURL"].ToString() ?? "~/Images/Default.jpg";
            //        }
            //        else
            //        {
            //            ImageButton1.ImageUrl = "~/Images/Default.jpg";
            //        }
            //        LinkButton2.Text = " | " + Session["userName"].ToString() + " ";
            //        LinkButton3.Text = "| Logout";
            //    }
            //    else
            //    {
            //        Session["userID"] = null;
            //        Session["userName"] = null;
            //        Session["role"] = null;
            //        Session["imageURL"] = null;
            //        Session["courseID"] = null;
            //        Response.Redirect("~/Login.aspx");


            //    }
            //}
            //catch (Exception er)
            //{
            //    Session["userID"] = null;
            //    Session["userName"] = null;
            //    Session["role"] = null;
            //    Session["imageURL"] = null;
            //    Session["courseID"] = null;

            //    Response.Redirect("~/Login.aspx");
            //}

        }




        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/PresentationLayer/Lecturer/ViewProfileView.aspx");

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/PresentationLayer/Lecturer/ViewProfileView.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["userID"] = null;
            Session["userName"] = null;
            Session["role"] = null;
            Session["imageURL"] = null;
            Session["courseID"] = null;
            Response.Redirect("~/Login.aspx");
        }
    }
}