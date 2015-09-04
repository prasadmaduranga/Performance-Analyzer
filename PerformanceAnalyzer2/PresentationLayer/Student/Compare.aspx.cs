using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms.DataVisualization.Charting;
using PerformanceAnalyzer2.BusinessLogicLayer;
using System.Data;
using System.Web.UI.DataVisualization.Charting;



namespace PerformanceAnalyzer2.PresentationLayer.Student
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["courseID"] = 154;
            Session["userID"] =309;
            Session["indexNo"] = "129";
           

            if (!IsPostBack)
            {
                

                
                    MultiView1.ActiveViewIndex = 9;
               
            }

        }

        private void ActivateView4()
        {
            Label16.Visible = false;//view4
            Label17.Visible = false;
            MultiView1.ActiveViewIndex = 3;

        }
        private void ActivateView2()
        {
            MultiView1.ActiveViewIndex = 1;

        }
        private void ActivateView1()
        {
          
            MultiView1.ActiveViewIndex = 0;

        }
        private void ActivateView3()
        {
            DropDownList5.Enabled = false;
            MultiView1.ActiveViewIndex = 2;

        }

        private void ActivateView9()
        {
            Chart9.Visible = false;
            Label47.Visible = false;
            Label48.Visible = false;
            Label46.Visible = false;

            GridView14.Visible = false;
            GridView15.Visible = false;
            MultiView1.ActiveViewIndex = 8;

        }

        private void ActivateView8()
        {
            Chart8.Visible = false;
            Label42.Visible = false;
            Label43.Visible = false;
            GridView12.Visible = false;
            GridView13.Visible = false;
            MultiView1.ActiveViewIndex = 7;

        }
        private void ActivateView8(int uid)
        {
            Chart8.Visible = false;
            Label42.Visible = false;
            Label43.Visible = false;
            GridView12.Visible = false;
            GridView13.Visible = false;
            MultiView1.ActiveViewIndex = 7;
            DropDownList15.SelectedValue = uid.ToString();
        }
        private void ActivateView7()
        {
            View7_DataBind();
            MultiView1.ActiveViewIndex = 6;

        }

        private void ActivateView6()
        {
            DropDownList14.Enabled = false;
            Label31.Visible = false;
            Label32.Visible = false;
            Chart5.Visible = false;
            GridView9.Visible = false;
            MultiView1.ActiveViewIndex = 5;

        }

        private void ActivateView5()
        {
            Label21.Visible = false;
            Label22.Visible = false;
            Chart6.Visible = false;
            MultiView1.ActiveViewIndex = 4;

        }

        public void View2_bind()
        {

            Label2.Text = string.Format(DropDownList2.SelectedItem.Text.ToString() + ": " + DropDownList2.SelectedValue.ToString());

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
            else
            {
                DropDownList5.Enabled = false;
            }

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

        protected void DropDownList6_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList6.SelectedValue.Equals("-1"))
            { View1_bind(); }
        }

        public void View1_bind()
        {
            if (!DropDownList6.SelectedValue.Equals("-1"))
            {

                Label10.Text = string.Format(DropDownList6.SelectedItem.Text.ToString() + ": " + DropDownList6.SelectedValue.ToString());
                DataTable dt = StudentLogic.getUserVSBatch(Session["userID"].ToString(), Session["courseID"].ToString(), DropDownList6.SelectedValue);
                GridView3.DataSource = dt;
                GridView3.DataBind();

                Chart3.DataSource = dt;
                Chart3.Series["Series1"].XValueMember = "Result Group";
                Chart3.Series["Series1"].YValueMembers = "GPA";
                Chart3.DataBind();


            }
        }

        protected void GridView3_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[2].FindControl("Label13")).Text));
                ((TableCell)e.Row.Cells[2]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);


            }
        }

        protected void Chart3_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            if (e.ChartElement is System.Web.UI.DataVisualization.Charting.Series && ((System.Web.UI.DataVisualization.Charting.Series)e.ChartElement).Name == "Series1")
            {
                System.Web.UI.DataVisualization.Charting.Series s = e.Chart.Series[0];
                System.Web.UI.DataVisualization.Charting.ChartGraphics cg = e.ChartGraphics;

                // Highlight the maximum sales this year
                for (int i = 0; i < s.Points.Count; i++)
                {

                    string colour = StudentLogic.getCustomColour(float.Parse(s.Points[i].YValues[0].ToString()));

                    s.Points[i].Color = System.Drawing.ColorTranslator.FromHtml(colour);



                }
            }

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

            Label16.Visible = true;
            Label17.Visible = true;

        }

        protected void GridView4_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                ((Label)e.Row.Cells[3].FindControl("Label1")).Text = StudentLogic.getResultForGPA(double.Parse(((Label)e.Row.Cells[5].FindControl("Label3")).Text));
                double val = double.Parse(((Label)e.Row.Cells[4].FindControl("Label2")).Text);
                ((Label)e.Row.Cells[4].FindControl("Label2")).Text = Math.Round(val, 2).ToString();

                val = double.Parse(((Label)e.Row.Cells[5].FindControl("Label3")).Text);
                ((Label)e.Row.Cells[5].FindControl("Label3")).Text = Math.Round(val, 2).ToString();

                string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[4].FindControl("Label2")).Text));
                ((TableCell)e.Row.Cells[4]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[5].FindControl("Label3")).Text));
                ((TableCell)e.Row.Cells[5]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

            }

        }

        protected void Chart4_Load(object sender, EventArgs e)
        {
            Chart4.Series["Series1"].Label = "#VALY{#.##}";
            Chart4.Series["Series2"].Label = "#VALY{#.##}";


        }

        protected void Chart4_DataBound(object sender, EventArgs e)
        {


        }

        protected void Chart4_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label16.BackColor = Chart4.Series["Series1"].Color;
            Label17.BackColor = Chart4.Series["Series2"].Color;
        }

        protected void GridView5_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label18")).Text);
                ((Label)e.Row.Cells[1].FindControl("Label18")).Text = Math.Round(val, 2).ToString();
            }
        }

        //------------------------------------------------------------------------------------------------------------

        protected void GridView6_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[4].FindControl("Label26")).Text);
                    ((Label)e.Row.Cells[4].FindControl("Label26")).Text = Math.Round(val, 2).ToString();
                    string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[4].FindControl("Label26")).Text));
                    ((TableCell)e.Row.Cells[4]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                }
                catch (Exception er)
                {

                    ((Label)e.Row.Cells[5].FindControl("Label26")).Text = "No Results";


                }





                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[5].FindControl("Label27")).Text);
                    ((Label)e.Row.Cells[5].FindControl("Label27")).Text = Math.Round(val, 2).ToString();
                    string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[5].FindControl("Label27")).Text));
                    ((TableCell)e.Row.Cells[5]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                }
                catch (Exception ex)
                {


                    ((Label)e.Row.Cells[5].FindControl("Label27")).Text = "No Results";


                }



            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[3].Text = DropDownList9.SelectedItem.Text;

                e.Row.Cells[5].Text = DropDownList9.SelectedItem.Text;


            }

        }

        protected void GridView7_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {

                    double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label28")).Text);
                    ((Label)e.Row.Cells[1].FindControl("Label28")).Text = Math.Round(val, 2).ToString();
                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[1].FindControl("Label28")).Text = "No SGPA";
                }
            }
        }

        protected void Chart6_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label21.BackColor = Chart6.Series["Series1"].Color;
            Label22.BackColor = Chart6.Series["Series2"].Color;
        }

        protected void Chart6_Load(object sender, EventArgs e)
        {
            Chart6.Series["Series1"].Label = "#VALY{#.##}";
            Chart6.Series["Series2"].Label = "#VALY{#.##}";

        }

        protected void DropDownList8_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label21.Visible = false;
            Label22.Visible = false;
            Chart6.Visible = false;
            if (!DropDownList8.SelectedValue.Equals("-1") && !DropDownList9.SelectedValue.Equals("-1"))
            {
                View5_dataBind();
            }
        }

        private void View5_dataBind()
        {
            GridView7.DataSource = SqlDataSource20;
            GridView6.DataSource = SqlDataSource19;
            GridView6.DataBind();
            GridView7.DataBind();

            Chart6.DataSource = SqlDataSource19;
            Chart6.DataBind();
            Chart6.Visible = true;
            if (Chart6.Series[0].Points.Count > 0 || Chart6.Series[1].Points.Count > 0)
            {
                Label21.Visible = true;
                Label22.Visible = true;
            }



            Label22.Text = DropDownList9.SelectedItem.Text;
            Label20.Text = DropDownList8.SelectedItem.Text + " " + DropDownList9.SelectedItem.Text + " Vs ME";

        }

        protected void DropDownList9_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label21.Visible = false;
            Label22.Visible = false;
            Chart6.Visible = false;
            if (!DropDownList8.SelectedValue.Equals("-1") && !DropDownList9.SelectedValue.Equals("-1"))
            {
                View5_dataBind();
            }
        }
        //----------------------------------------------------------------------------------------------------




        protected void Chart6_DataBound(object sender, EventArgs e)
        {

        }

        protected void DropDownList13_SelectedIndexChanged(object sender, EventArgs e)
        {

            Label31.Visible = false;
            Label32.Visible = false;
            Chart5.Visible = false;
            if (DropDownList13.SelectedValue.Equals("-1"))
            {
                DropDownList14.Enabled = false;
            }
            else
            {
                DropDownList14.Enabled = true;
            }

            if (!DropDownList12.SelectedValue.Equals("-1") && !DropDownList13.SelectedValue.Equals("-1") && !DropDownList14.SelectedValue.Equals("-1"))
            {

                View6_DataBind();
            }
        }



        protected void DropDownList14_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList12.SelectedValue.Equals("-1") && !DropDownList13.SelectedValue.Equals("-1") && !DropDownList14.SelectedValue.Equals("-1"))
            {

                View6_DataBind();

            }
        }

        protected void DropDownList12_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList12.SelectedValue.Equals("-1") && !DropDownList13.SelectedValue.Equals("-1") && !DropDownList14.SelectedValue.Equals("-1"))
            {
                View6_DataBind();


            }
        }

        private void View6_DataBind()
        {



            Label31.Text = DropDownList13.SelectedItem.Text;
            Label32.Text = DropDownList14.SelectedItem.Text;
            Label30.Text = DropDownList12.SelectedItem.Text + ": " + DropDownList13.SelectedItem.Text + " Vs " + DropDownList14.SelectedItem.Text;
            GridView8.DataSource = SqlDataSource16;

            GridView8.DataBind();
            GridView9.DataBind();
            GridView9.Visible = true;
            Chart5.DataSource = SqlDataSource16;
            Chart5.DataBind();

            if (Chart5.Series[0].Points.Count > 0 || Chart5.Series[1].Points.Count > 0)
            {
                Label31.Text = DropDownList13.SelectedItem.Text;
                Label32.Text = DropDownList14.SelectedItem.Text;

                Label31.Visible = true;
                Label32.Visible = true;
            }

            Chart5.Visible = true;

        }

        protected void GridView8_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[4].FindControl("Label26")).Text);
                    ((Label)e.Row.Cells[4].FindControl("Label26")).Text = Math.Round(val, 2).ToString();
                    string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[4].FindControl("Label26")).Text));
                    ((TableCell)e.Row.Cells[4]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[5].FindControl("Label26")).Text = "No Results";

                }

                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[5].FindControl("Label27")).Text);
                    ((Label)e.Row.Cells[5].FindControl("Label27")).Text = Math.Round(val, 2).ToString();
                    string colour = StudentLogic.getCustomColour(float.Parse(((Label)e.Row.Cells[5].FindControl("Label27")).Text));
                    ((TableCell)e.Row.Cells[5]).BackColor = System.Drawing.ColorTranslator.FromHtml(colour);

                }
                catch (Exception ex)
                {


                    ((Label)e.Row.Cells[5].FindControl("Label27")).Text = "No Results";


                }



            }
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[3].Text = DropDownList14.SelectedItem.Text;

                e.Row.Cells[5].Text = DropDownList14.SelectedItem.Text;
                e.Row.Cells[2].Text = DropDownList13.SelectedItem.Text;

                e.Row.Cells[4].Text = DropDownList13.SelectedItem.Text;



            }

        }

        protected void GridView9_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                try
                {

                    double val = double.Parse(((Label)e.Row.Cells[1].FindControl("Label28")).Text);
                    ((Label)e.Row.Cells[1].FindControl("Label28")).Text = Math.Round(val, 2).ToString();
                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[1].FindControl("Label28")).Text = "No SGPA";
                }
            }
        }

        protected void Chart5_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label31.BackColor = Chart5.Series["Series1"].Color;
            Label32.BackColor = Chart5.Series["Series2"].Color;
        }

        protected void Chart5_Load(object sender, EventArgs e)
        {
            Chart5.Series["Series1"].Label = "#VALY{#.##}";
            Chart5.Series["Series2"].Label = "#VALY{#.##}";

        }

        //-------------------------------------------------------------------------------------------------------

        protected void Chart7_PostPaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label39.BackColor = Chart7.Series["Series1"].Color;
            Label40.BackColor = Chart7.Series["Series2"].Color;
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

                try
                {
                    double val = double.Parse(((Label)e.Row.Cells[2].FindControl("Label38")).Text);
                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception ex)
                {


                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = "No SGPA";


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
                Label39.Visible = true;
                Label40.Visible = true;
                Chart7.Visible = true;
            }
            else
            {
                Label39.Visible = false;
                Label40.Visible = false;
                Chart7.Visible = false;

            }



        }

        protected void Chart7_Load(object sender, EventArgs e)
        {

            Chart7.Series["Series1"].Label = "#VALY{#.##}";
            Chart7.Series["Series2"].Label = "#VALY{#.##}";
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

        protected void GridView12_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (e.Row.RowType == DataControlRowType.Header)
            {

                e.Row.Cells[2].Text = DropDownList15.SelectedItem.Text;
            }
        }

        protected void GridView13_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {

                e.Row.Cells[2].Text = DropDownList15.SelectedItem.Text;
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
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
                try
                {

                    double val = double.Parse(((Label)e.Row.Cells[2].FindControl("Label38")).Text);
                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = "No SGPA";
                }

            }
        }

        protected void Chart8_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label42.BackColor = Chart5.Series["Series1"].Color;
            Label43.BackColor = Chart5.Series["Series2"].Color;
        }

        protected void Chart8_Load(object sender, EventArgs e)
        {
            Chart8.Series["Series1"].Label = "#VALY{#.##}";
            Chart8.Series["Series2"].Label = "#VALY{#.##}";

        }

        private void View8_DataBind()
        {

            GridView12.DataBind();
            GridView13.DataBind();
            Chart8.DataBind();
            Label42.Text = "Me";
            Label43.Text = DropDownList15.SelectedItem.Text;

            Label42.Visible = true;
            Label43.Visible = true;
            Label41.Text = "Me Vs " + DropDownList15.SelectedItem.Text + " Overrall Comparison";
            Label41.Visible = true;
            if (Chart8.Series[0].Points.Count > 0 || Chart8.Series[1].Points.Count > 0)
            {



                Chart8.Visible = true;


            }


        }

        protected void DropDownList15_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList15.SelectedValue.Equals("-1"))
            {
                View8_DataBind();
                GridView12.Visible = true;
                GridView13.Visible = true;
            }
            else
            {
                Chart8.Visible = false;
                Label42.Visible = false;
                Label43.Visible = false;
                GridView12.Visible = false;
                GridView13.Visible = false;
            }
        }




        //-------------------------------------------------------------------------------


        protected void GridView14_RowDataBound(object sender, GridViewRowEventArgs e)
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
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = DropDownList10.SelectedItem.Text;
                e.Row.Cells[2].Text = DropDownList11.SelectedItem.Text;
            }
        }

        protected void GridView15_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[1].Text = DropDownList10.SelectedItem.Text;
                e.Row.Cells[2].Text = DropDownList11.SelectedItem.Text;
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
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
                try
                {

                    double val = double.Parse(((Label)e.Row.Cells[2].FindControl("Label38")).Text);
                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = Math.Round(val, 2).ToString();

                }
                catch (Exception er)
                {
                    ((Label)e.Row.Cells[2].FindControl("Label38")).Text = "No SGPA";
                }

            }
        }

        protected void Chart9_PrePaint(object sender, System.Web.UI.DataVisualization.Charting.ChartPaintEventArgs e)
        {
            Label47.BackColor = Chart5.Series["Series1"].Color;
            Label48.BackColor = Chart5.Series["Series2"].Color;

        }

        protected void Chart9_Load(object sender, EventArgs e)
        {
            Chart9.Series["Series1"].Label = "#VALY{#.##}";
            Chart9.Series["Series2"].Label = "#VALY{#.##}";

        }

        private void View9_DataBind()
        {
            GridView14.DataBind();
            GridView15.DataBind();
            Chart9.DataBind();
            Label47.Text = DropDownList10.SelectedItem.Text;
            Label48.Text = DropDownList11.SelectedItem.Text;

            Label47.Visible = true;
            Label48.Visible = true;
            Label46.Text = DropDownList10.SelectedItem.Text + " Vs " + DropDownList11.SelectedItem.Text + " Overrall Comparison";
            Label46.Visible = true;
            if (Chart8.Series[0].Points.Count > 0 || Chart8.Series[1].Points.Count > 0)
            {
                Chart8.Visible = true;

            }

        }

        protected void DropDownList10_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList10.SelectedValue.Equals("-1") && !DropDownList11.SelectedValue.Equals("-1"))
            {

                GridView14.Visible = true;
                GridView15.Visible = true;
                Label46.Visible = true;
                View9_DataBind();
            }
            else
            {
                Chart9.Visible = false;
                Label47.Visible = false;
                Label48.Visible = false;
                Label46.Visible = false;

                GridView14.Visible = false;
                GridView15.Visible = false;
            }
        }

        protected void DropDownList11_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!DropDownList10.SelectedValue.Equals("-1") && !DropDownList11.SelectedValue.Equals("-1"))
            {

                GridView14.Visible = true;
                GridView15.Visible = true;
                Label46.Visible = true;
                View9_DataBind();
            }
            else
            {
                Chart9.Visible = false;
                Label47.Visible = false;
                Label48.Visible = false;
                Label46.Visible = false;

                GridView14.Visible = false;
                GridView15.Visible = false;
            }
        }

        public void ActivateMultiViewIndex(object sender, EventArgs e)
        {

            string comparisonGroup = null;
            string comparisnType = null;

            if (RadioButton1.Checked)
            {
                comparisonGroup = "BVsMe";
            }
            else if (RadioButton2.Checked)
            {
                comparisonGroup = "stdVsMe";
            }
            else if (RadioButton3.Checked) { comparisonGroup = "others"; }

            if (RadioButton4.Checked)
            {
                comparisnType = "module";
            }
            else if (RadioButton5.Checked)
            {
                comparisnType = "semester";
            }
            else if (RadioButton6.Checked) { 
                comparisnType = "overrall"; 
            }

            if (comparisonGroup != null && comparisnType != null)
            {
                if (comparisonGroup.Equals("BVsMe") && comparisnType.Equals("module")) { ActivateView1(); }
                else if (comparisonGroup.Equals("stdVsMe") && comparisnType.Equals("module")) { ActivateView2(); }
                else if (comparisonGroup.Equals("others") && comparisnType.Equals("module")) { ActivateView3(); }
                else if (comparisonGroup.Equals("BVsMe") && comparisnType.Equals("semester")) { ActivateView4(); }
                else if (comparisonGroup.Equals("stdVsMe") && comparisnType.Equals("semester")) { ActivateView5(); }
                else if (comparisonGroup.Equals("others") && comparisnType.Equals("semester")) { ActivateView6(); }
                else if (comparisonGroup.Equals("BVsMe") && comparisnType.Equals("overrall")) { ActivateView7(); }
                else if (comparisonGroup.Equals("stdVsMe") && comparisnType.Equals("overrall")) { ActivateView8(); }
                else if (comparisonGroup.Equals("others") && comparisnType.Equals("overrall")) {
                    Label46.Text = "No Students Selected!";
                    ActivateView9(); }
            }

        }

        
    }
}