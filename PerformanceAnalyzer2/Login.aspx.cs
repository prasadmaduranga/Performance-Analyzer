using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using PerformanceAnalyzer2.BusinessLogicLayer;
namespace PerformanceAnalyzer2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                // Page.Form.Attributes.Add("enctype", "multipart/form-data");}
               
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();

            var course = dataContext.spLogin3(TextBox1.Text, TextBox2.Text);

            spLogin3_Result obj = course.ToList<spLogin3_Result>().FirstOrDefault();

            if (obj.acceptStatus == 1)
            {
                if (obj.userType.Equals("Student"))
                {
                    // Session["userID"] = obj.userID;
                    Response.Redirect("~/PresentationLayer/Student/Home.aspx");
                }
                else if (obj.userType.Equals("CourseAdmin"))
                {
                    // Session["userID"] = obj.userID;
                    Response.Redirect("~/PresentationLayer/Admin/Home.aspx");
                }
                else if (obj.userType.Equals("Lecturer"))
                {
                    // Session["userID"] = obj.userID;
                    Response.Redirect("~/PresentationLayer/Lecturer/Home.aspx");
                }
                else if (obj.userType.Equals("IndustryProfessional"))
                {
                    // Session["userID"] = obj.userID;
                    Response.Redirect("~/PresentationLayer/IndustryProfessional/Home.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Either username or password incorrect');", true);
                TextBox1.Text = "";
                TextBox2.Text = "";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                String extension = System.IO.Path.GetExtension(FileUpload1.FileName);
                if (extension.Equals(".PNG", StringComparison.InvariantCultureIgnoreCase) || extension.Equals(".jpeg", StringComparison.InvariantCultureIgnoreCase) || extension.Equals(".jpg", StringComparison.InvariantCultureIgnoreCase))
                {
                    FileUpload1.SaveAs(Server.MapPath("~/Images/" + FileUpload1.FileName));
                }
                else
                {
                    ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Incompatible File Format');", true);
                    FileUpload1.Attributes.Clear();

                }
            }
            else {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Choose an image');", true);
                
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string imageURL="";
            if (FileUpload1.HasFile) {
                imageURL = "~/Images/"+FileUpload1.FileName;
            
            }
            int i=RadioButtonList1.SelectedIndex;
            string userType="";
            if(i==0){userType="CourseAdmin";}
            else if(i==1){userType="Lecturer";}
            else if(i==2){userType="IndustryProfessional";}

            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
           int val= dbcontext.spCreateUser(TextBox3.Text, userType, TextBox4.Text, TextBox5.Text, imageURL, TextBox7.Text);
           if (val > 0) {
               Session["userID"] = val;
               if (i == 0) { Response.Redirect("~/PresentationLayer/Admin/Home.aspx"); }
               else if (i == 1) { Response.Redirect("~/PresentationLayer/Lecturer/Home.aspx"); }
               else if (i == 2) { Response.Redirect("~/PresentationLayer/IndustryProfessional/Home.aspx"); }
           
           }
           else{
               Response.Redirect("~/Loogin.aspx");
           }

        }
    }

}