using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 1;
            if(!IsPostBack){
              
                if (Request.QueryString["activeView"] != null)
                {
                    int activeViewIndexVal = Convert.ToInt32(Request.QueryString["activeView"]);
                    string activeViewIndex = (String)Request.QueryString["activeView"];
                    switch (activeViewIndex)
                    {
                        case "0": MultiView1.ActiveViewIndex = activeViewIndexVal;
                            break;
                        case "1":
                            MultiView1.ActiveViewIndex = activeViewIndexVal;
                            break;
                        case "2":
                            MultiView1.ActiveViewIndex = activeViewIndexVal;
                            break;
                    }
                }
                else  if (Request.QueryString["courseID"] != null)
                {
                    Session["courseID"] = Request.QueryString["courseID"];
                    MultiView1.ActiveViewIndex = 0;
                 
                    DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew(Session["courseID"].ToString());

                    DetailsView1.DataBind(); 


                }
                else {
                    MultiView1.ActiveViewIndex = 0;
                
                }
            }          
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string name = ((TextBox)(DetailsView1.Rows[0].Cells[1].Controls[0])).Text;
            string batch = ((DropDownList)(DetailsView1.Rows[1].Cells[1].FindControl("DropDownList5"))).SelectedValue.ToString();
            string universityID = ((DropDownList)(DetailsView1.Rows[2].Cells[1].FindControl("DropDownList6"))).SelectedValue.ToString();
            string facID = ((DropDownList)(DetailsView1.Rows[3].Cells[1].FindControl("DropDownList7"))).SelectedValue.ToString();
            string deptID = ((DropDownList)(DetailsView1.Rows[4].Cells[1].FindControl("DropDownList8"))).SelectedValue.ToString();

            AdminLogic.spEditBasicCourseInfo(Session["courseID"].ToString(), name, batch, Convert.ToInt32(universityID), Convert.ToInt32(facID), Convert.ToInt32(deptID));

            DetailsView1.DataBind();
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {

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


        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (DetailsView2.Visible == false && !DropDownList1.SelectedValue.Equals("0")) {
                DetailsView2.Visible = true;
            }
            Session["courseID"] = Convert.ToInt32(DropDownList1.SelectedValue);
            DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew(DropDownList1.SelectedValue);
            DetailsView1.DataBind();

            loadGridviewSemester();
            setBsicStudentInfo();
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Enabled == true && e.Item.Text == "Course Info")
            {
                e.Item.Selected = true;
                MultiView1.ActiveViewIndex = 0;
            }
            else if (e.Item.Enabled == true && e.Item.Text == "Module Info")
            {
                if (Session["courseID"] == null)
                {
                    DetailsView2.Visible = false;

                }
                else {
                    DetailsView2.Visible = true;
                }
                MultiView1.ActiveViewIndex = 1;
                e.Item.Selected = true;

            }
            else if (e.Item.Enabled == true && e.Item.Text == "Student Info")
            {
                MultiView1.ActiveViewIndex = 2;
                e.Item.Selected = true;

            }
           
        }
        protected void loadGridviewSemester()
        {

            GridView1.DataSource = AdminLogic.getSemesterInformation(Convert.ToInt32(Session["courseID"].ToString()));
            GridView1.DataBind();
            DetailsView2.Visible = false;


        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["selectedSemester"] = GridView1.SelectedValue;

            if (GridView1.SelectedValue != null)
            {
                GridView2.Visible = true;
                this.setGriview2(GridView1.SelectedValue.ToString());
                DetailsView2.Visible = true;
                UpdatePanel3.Update();
            }
            else
            {
                GridView2.Visible = false;
                DetailsView2.Visible = false;
                UpdatePanel3.Update();
            }
        }
        protected void setGriview2(string semesterID)
        {
            GridView2.DataSource = AdminLogic.getModuleBySemester(semesterID);
            GridView2.DataBind();
            if (GridView2.Visible == false)
            {
                GridView2.Visible = true;
            }
            UpdatePanel3.Update();

        }
        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string semID = GridView2.Rows[rowIndex].Cells[1].Text;
            string modCode = GridView2.Rows[rowIndex].Cells[2].Text;

            AdminLogic.deletemoduleBySemester(semID, modCode);

            this.setGriview2(GridView1.SelectedValue.ToString());
        }

        protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Session["selectedSemester"] = GridView1.SelectedValue;

            if (GridView1.SelectedValue != null)
            {
                this.setGriview2(GridView1.SelectedValue.ToString());
            }
        }
        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            SqlDataSource6.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();
            SqlDataSource6.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedValue;

            SqlDataSource6.InsertParameters["lecturerName"].DefaultValue = ((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource6.Insert();

            Session["selectedSemester"] = GridView1.SelectedValue;

        }
       
        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView2.Visible = true;
            this.setGriview2(GridView1.SelectedValue.ToString());
            DetailsView2.DataBind();
            UpdatePanel3.Update();
        }
        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            setBsicStudentInfo();
        }

        protected void setBsicStudentInfo()
        {
            GridView3.DataSource = AdminLogic.getStudentBasicData(Session["courseID"].ToString());
            GridView3.DataBind();


        }

        protected void GridView3_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string userID = GridView3.Rows[rowIndex].Cells[1].Text.ToString();

            string userName = ((TextBox)GridView3.Rows[rowIndex].FindControl("TextBox3")).Text;

            string indexNo = ((TextBox)GridView3.Rows[rowIndex].FindControl("TextBox4")).Text;


            AdminLogic.updateStudentBasicInfo(userID, userName, indexNo);
            GridView3.EditIndex = -1;
            setBsicStudentInfo();

        }
        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

        }

    }
}