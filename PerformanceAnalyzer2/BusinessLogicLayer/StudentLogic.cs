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
    }
    }
