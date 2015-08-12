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
        public static object getSemesterInformation(int courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(courseID);
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
        public static object  getModuleBySemester(String semesterID) {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var dataSet=dataContext.spGetModuleInfoBySemesterNew(Convert.ToInt32(semesterID));
            return dataSet.ToList();
        }
        public static void deletemoduleBySemester(String semesterID,string moduleCode)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
           dataContext.spDeleteModuleBySemester(Convert.ToInt32(semesterID), moduleCode);
            
        }
        public static object getStudentBasicData(String courseID) {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var dataSet = dataContext.getStudentBasicInfoNew(Convert.ToInt32(courseID));
            return dataSet.ToList();
        
        }
        public static void updateStudentBasicInfo(String courseID,string userName,String indexNO)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spUpdateStudentBasicInfo(Convert.ToInt32(courseID), userName, indexNO);
          

        }


        public static void spSetCommonPassword(String courseID, string password)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spSetCommonPassword(Convert.ToInt32(courseID), password);


        }
        public static void spEditBasicCourseInfo(String courseID, string name,string batch,int uniID,int facID,int deptID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spEditBasicCourseInfo(Convert.ToInt32(courseID), name, batch, uniID, facID, deptID);


        }

        public static object getbasicCourseInfoNew(string courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            int courseid = Convert.ToInt32(courseID);
            var course = dataContext.spGetCourseInformation(courseid);

            return course.ToList();




        }


        public static object getStudentenrollmentInfo(int courseID,string moduleCode) { 
        
            PerformanceAnalyzerDataContext dbContext=new PerformanceAnalyzerDataContext();
            var resultSet = dbContext.spGetStudentInfoForResultNew(courseID, moduleCode);
            return resultSet.ToList();

        }

        public static void updateResult(int userID, String moduleCode, string result) {
            PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
            dbContext.spInsertEnrollment(userID, moduleCode, result);

        
        }

        public static void createEnrollments(int courseID, string moduleCode) {

            PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
            dbContext.spCreateEnrollments(courseID, moduleCode);

        }
    }
}