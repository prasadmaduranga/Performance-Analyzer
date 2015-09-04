using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                Session["userID"] =1;
                DropDownList2.Enabled = false;
                DropDownList1.DataBind();

                TextBox1.Enabled = false;
           
             

            }

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                TextBox1.Enabled = false;
     
            }
            else {
                TextBox1.Enabled = true;
        
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!((DropDownList)sender).SelectedValue.Equals("-1")) {
                DropDownList2.Enabled = true;
               
                DropDownList2.DataBind();
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.Gridview1_DataBind();


        }

        private  void Gridview1_DataBind()
        {

            int courseID = Convert.ToInt32(DropDownList1.SelectedValue);

            GridView1.DataSource = AdminLogic.getStudentenrollmentInfo(courseID, DropDownList2.SelectedValue);

                GridView1.DataBind();
            
           
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int courseID=Convert.ToInt32( DropDownList1.SelectedValue);

            try
            {
                AdminLogic.createEnrollments(courseID, DropDownList2.SelectedValue);
            }
            catch (Exception)
            {
                ;
            }
            finally
            {
                this.Gridview1_DataBind();
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {


            GridView1.DataSource = null;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            int rowIndex = e.RowIndex;
            //int userID = Convert.ToInt32(((TextBox)GridView1.Rows[rowIndex].FindControl("TextBox2")).Text);
            int userID = Convert.ToInt32(GridView1.DataKeys[rowIndex].Value.ToString()); 
            string moduleCode = DropDownList2.SelectedValue;
            string result = ((DropDownList)GridView1.Rows[rowIndex].Cells[2].FindControl("DropDownList3")).SelectedValue;

            AdminLogic.updateResult(userID, moduleCode, result);
            GridView1.EditIndex = -1;
            this.Gridview1_DataBind();


        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            
      
        }

        protected void DropDownList3_DataBinding(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.Gridview1_DataBind();
        }
    }
}