using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms.DataVisualization.Charting;
using PerformanceAnalyzer2.BusinessLogicLayer;


using System.Web.UI.DataVisualization.Charting;



namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["courseID"] = 8;
            Session["userID"] = 6;
            Session["indexNo"] = "120287D";
            MultiView1.ActiveViewIndex = 2;

            if (!IsPostBack)
            {
                DropDownList5.Enabled = false;
               

            }

        }

        public void View2_bind()
        {
          
            Label2.Text =string.Format( DropDownList2.SelectedItem.Text.ToString() + ": " + DropDownList2.SelectedValue.ToString());
 
            GridView1.DataBind();
            Chart1.DataBind();
          
        }

        public void View3_bind()
        {
            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {

                Label6.Text = string.Format(DropDownList4.SelectedItem.Text.ToString() + ": " + DropDownList4.SelectedValue.ToString());

                GridView2.DataBind();
                Chart2.DataBind();
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (((Label)e.Row.Cells[0].FindControl("Label1")).Text.Equals(Session["indexNo"].ToString()))
                {
                    ((Label)e.Row.Cells[0].FindControl("Label1")).Text = "Me";
                }

                string colour = getColour(float.Parse(((Label)e.Row.Cells[2].FindControl("Label2")).Text));
                ((TableCell)e.Row.Cells[2]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);


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

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedValue.Equals("-1") && !DropDownList2.SelectedValue.Equals("-1"))
            {
                View2_bind();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedValue.Equals("-1") && !DropDownList2.SelectedValue.Equals("-1"))
            {
                View2_bind();
            }
        }

        protected void Chart1_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            if (e.ChartElement is System.Web.UI.DataVisualization.Charting.Series && ((System.Web.UI.DataVisualization.Charting.Series)e.ChartElement).Name == "Series1")
            {
                System.Web.UI.DataVisualization.Charting.Series s = e.Chart.Series[0];
                System.Web.UI.DataVisualization.Charting.ChartGraphics cg = e.ChartGraphics;
                double max = s.Points.FindMaxByValue().YValues[0];

                // Highlight the maximum sales this year
                for (int i = 0; i < s.Points.Count; i++)
                {

                    string colour = StudentLogic.getColourForResult(float.Parse(s.Points[i].YValues[0].ToString()));
                    s.Color = System.Drawing.ColorTranslator.FromHtml(colour);
                    if (s.Points[i].XValue.Equals(Session["courseID"].ToString()))
                    {

                    }


                }
            }
        }

        protected void Chart1_PreRender(object sender, EventArgs e)
        {

        }

        protected void Chart1_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            if (e.ChartElement is System.Web.UI.DataVisualization.Charting.Series && ((System.Web.UI.DataVisualization.Charting.Series)e.ChartElement).Name == "Series1")
            {
                System.Web.UI.DataVisualization.Charting.Series s = e.Chart.Series[0];
                System.Web.UI.DataVisualization.Charting.ChartGraphics cg = e.ChartGraphics;
                double max = s.Points.FindMaxByValue().YValues[0];

                // Highlight the maximum sales this year
                for (int i = 0; i < s.Points.Count; i++)
                {

                    string colour = StudentLogic.getColourForResult(float.Parse(s.Points[i].YValues[0].ToString()));
                    s.Points[i].Color = System.Drawing.ColorTranslator.FromHtml(colour);
                    if (s.Points[i].XValue.Equals(Session["courseID"].ToString()))
                    {

                    }


                }
            }


        }


        protected void Chart2_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {
                if (e.ChartElement is System.Web.UI.DataVisualization.Charting.Series && ((System.Web.UI.DataVisualization.Charting.Series)e.ChartElement).Name == "Series1")
                {
                    System.Web.UI.DataVisualization.Charting.Series s = e.Chart.Series[0];
                    System.Web.UI.DataVisualization.Charting.ChartGraphics cg = e.ChartGraphics;
                  
                    // Highlight the maximum sales this year
                    for (int i = 0; i < s.Points.Count; i++)
                    {

                        string colour = StudentLogic.getColourForResult(float.Parse(s.Points[i].YValues[0].ToString()));
                        s.Points[i].Color = System.Drawing.ColorTranslator.FromHtml(colour);



                    }
                }
            }

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList3.SelectedValue.Equals("-1"))
            {
                DropDownList5.Enabled = true;
                DropDownList5.Items.Clear();
                DropDownList5.Items.Add(new ListItem("--Select Student--", "-1", true));
                DropDownList5.DataBind();
                DropDownList5.SelectedIndex = 0;



            }
            else {
                DropDownList5.Enabled = false;
            }

            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {
                Chart2.Visible = true;
                
                GridView2.Visible = true;
                View3_bind();
            }
            else {
                Chart2.Visible = false;
                GridView2.Visible = false;
            }
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string colour = getColour(float.Parse(((Label)e.Row.Cells[2].FindControl("Label1")).Text));
                ((TableCell)e.Row.Cells[2]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);


            }

        }

        protected void DropDownList4_Sel(object sender, EventArgs e)
        {

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {
                Chart2.Visible = true;

                GridView2.Visible = true;
                View3_bind();
            }
            else
            {
                Chart2.Visible = false;
                GridView2.Visible = false;
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {
                Chart2.Visible = true;

                GridView2.Visible = true;
                View3_bind();
            }
            else
            {
                Chart2.Visible = false;
                GridView2.Visible = false;
            }
        }
    }
}