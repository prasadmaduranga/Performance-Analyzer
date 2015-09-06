using PerformanceAnalyzer2.BusinessLogicLayer;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms.DataVisualization.Charting;

namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
            Session["courseID"] = 8;
            Session["userID"] = 6;
            Session["indexNo"] = "120287D";
           

            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 2;
            }

        }

       

        



        protected string getColour(float gpa)
        {


            if (gpa.Equals(float.Parse("3.7"))) { return "#00FF99"; }
            else if (gpa.Equals(float.Parse("4.2"))) { return "#66FF33"; }
            else if (gpa.Equals(float.Parse("4"))) { return "#66FF66"; }
            else if (gpa.Equals(float.Parse("3.3"))) { return "#5C5CE6"; }
            else if (gpa.Equals(float.Parse("3.0"))) { return "#7575FF"; }
            else if (gpa.Equals(float.Parse("2.7"))) { return "#9494FF"; }
            else if (gpa.Equals(float.Parse("2.4"))) { return "	#FF6600"; }
            else if (gpa.Equals(float.Parse("2.0"))) { return "	#FF6633"; }
            else if (gpa.Equals(float.Parse("1.7"))) { return "#FF9933"; }
            else if (gpa.Equals(float.Parse("1"))) { return "#FF8533"; }
            else if (gpa.Equals(float.Parse("0"))) { return "#D11919"; }
            else return "#FFFFFF";

        }



        protected void DropDownList7_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList7.SelectedValue.Equals("-1"))
            {
                View4_databind();
            }
        }

        private void View4_databind()
        {
            GridView4.DataBind();
            Chart4.DataBind();

           
            GridView5.DataSource = SqlDataSource11;
            GridView5.DataBind();

            if (!DropDownList7.SelectedValue.Equals("-1"))
            {
                Label14.Text = DropDownList7.SelectedItem.Text + " My SGPA: " + ((Label)GridView5.Rows[0].Cells[0].FindControl("Label18")).Text;
            }
            else {

                Label14.Text = "No semester selected!";
            }
        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

          //      ((Label)e.Row.Cells[3].FindControl("Label1")).Text = StudentLogic.getResultForGPA(double.Parse(((Label)e.Row.Cells[5].FindControl("Label3")).Text));
                double val = double.Parse(((Label)e.Row.Cells[3].FindControl("Label2")).Text);
                ((Label)e.Row.Cells[3].FindControl("Label2")).Text = Math.Round(val, 2).ToString();

                string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[3].FindControl("Label2")).Text));
                ((TableCell)e.Row.Cells[3]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                

            }

        }

        protected void Chart4_Load(object sender, EventArgs e)
        {
            Chart4.Series["Series1"].Label = "#VALY{#.##}";

            Chart4.ChartAreas[0].AxisX.Title = "Module";
            Chart4.ChartAreas[0].AxisY.Title = "GPA";
            Chart4.ChartAreas[0].AxisX.TitleAlignment = StringAlignment.Near;

            Chart4.ChartAreas[0].AxisX.TextOrientation = System.Web.UI.DataVisualization.Charting.TextOrientation.Horizontal;
            Chart4.ChartAreas[0].AxisX.TitleAlignment = StringAlignment.Near;

            Chart4.ChartAreas[0].AxisX.TextOrientation = System.Web.UI.DataVisualization.Charting.TextOrientation.Auto;
	


        }

        protected void Chart4_DataBound(object sender, EventArgs e)
        {


        }

        protected void Chart4_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
           
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label18")).Text);
                    ((Label)e.Row.Cells[1].FindControl("Label18")).Text = Math.Round(val, 2).ToString();
                }
            }
            catch (Exception er)
            {

                ((Label)e.Row.Cells[1].FindControl("Label18")).Text = "No SGPA";
            }
        }

        //------------------------------------------------------------------------------------------------------------


        protected void Chart7_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
       
        }

        protected void GridView11_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label37")).Text);
                    ((Label)e.Row.Cells[1].FindControl("Label37")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[1].FindControl("Label37")).Text = "No SGPA";

                }

                


            }

        }

        protected void Chart7_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {

        }

        private void View7_DataBind()
        {

            GridView10.DataBind();
            GridView11.DataBind();
            Chart7.DataBind();
            if (Chart7.Series[0].Points.Count > 0 || Chart7.Series[1].Points.Count > 0)
            {
               
                Chart7.Visible = true;
            }
            else
            {
                
                Chart7.Visible = false;

            }



        }

        protected void Chart7_Load(object sender, EventArgs e)
        {

            Chart7.Series["Series1"].Label = "#VALY{#.##}";
          

                Chart7.ChartAreas[0].AxisX.Title="Semester";
                Chart7.ChartAreas[0].AxisY.Title="SGPA";
            Chart7.ChartAreas[0].AxisX.TitleAlignment = StringAlignment.Near;

            Chart7.ChartAreas[0].AxisX.TextOrientation = System.Web.UI.DataVisualization.Charting.TextOrientation.Horizontal;
            Chart7.ChartAreas[0].AxisX.TitleAlignment = StringAlignment.Near;

            Chart7.ChartAreas[0].AxisX.TextOrientation = System.Web.UI.DataVisualization.Charting.TextOrientation.Auto;
	
	
        }

        protected void GridView10_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {
                    ((Label)e.Row.Cells[1].FindControl("Label36")).Text = StudentLogic.getClassForGPA(double.Parse(((Label)e.Row.Cells[1].FindControl("Label35")).Text));

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[1].FindControl("Label36")).Text = "TBD";

                }
                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label35")).Text);
                    ((Label)e.Row.Cells[1].FindControl("Label35")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[1].FindControl("Label35")).Text = "No GPA";

                }
            }
        }
        //-------------------------------------------------------------------------------------------------

        public void ActivateMultiViewIndex(object sender, EventArgs e)
        {

            
           
       if (RadioButton5.Checked)
            {
                ActivateView4();
            }
            else if (RadioButton6.Checked)
            {
                ActivateView7();
            }

            

        }

        private void ActivateView4()
        {
          
            MultiView1.ActiveViewIndex = 0;

        }

        private void ActivateView7()
        {
            View7_DataBind();
            MultiView1.ActiveViewIndex = 1;

        }
        
    }
}