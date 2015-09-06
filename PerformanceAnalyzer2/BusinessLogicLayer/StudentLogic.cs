using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class StudentLogic
    {

         public static object getStudentProfileData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetStudentData(userid);
            // data.ToList();
            return data.ToList();


        }
         public static object getbasicCourseInfoNew(string courseID)
         {

             PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
             int courseid = Convert.ToInt32(courseID);
             var course = dataContext.spGetCourseInformation(courseid);
    
             return course.ToList();




         }

         public static object getModuleData(object  courseID) {

             int courseid = Convert.ToInt32(courseID);
             PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
             var dataList = dbcontext.getSemesterByCourse(courseid);
             return dataList.ToList();

         }


       public static string getColourForResult(float gpa)
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

        public static string getResultForGPA(double gpa){
        
        if (gpa<=4.2 && gpa>4){
        
        return "A+";
        }
        else if (gpa <= 4 && gpa > 3.7){return "A";}
        else if (gpa <= 3.7 && gpa > 3.3) { return "A-"; }
        else if (gpa <= 3.3 && gpa > 3) { return "B+"; }
        else if (gpa <= 3 && gpa > 2.7) { return "B"; }
        else if (gpa <= 2.7 && gpa > 2.4) { return "B-"; }
        else if (gpa <= 2.4 && gpa > 2) { return "C+"; }
        else if (gpa <= 2 && gpa > 1.7) { return "C"; }
        else if (gpa <= 1.7 && gpa > 1) { return "C-"; }
        else if (gpa <= 1 && gpa > 0) { return "D"; }
        else { return "I-we/I-ca"; }


        
        }

        public static string getClassForGPA(double gpa)
        {

            if (gpa <= 4.2 && gpa >= 3.7)
            {

                return "First Class";
            }
            else if (gpa <3.7 && gpa >= 3.4) { return "Second Class-Upper Devision"; }
            else if (gpa < 3.4 && gpa >= 3) { return "Second Class-Lower Devision"; }
            else if (gpa <3 && gpa >= 1) { return "General"; }
            else if (gpa <1 && gpa >=0) { return "No Degree"; }
            else { return "TBD"; }



        }



        public static DataTable getUserVSBatch(String userID,string courseID,string moduleCode) { 
        
        PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
       
        var rdr= dbcontext.spResultByUser(userID,moduleCode);
        spResultByUser_Result obj1 = rdr.ToList<spResultByUser_Result>().FirstOrDefault();
        var rdr2 = dbcontext.spGetBatchAverage(moduleCode, Convert.ToInt32(courseID));
        double  obj2= rdr2.FirstOrDefault() ?? 0;

        //Create DataTable

        DataTable dt = new DataTable();

        //Put some columns in it.

        dt.Columns.Add(new DataColumn("Result Group", typeof(String)));

        dt.Columns.Add(new DataColumn("Result", typeof(string)));

        dt.Columns.Add(new DataColumn("GPA", typeof(double)));

        // Create the record

        DataRow dr = dt.NewRow();
        DataRow dr2 = dt.NewRow();

        try
        {

            dr["Result Group"] = obj1.indexNo;

            dr["Result"] = obj1.result;

            dr["GPA"] = obj1.GPA;

            dt.Rows.Add(dr);

            dr2["Result Group"] = "Batch";

            dr2["Result"] = getResultForGPA(obj2);

            dr2["GPA"] = Math.Round(obj2, 2);

            dt.Rows.Add(dr2);
        }
        catch (Exception er)
        {
            return null;
        }
        return dt;
        }

        public static string getCustomColour(float gpa)
        {


            if (gpa <= 4.2 && gpa > 4) { return "#00FF99"; }
            else if (gpa <= 4 && gpa > 3.7) { return "#66FF33"; }
            else if (gpa <= 3.7 && gpa > 3.3) { return "#66FF66"; }
            else if (gpa <= 3.3 && gpa > 3) { return "#7575FF"; }
            else if (gpa <= 3 && gpa > 2.7) { return "#9494FF"; }
            else if (gpa <= 2.7 && gpa > 2.4) { return "#FF6600"; }
            else if (gpa <= 2.4 && gpa > 2) { return "	#FF6633"; }
            else if (gpa <= 2 && gpa > 1.7) { return "#FF9933"; }
            else if (gpa <= 1.7 && gpa > 1) { return "#FF8533"; }
            else if (gpa <= 1 && gpa > 0) { return "#D11919"; }
            else { return "#D11919"; }

        }
    }
  
    }
