using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
    }
    }
