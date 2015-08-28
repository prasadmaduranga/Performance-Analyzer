using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.Admin
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 1;
            
            if (!IsPostBack)
            {
                int activeViewIndexVal = Convert.ToInt32(Request.QueryString["activeView"]);
                string activeViewIndex = (String)Request.QueryString["activeView"];
                string initRequest = (String)Request.QueryString["initial"];
                if (initRequest!=null &&  initRequest.Equals("0")) {
                    Session["courseID"] = null;
                }


                if (Session["courseID"] == null)
                {
                    foreach (MenuItem item in Menu1.Items)
                    {
                        if (item.Text == "Step2: Acedemic Info" || item.Text == "Step3: Student Info" || item.Text == "Step4: Finish")
                        {
                            item.Enabled = false;
                        }
                    }
                }
                else {
                    foreach (MenuItem item in Menu1.Items)
                    {
                        if (item.Text == "Step2: Acedemic Info" || item.Text == "Step3: Student Info" || item.Text == "Step4: Finish")
                        {
                            item.Enabled = true;
                        }
                    }
                
                }
                switch (activeViewIndex)
                {
                    case "0": MultiView1.ActiveViewIndex = activeViewIndexVal;
                        break;
                    case "1":
                        loadGridviewSemester();
                        MultiView1.ActiveViewIndex = activeViewIndexVal;

                        break;
                    case "2":

                        setBsicStudentInfo();
                        MultiView1.ActiveViewIndex = activeViewIndexVal;
                        break;
                    case "3":

                        MultiView1.ActiveViewIndex = activeViewIndexVal;
                        break;

                }
            }


        }

        protected void Page_PreRender(object sender, EventArgs e)
        { 
      
        }

        public void lbi_Click(object sender, EventArgs e)
        {
          
        }

        protected void loadGridviewSemester() {

            GridView1.DataSource = AdminLogic.getSemesterInformation();
            GridView1.DataBind();
            DetailsView2.Visible = false;


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
            string name = ((TextBox)(DetailsView1.Rows[0].Cells[1].FindControl("TextBox1"))).Text;
            string batch = ((DropDownList)(DetailsView1.Rows[1].Cells[1].FindControl("DropDownList7"))).SelectedValue.ToString();
            string universityID = ((DropDownList)(DetailsView1.Rows[2].Cells[1].FindControl("DropDownList2"))).SelectedValue.ToString();
            string facID = ((DropDownList)(DetailsView1.Rows[3].Cells[1].FindControl("DropDownList3"))).SelectedValue.ToString();
            string deptID = ((DropDownList)(DetailsView1.Rows[4].Cells[1].FindControl("DropDownList4"))).SelectedValue.ToString();
            int studentCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[5].Cells[1].FindControl("TextBox2"))).Text);
            int yearCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[6].Cells[1].Controls[0].FindControl("TextBox3"))).Text);

            int semesterCount = Convert.ToInt32(((TextBox)(DetailsView1.Rows[7].Cells[1].Controls[0].FindControl("TextBox4"))).Text);

            AdminLogic.insertBasicCourseInfo(Session["userID"], name, batch, universityID, facID, deptID,semesterCount,studentCount,yearCount);

            Session["courseID"] = AdminLogic.getMaxCourseID();
          
            Response.Redirect("NewCourseView.aspx?activeView=1");
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
          
          
           
          
        }

        protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Session["selectedSemester"] = GridView1.SelectedValue;

            if (GridView1.SelectedValue != null)
            {
                this.setGriview2(GridView1.SelectedValue.ToString());
            }
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

        protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            SqlDataSource6.InsertParameters["semesterID"].DefaultValue = GridView1.SelectedValue.ToString();
            SqlDataSource6.InsertParameters["moduleCode"].DefaultValue = ((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedValue;

            SqlDataSource6.InsertParameters["lecturerName"].DefaultValue = ((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text;
            SqlDataSource6.Insert();
            
            Session["selectedSemester"] = GridView1.SelectedValue;

        }

        protected void SqlDataSource7_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void DetailsView2_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
          
        }

        protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            //((DropDownList)DetailsView2.Rows[1].Cells[1].FindControl("DropDownList6")).SelectedIndex = 0;
            //((TextBox)DetailsView2.Rows[2].Cells[1].FindControl("TextBox1")).Text = "";
            //if (GridView1.SelectedValue != null)
            //{
            //    this.setGriview2(GridView1.SelectedValue.ToString());

            //}
            //this.DetailsView2.DataBind();

            GridView2.Visible = true;
                this.setGriview2(GridView1.SelectedValue.ToString());



              
            DetailsView2.DataBind();

           
          

            UpdatePanel3.Update();


        }

        protected void UpdatePanel3_Load(object sender, EventArgs e)
        {
            //if (GridView1.SelectedValue != null)
            //{
            //    this.setGriview2(GridView1.SelectedValue.ToString());
            //}

        }

        protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int rowIndex = e.RowIndex;
          string semID = GridView2.Rows[rowIndex].Cells[1].Text;
           string modCode= GridView2.Rows[rowIndex].Cells[2].Text;

           AdminLogic.deletemoduleBySemester(semID, modCode);

           this.setGriview2(GridView1.SelectedValue.ToString());
        }

        protected void DetailsView2_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
        {

        }

        protected void setGriview2(string semesterID) {
            GridView2.DataSource = AdminLogic.getModuleBySemester(semesterID);
            GridView2.DataBind();
            if (GridView2.Visible == false) {
                GridView2.Visible = true;
            }
            UpdatePanel3.Update();
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           

            GridView3.DataSource = AdminLogic.getStudentBasicData(Session["courseID"].ToString());
            GridView3.DataBind();
           
            Response.Redirect("NewCourseView.aspx?activeView=2");
        }

        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            Session["courseID"] = AdminLogic.getMaxCourseID();
            

        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView3.EditIndex = e.NewEditIndex;
            setBsicStudentInfo();
        }

        protected void setBsicStudentInfo() {
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

        protected void Button3_Click(object sender, EventArgs e)
        {
          
                string password = TextBox5.Text;

            MD5 md5Hash = MD5.Create();
           
                string hash = GetMd5Hash(md5Hash, password);


            hash = hash.Substring(3, 12);


            AdminLogic.spSetCommonPassword(Session["courseID"].ToString(), hash);
            Response.Redirect("CourseView.aspx?courseID=" + Session["courseID"].ToString());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
         
            Response.Redirect("NewCourseView.aspx?activeView=3" );
        }

        protected void GridView3_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
         
        }

        protected void DropDownList6_DataBound(object sender, EventArgs e)
        {
           
            

        }

        protected void DropDownList6_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {
            if (e.Item.Enabled == true && e.Item.Text == "Step1: Basic Info") {
                MultiView1.ActiveViewIndex = 0;
                e.Item.Selected = true;
            }
            else if (e.Item.Enabled == true && e.Item.Text == "Step2: Acedemic Info")
            {
                MultiView1.ActiveViewIndex = 1;
                e.Item.Selected = true;

            }
            else if (e.Item.Enabled == true && e.Item.Text == "Step3: Student Info")
            {
                MultiView1.ActiveViewIndex = 2;
                e.Item.Selected = true;

            }
            else if (e.Item.Enabled == true && e.Item.Text == "Step4: Finish")
            {
                MultiView1.ActiveViewIndex = 3;
                e.Item.Selected = true;

            }
           
        }


        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash. 
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }
      
       
        
    }
}