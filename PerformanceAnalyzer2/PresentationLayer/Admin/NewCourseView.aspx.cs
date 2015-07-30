using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_PreInit(object sender, EventArgs e) { Session["courseID"] = 10; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 1;

     


           // DetailsView1.DataSource = AdminLogic.getbasicCourseInfo();
            //DetailsView1.DataBind();
            int activeViewIndexVal = Convert.ToInt32(Request.QueryString["activeView"]);
            string activeViewIndex = (String)Request.QueryString["activeView"];
            switch (activeViewIndex)
            {
                case "0": MultiView1.ActiveViewIndex = activeViewIndexVal;
                    break;
                case "1":
                    loadGridviewSemester();
                    MultiView1.ActiveViewIndex = activeViewIndexVal;

                    break;
                case "2": MultiView1.ActiveViewIndex = activeViewIndexVal;
                    break;

            }



        }

        protected void Page_PreRender(object sender, EventArgs e)
        { 
        //    if ( Session["selectedSemester"].Equals(null) ) { GridView2.Visible = false; }
        //    else { GridView2.Visible = true; }
        }

        public void lbi_Click(object sender, EventArgs e)
        {
            SqlDataSource4.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();
            SqlDataSource4.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)GridView2.FooterRow.FindControl("DropDownList5")).SelectedValue;
            SqlDataSource4.InsertParameters["lecturerName"].DefaultValue = ((TextBox)GridView2.FooterRow.FindControl("TextBox2")).Text;
            SqlDataSource4.Insert();
            GridView2.DataBind();
        }

        protected void loadGridviewSemester() {

            GridView1.DataSource = AdminLogic.getSemesterInformation();
            GridView1.DataBind();

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ((DropDownList)DetailsView1.Rows[2].Cells[1].FindControl("DropDownList3")).DataBind();
            ((DropDownList)DetailsView1.Rows[2].Cells[1].FindControl("DropDownList4")).DataBind();
        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            ((DropDownList)DetailsView1.Rows[2].Cells[1].FindControl("DropDownList4")).DataBind();
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            //string name = ((DropDownList)(DetailsView1.Rows[0].Cells[1].FindControl("DropDownList1"))).SelectedValue.ToString();
            string name = ((TextBox)(DetailsView1.Rows[0].Cells[1].Controls[0])).Text;
            string batch = ((DropDownList)(DetailsView1.Rows[1].Cells[1].FindControl("DropDownList1"))).SelectedValue.ToString();
            string universityID = ((DropDownList)(DetailsView1.Rows[2].Cells[1].FindControl("DropDownList2"))).SelectedValue.ToString();
            string facID = ((DropDownList)(DetailsView1.Rows[3].Cells[1].FindControl("DropDownList3"))).SelectedValue.ToString();
            string deptID = ((DropDownList)(DetailsView1.Rows[4].Cells[1].FindControl("DropDownList4"))).SelectedValue.ToString();
            int studentCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[5].Cells[1].Controls[0])).Text);
            int yearCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[6].Cells[1].Controls[0])).Text);

            int semesterCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[7].Cells[1].Controls[0])).Text);

            AdminLogic.insertBasicCourseInfo(Session["userID"], name, batch, universityID, facID, deptID,semesterCount,studentCount,yearCount);

            Session["courseID"] = AdminLogic.getMaxCourseID();
            Response.Redirect("NewCourseView.aspx?activeView=1");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int rowIndex = e.NewSelectedIndex;
            Session["selectedSemester"] = Convert.ToInt32(GridView1.Rows[rowIndex].Cells[1].Text);
            //int semId= Convert.ToInt32(GridView1.DataKeys[rowIndex]["semesterID"]);
           GridView2.DataBind();
           if (GridView2.Rows.Count <= 0) {
               DataTable dt = new DataTable();
               dt.Clear();
               dt.Columns.Add("semesterID");
               dt.Columns.Add("moduleCode");
               dt.Columns.Add("name");
               dt.Columns.Add("lecturerName");

               dt.Columns.Add("GPA");
               dt.Columns.Add("credits");
               dt.Columns.Add("compulsary");

               DataRow _ravi = dt.NewRow();
               _ravi["semesterID"] = "";
               _ravi["moduleCode"] = "";
               _ravi["name"] = "";
               _ravi["lecturerName"] = "";
               _ravi["GPA"] = "";
               _ravi["credits"] = "";
               _ravi["compulsary"] = "";

               dt.Rows.Add(_ravi);
               GridView2.DataSource = dt;
               GridView2.DataBind();
           }
        }

        protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            GridView2.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           GridView2.DataBind();
        }

       
        
    }
}