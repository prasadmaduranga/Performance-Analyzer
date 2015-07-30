using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data;


namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class AdminLogic
    {

        public static object getAdminProfileData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetAdminDataNew(userid);
            // data.ToList();
            return data.ToList();


        }
        public static void  updateAdminProfileData(object userID, String userName, String email, String linkedin, String description)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spUpdateAdmin(userid, userName, email, linkedin, description);
      


        }
        public static List<Course> getbasicCourseInfo()
        {
           
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var course = dataContext.Courses.Where(x => x.courseID.Equals(1));

            return course.ToList<Course>();




        }
        public static int getMaxCourseID() {
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
           int i=dataContext.spGetMaxCourseID().FirstOrDefault()??-1;
        
           return i;
        
        }
        public static object getSemesterInformation() {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(getMaxCourseID());
            return semList.ToList();

        }
        public static void insertBasicCourseInfo(object userID,string name,string batch,string universityID,String facultyID,String departmentID,int semesterCount,int studentCount,int yearCount)
        {
            int userid = Convert.ToInt32(userID);
            int uniID=Convert.ToInt32(universityID);
            int facID=Convert.ToInt32(facultyID);

            int depID=Convert.ToInt32(departmentID);

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
           // dataContext.spUpdateBasicCourseInfo(name, batch, uniID, facID, depID,userid);
            dataContext.spInsertBasicCourseInfo(name, batch, uniID, facID, depID, userid,semesterCount,studentCount,yearCount);




        }
        public static void getSemesterInfo(object courseID)
        {
            int courseid = Convert.ToInt32(courseID.ToString());

           


        }
        public static void newFunction() { }
       
    }
}