using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                DetailsView1.DataSource = SqlDataSource1;
                DetailsView1.DataBind();

            }
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            SqlDataSource1.InsertParameters["moduleCode"].DefaultValue = ((TextBox)DetailsView1.Rows[0].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource1.InsertParameters["name"].DefaultValue = ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox2")).Text;
            SqlDataSource1.InsertParameters["GPA"].DefaultValue = ((RadioButtonList)DetailsView1.Rows[2].Cells[1].FindControl("RadioButtonList3")).SelectedItem.Text;
            SqlDataSource1.InsertParameters["credits"].DefaultValue = ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text;
            SqlDataSource1.InsertParameters["compulary"].DefaultValue = ((RadioButtonList)DetailsView1.Rows[4].Cells[1].FindControl("RadioButtonList4")).SelectedItem.Text;
            SqlDataSource1.Insert();
         
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            
           ((TextBox)DetailsView1.Rows[0].Cells[1].FindControl("TextBox1")).Text="";
             ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox2")).Text="";
             ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text="";
             Response.Redirect("NewModule.aspx");
        }

        protected void DetailsView1_PreRender(object sender, EventArgs e)
        {
            ((TextBox)DetailsView1.Rows[0].Cells[1].FindControl("TextBox1")).Text = "";
            ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox2")).Text = "";
            ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text = "";
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

            SqlDataSource1.InsertParameters["moduleCode"].DefaultValue = ((TextBox)DetailsView1.Rows[0].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource1.InsertParameters["name"].DefaultValue = ((TextBox)DetailsView1.Rows[1].Cells[1].FindControl("TextBox2")).Text;
            SqlDataSource1.InsertParameters["GPA"].DefaultValue = ((RadioButtonList)DetailsView1.Rows[2].Cells[1].FindControl("RadioButtonList3")).SelectedItem.Text;
            SqlDataSource1.InsertParameters["credits"].DefaultValue = ((TextBox)DetailsView1.Rows[3].Cells[1].FindControl("TextBox3")).Text;
            SqlDataSource1.InsertParameters["compulary"].DefaultValue = ((RadioButtonList)DetailsView1.Rows[4].Cells[1].FindControl("RadioButtonList4")).SelectedItem.Text;
            SqlDataSource1.Insert();
         
        }
    }
}