using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using System.Security.Cryptography;
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

            string password = TextBox2.Text;

            MD5 md5Hash = MD5.Create();
           
                string hash = GetMd5Hash(md5Hash, password);


            hash = hash.Substring(3, 12);


            

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();

           // course = dataContext.spLoginFinal(TextBox1.Text, hash);
            spLoginNew_Result course = dataContext.spLoginNew(TextBox1.Text, hash).FirstOrDefault();


         //   spLogin3_Result obj = course.ToList<spLogin3_Result>().FirstOrDefault();
     //  spLoginNew_Result obj = course.ToList<spLoginNew_Result>().FirstOrDefault();

            spLoginNew_Result obj = course;

            if (obj.Column1 != 0)
            {
                if (obj.Column3.Equals("Student"))
                {

                     Session["userID"] = obj.Column1;
                     Session["userName"] = obj.Column2;
                     Session["role"] = obj.Column3;
                     Session["imageURL"] = obj.Column4;
                     Session["courseID"] = obj.Column5;




                     Response.Redirect("~/PresentationLayer/Student/Home.aspx");
                }
                else if (obj.Column3.Equals("CourseAdmin"))
                {
                    Session["userID"] = obj.Column1;
                    Session["userName"] = obj.Column2;
                    Session["role"] = obj.Column3;
                    Session["imageURL"] = obj.Column4;
                    Response.Redirect("~/PresentationLayer/Admin/Home.aspx");
                }
                else if (obj.Column3.Equals("Lecturer"))
                {
                    Session["userID"] = obj.Column1;
                    Session["userName"] = obj.Column2;
                    Session["role"] = obj.Column3;
                    Session["imageURL"] = obj.Column4;
                    Response.Redirect("~/PresentationLayer/Lecturer/Home.aspx");
                }
                else if (obj.Column3.Equals("IndustryProfessional"))
                {
                    Session["userID"] = obj.Column1;
                    Session["userName"] = obj.Column2;
                    Session["role"] = obj.Column3;
                    Session["imageURL"] = obj.Column4;
                    Response.Redirect("~/PresentationLayer/IndustryProfessional/Home.aspx");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "hwaa", "alert('Either username or password incorrect');", true);
          
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
            Session["imageURL"]=imageURL;
            }
            else{
            imageURL = "~/Images/"+"Default.jpg";
            Session["imageURL"]=imageURL;
            
            }
           
          int i=RadioButtonList1.SelectedIndex;
            
            string userType="";
            if(i==0){userType="CourseAdmin";}
            else if(i==1){userType="Lecturer";}
            else if(i==2){userType="IndustryProfessional";}

            string password = TextBox7.Text;

            MD5 md5Hash = MD5.Create();

            string hash = GetMd5Hash(md5Hash, password);


            hash = hash.Substring(3, 12);

            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
         //  int val= dbcontext.spCreateUser(TextBox3.Text, userType, TextBox4.Text, TextBox5.Text, imageURL, TextBox7.Text);
          int   val = dbcontext.spCreateUserNew3(TextBox3.Text, userType, TextBox4.Text, TextBox5.Text, imageURL,hash ).FirstOrDefault()??-1;
       
        
            if (val > 0) {
               Session["userID"] = val;
               if (i == 0) {

                   Session["userName"] = TextBox3.Text;
                   Session["role"] = "CourseAdmin";
                   Session["imageURL"] =imageURL;
                   Response.Redirect("~/PresentationLayer/Admin/Home.aspx"); }
               else if (i == 1) {
                   Session["userName"] = TextBox3.Text;
                   Session["role"] = "Lecturer";
                   Session["imageURL"] = imageURL;
                   
                   Response.Redirect("~/PresentationLayer/Lecturer/Home.aspx"); }
               else if (i == 2) {
                   Session["userName"] = TextBox3.Text;
                   Session["role"] = "IndustryProfessional";
                   Session["imageURL"] = imageURL;
                   
                   Response.Redirect("~/PresentationLayer/IndustryProfessional/Home.aspx"); }
           
           }
           else{
               Response.Redirect("~/Loogin.aspx");
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex =0;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
         int val = dbcontext.validateUserName(args.Value);
            if (val == 1)
             {
                 args.IsValid = true;

             }
           else {

              args.IsValid = false;
            }
        }

        //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
        //    int val = dbcontext.validateUserName(args.Value);
        //    if (val == 1)
        //    {
        //        args.IsValid = true;

        //    }
        //    else {

        //        args.IsValid = false;
        //    }
        //}
    }

}