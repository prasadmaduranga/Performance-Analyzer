using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 6;
            Session["courseID"] = 8;
            Session["statCourseID"] = 8;
           
            if (!IsPostBack) {

                MultiView1.ActiveViewIndex = 4;

            }
        }

        private void View4_DataBind()
        {
            DropDownList4.Enabled = false;
            DropDownList5.Enabled = false;
            GridView7.Visible = false;

            Chart5.Visible = false;
            MultiView1.ActiveViewIndex = 3;
        }

        private void View3_DataBind()
        {
            GridView3.DataBind();
            GridView4.DataBind();
            Chart4.DataBind();
            MultiView1.ActiveViewIndex = 2;
        }

        private void View2_DataBind()
        {
            GridView6.Visible = false;
            GridView5.Visible = false;
            Chart2.Visible = false;
            Label4.Text = "";
            MultiView1.ActiveViewIndex = 1;
        }
        private void View1_DataBind()
        {
          
            MultiView1.ActiveViewIndex = 0;
        }


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList1.SelectedValue.Equals("-1"))
            {
                GridView1.DataBind();
                GridView2.DataBind();
                Chart1.DataBind();
                if (GridView1.Rows.Count > 0)
                {
                    Label2.Text = DropDownList1.SelectedValue + ": " + DropDownList1.SelectedItem.Text.ToString();
                }
                else
                {
                    Label2.Text = "No results for selected module";
                }
            }
            else {
                Label2.Text = "";
            
            }
        }

        protected void Chart1_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            foreach (Series charts in Chart1.Series)
            {
                foreach (DataPoint point in charts.Points)
                {

                    point.Label = string.Format("{1}-{0:0} ",point.AxisLabel, point.YValues[0]);

                }
            }
        }
        
        //----------------------------------------------------------------------------------------

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[2].FindControl("Label6")).Text);
                    ((Label)e.Row.Cells[2].FindControl("Label6")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[2].FindControl("Label6")).Text = "No SGPA";
                    ((Label)e.Row.Cells[3].FindControl("Label1")).Text = "";

                }
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList2.SelectedValue.Equals("-1"))
            {

                GridView6.Visible = true;
                GridView5.Visible = true;
                Chart2.Visible = true;
                Label4.Text = DropDownList2.SelectedItem.Text + "Overall Results";

                GridView5.DataBind();
                GridView6.DataBind();
                Chart2.DataBind();
            }
            else {
                GridView6.Visible = false;
                GridView5.Visible = false;
                Chart2.Visible = false;
                Label4.Text = "";
            
            }
        }
        //======================================================================================
        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[2].FindControl("Label6")).Text);
                    ((Label)e.Row.Cells[2].FindControl("Label6")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[2].FindControl("Label6")).Text = "No SGPA";
                    ((Label)e.Row.Cells[3].FindControl("Label1")).Text = "";

                }
            }
        }

        protected void Chart5_PrePaint(object sender, ChartPaintEventArgs e)
        {
            foreach (Series charts in Chart5.Series)
            {
                foreach (DataPoint point in charts.Points)
                {

                    point.Label = string.Format("{1}-{0:0} ", point.AxisLabel, point.YValues[0]);

                }
            }
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList3.SelectedValue.Equals("-1"))
            {
                if (!DropDownList4.Enabled) {

                    DropDownList4.Enabled = true;
                }
                DropDownList4.DataBind();
                ListItem li = DropDownList4.Items[0];
                DropDownList4.Items.Clear();
                DropDownList4.Items.Insert(0, li);
                DropDownList4.DataBind();


                //DropDownList.DataBind();
                ListItem li2 = DropDownList5.Items[0];
                DropDownList5.Items.Clear();
                DropDownList5.Items.Insert(0, li2);
                DropDownList5.Enabled = false;

            }

            else {
                
                DropDownList4.DataBind();
                ListItem li = DropDownList4.Items[0];
                DropDownList4.Items.Clear();
                DropDownList4.Items.Insert(0, li);
                DropDownList4.Enabled = false;
            }
        }

        protected void DropDownList5_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1") && !DropDownList5.SelectedValue.Equals("-1"))
            {
                GridView7.Visible = true;
                Chart5.Visible = true;


                GridView7.DataBind();
                Chart5.DataBind();
                Label8.Text = DropDownList3.SelectedItem.Text + " " + DropDownList5.SelectedItem.Text + " Result Summary";
                if (GridView7.Rows.Count == 0) {

                    Label8.Text = "No Results";
                }
            }
            else {
                Label8.Visible = false;
                GridView7.Visible = false;
                Chart5.Visible = false;
            
            }
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList3.SelectedValue.Equals("-1") && !DropDownList4.SelectedValue.Equals("-1"))
            {
                if (!DropDownList5.Enabled)
                {

                    DropDownList5.Enabled = true;
                }
              //  DropDownList5.DataBind();
                ListItem li = DropDownList5.Items[0];
                DropDownList5.Items.Clear();
                DropDownList5.Items.Insert(0, li);
                DropDownList5.DataBind();


            }

            else
            {
                DropDownList5.Enabled = false;
                ListItem li = DropDownList5.Items[0];
                DropDownList5.Items.Clear();
                DropDownList5.Items.Insert(0, li);
            }
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int index = RadioButtonList1.SelectedIndex;

            if (index == 0) { View1_DataBind(); }
            else if (index == 1) { View2_DataBind(); }
            else if (index == 2) { View3_DataBind(); }
            else if (index == 3) { View4_DataBind(); }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }

        protected void GridView5_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView5.PageIndex = e.NewPageIndex;
            GridView5.DataBind();
        }

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GridView3.DataBind();
        }
    }
}