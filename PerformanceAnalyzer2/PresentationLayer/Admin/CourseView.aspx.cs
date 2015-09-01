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
                            DetailsView2.Visible = false;
                            break;
                        case "2":
                            MultiView1.ActiveViewIndex = activeViewIndexVal;
                            break;
                    }
                }
                else  if (Request.QueryString["courseID"] != null)
                {
                    Session["courseID"] = Request.QueryString["courseID"].ToString();
                    MultiView1.ActiveViewIndex = 0;
                 //   DropDownList1.SelectedValue = Session["courseID"].ToString();
                    DropDownList1.DataBind();
                    DropDownList1.SelectedIndex = DropDownList1.Items.IndexOf(DropDownList1.Items.FindByValue(Session["courseID"].ToString()));

                   // sqldatasource11.selectparameters["courseid"].defaultvalue = session["courseid"].tostring();
                    //sqldatasource11.databind();
                    SqlDataSource10.DataBind();
                   DetailsView1.DataSource = SqlDataSource10;
                   DetailsView1.DataBind();

                    //DetailsView1.DataSource = SqlDataSource11;
                    //DetailsView1.DataBind();
                        
                  loadGridviewSemester();
                  setBsicStudentInfo();

                }
                else {
                    DetailsView2.Visible = false;
                    MultiView1.ActiveViewIndex = 0;
                
                }
            }   
            else if(GridView1.SelectedIndex<0){
                DetailsView2.Visible = false;
            
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string name = ((TextBox)(DetailsView1.Rows[1].Cells[1].FindControl("TextBox1"))).Text;
            string batch = ((DropDownList)(DetailsView1.Rows[2].Cells[1].FindControl("DropDownList5"))).SelectedValue.ToString();
            string universityID = ((DropDownList)(DetailsView1.Rows[3].Cells[1].FindControl("DropDownList6"))).SelectedValue.ToString();
            string facID = ((DropDownList)(DetailsView1.Rows[4].Cells[1].FindControl("DropDownList7"))).SelectedValue.ToString();
            string deptID = ((DropDownList)(DetailsView1.Rows[5].Cells[1].FindControl("DropDownList8"))).SelectedValue.ToString();

       //     AdminLogic.spEditBasicCourseInfo(Session["courseID"].ToString(), name, batch, Convert.ToInt32(universityID), Convert.ToInt32(facID), Convert.ToInt32(deptID));
            SqlDataSource10.UpdateParameters["name"].DefaultValue = name;
            SqlDataSource10.UpdateParameters["batch"].DefaultValue = batch;
            SqlDataSource10.UpdateParameters["universityID"].DefaultValue = universityID;
            SqlDataSource10.UpdateParameters["facultyID"].DefaultValue = facID;
            SqlDataSource10.UpdateParameters["departmentID"].DefaultValue = deptID;
            SqlDataSource10.UpdateParameters["courseID"].DefaultValue = Session["courseID"].ToString();

            SqlDataSource10.Update();
            DetailsView1.DataSource = SqlDataSource10;
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
            DetailsView1.DataBind();
            


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
       //     DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew2(DropDownList1.SelectedValue);
          // DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew2(DropDownList1.SelectedValue);
          //  AdminLogic.getbasicCourseInfoNew
            DetailsView1.DataSource = SqlDataSource10;

            DetailsView1.DataBind();

            loadGridviewSemester();
            setBsicStudentInfo();
        }

        protected void DropDownList1_SelectedIndexChanged()
        {

            if (DetailsView2.Visible == false && !DropDownList1.SelectedValue.Equals("0"))
            {
                DetailsView2.Visible = true;
            }
            Session["courseID"] = Convert.ToInt32(DropDownList1.SelectedValue);
            //     DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew2(DropDownList1.SelectedValue);
            // DetailsView1.DataSource = AdminLogic.getbasicCourseInfoNew2(DropDownList1.SelectedValue);
            //  AdminLogic.getbasicCourseInfoNew
            DetailsView1.DataSource = SqlDataSource10;

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

            if (GridView1.SelectedIndex>=0)
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
            try
            {
                SqlDataSource6.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();
           
            
            SqlDataSource6.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedValue;

            SqlDataSource6.InsertParameters["lecturerName"].DefaultValue = ((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource6.Insert();

            Session["selectedSemester"] = GridView1.SelectedValue;
            }
            catch (Exception er)
            {
          ClientScript.RegisterStartupScript(this.GetType(),"", "alert('Select a semester')", true);
            }

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

        protected void DetailsView2_PreRender(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemCommand(object sender, DetailsViewCommandEventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.Edit);           
                DetailsView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (GridView1.SelectedIndex < 0) {
                DetailsView2.Visible = false;
            
            }
        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
          
        }

        //protected void  insertButton_click()
        //{
        //    try
        //    {
        //        SqlDataSource6.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();


        //        SqlDataSource6.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedValue;

        //        SqlDataSource6.InsertParameters["lecturerName"].DefaultValue = ((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text;
        //        SqlDataSource6.Insert();

        //        Session["selectedSemester"] = GridView1.SelectedValue;
        //    }
        //    catch (Exception er)
        //    {
        //        ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Select a semester')", true);
        //    }
        //    GridView2.Visible = true;
        //    this.setGriview2(GridView1.SelectedValue.ToString());
        //    DetailsView2.DataBind();
        //    UpdatePanel3.Update();
        //}

        protected void insertButton_click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource6.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();


                SqlDataSource6.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedValue;

                SqlDataSource6.InsertParameters["lecturerName"].DefaultValue = ((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text;
                SqlDataSource6.Insert();

                Session["selectedSemester"] = GridView1.SelectedValue;
            }
            catch (Exception er)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "alert('Select a semester')", true);
            }
            GridView2.Visible = true;
            this.setGriview2(GridView1.SelectedValue.ToString());
            DetailsView2.DataBind();
            UpdatePanel3.Update();
        }

        protected void GridView3_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView3.PageIndex = e.NewPageIndex;
            GridView3.DataSource = AdminLogic.getStudentBasicData(Session["courseID"].ToString());
            GridView3.DataBind();
        }

        

    }
}