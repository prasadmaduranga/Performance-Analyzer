using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data;



/*===================================STUDENT PERFORMANCE ANALYZER=====================================

 * *Bussiness logic layer :contains all logical functionalities.Acts as a intermediary  between
                       Data access layer and presentation layer
 * * Adminlogic.cs   : deal with all the functionalities related to user type 'admin' and cordinate  all 
 *                     communication between presentation layer and data access layer                             
  
 ====================================================================================================*/
namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class AdminLogic
    {

        /* ===== Get admin data from data access laer and send back to the presentation layer =========*/

        public static object getAdminProfileData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetAdminDataNew(userid);
            // data.ToList();
            return data.ToList();


        }

        /* =====Update admin data and send to  data access layer  =========*/

        public static void updateAdminProfileData(object userID, String userName, String email, String linkedin, String description)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spUpdateAdmin(userid, userName, email, linkedin, description);



        }


        /* ===== Get admin data from data access laer and send back to the presentation layer =========*/
        public static List<Course> getbasicCourseInfo()
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var course = dataContext.Courses.Where(x => x.courseID.Equals(1));

            return course.ToList<Course>();




        }


        /* ===== Get Max course id from data access laer and send back to the presentation layer =========*/
        /* ===== used when inserting new course===========================================================*/

        public static int getMaxCourseID()
        {
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            int i = dataContext.spGetMaxCourseID().FirstOrDefault() ?? -1;

            return i;

        }


        /* ===== Get Semester  Informationfrom data access laer and send back to the presentation layer =========*/
        public static object getSemesterInformation()
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(getMaxCourseID());
            return semList.ToList();

        }


        /* ===== Get Semester Information data access laer and send back to the presentation layer =========*/
     
        public static object getSemesterInformation(int courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(courseID);
            return semList.ToList();

        }


        /* Insert new course into the database via data access layer   */
        public static void insertBasicCourseInfo(object userID, string name, string batch, string universityID, String facultyID, String departmentID, int semesterCount, int studentCount, int yearCount)
        {
            int userid = Convert.ToInt32(userID);                    //Set up insert parameters
            int uniID = Convert.ToInt32(universityID);
            int facID = Convert.ToInt32(facultyID);

            int depID = Convert.ToInt32(departmentID);

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            // dataContext.spUpdateBasicCourseInfo(name, batch, uniID, facID, depID,userid);
            dataContext.spInsertBasicCourseInfo(name, batch, uniID, facID, depID, userid, semesterCount, studentCount, yearCount);




        }


        /* ===== Get Semester  Informationfrom data access laer and send back to the presentation layer =========*/
        public static void getSemesterInfo(object courseID)
        {
            int courseid = Convert.ToInt32(courseID.ToString());




        }

        /* ===== Getm  get tModule By Semester data access laer and send back to the presentation layer =========*/
                public static object getModuleBySemester(String semesterID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var dataSet = dataContext.spGetModuleInfoBySemesterNew2(Convert.ToInt32(semesterID));
            return dataSet.ToList();
        }


       /* ============== Delete module BySemester data access laer and send back to the presentation layer =========*/
        public static void deletemoduleBySemester(String semesterID, string moduleCode)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spDeleteModuleBySemester(Convert.ToInt32(semesterID), moduleCode);

        }

        /* ==============Get Student Basic Data using data access laer and send back to the presentation layer =========*/
        public static object getStudentBasicData(String courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var dataSet = dataContext.getStudentBasicInfoNew(Convert.ToInt32(courseID));
            return dataSet.ToList();

        }

        /* ==============update Student Basic Info using data access layer and send back to the presentation layer =========*/
         public static void updateStudentBasicInfo(String courseID, string userName, String indexNO)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spUpdateStudentBasicInfo(Convert.ToInt32(courseID), userName, indexNO);


        }

         /* ==============Get Module By Semester data access laer and send back to the presentation layer =========*/

        public static void spSetCommonPassword(String courseID, string password)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spSetCommonPasswordNew(Convert.ToInt32(courseID), password);
            // dataContext.spSetCommonPassword(Convert.ToInt32(courseID), password);


        }

        /* ==============Edit Basic Course Info using  data access laer and send back to the presentation layer =========*/

        public static void spEditBasicCourseInfo(String courseID, string name, string batch, int uniID, int facID, int deptID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            dataContext.spEditBasicCourseInfo(Convert.ToInt32(courseID), name, batch, uniID, facID, deptID);


        }

        /* ==============get basic Course Info usiing data access laer and send back to the presentation layer =========*/

        public static object getbasicCourseInfoNew(string courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            int courseid = Convert.ToInt32(courseID);
            var course = dataContext.spGetCourseInformation(courseid);

            return course.ToList();




        }

        /* ==============get Student enrollment Info data access laer and send back to the presentation layer =========*/

        public static object getStudentenrollmentInfo(int courseID, string moduleCode)
        {

            PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
            var resultSet = dbContext.spGetStudentInfoForResultNew(courseID, moduleCode);
            return resultSet.ToList();

        }

        /* ==============update Result using data access laer and send back to the presentation layer =========*/

        public static void updateResult(int userID, String moduleCode, string result)
        {
            PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
            dbContext.spInsertEnrollment(userID, moduleCode, result);


        }

        /* ==============create Enrollments using  data access laer and send back to the presentation layer =========*/

        public static void createEnrollments(int courseID, string moduleCode)
        {

            PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
            dbContext.spCreateEnrollments(courseID, moduleCode);

        }

        /* ==============input Text Stream Results using data access laer and send back to the presentation layer =========*/

        public static void inputTextStreamResults(int courseID, string textStream, string moduleCode)
        {

            string[] words = textStream.Split(' ');

            int count = words.Length;

            for (int i = 0; i <= count - 2; i++)
            {
                if (validateIndex(words[i]) && validateResult(words[i++]))
                {

                    PerformanceAnalyzerDataContext dbContext = new PerformanceAnalyzerDataContext();
                    dbContext.insertResultByText2(words[i], words[i + 1], moduleCode);

                }
            }








        }


        /* ==============Get Module By Semester data access laer and send back to the presentation layer =========*/

        public static bool validateModuleCode(String moduleCode)
        {


            if ((moduleCode.Length == 6) && (char.IsLetter(moduleCode, 0)) && (char.IsLetter(moduleCode, 1)))
            {

                return true;
            }
            else
            {
                return false;
            }
        }

        /* ==============Get Module By Semester data access laer and send back to the presentation layer =========*/

        public static bool validateIndex(String moduleCode)
        {
            if ((moduleCode.Length == 7) && (char.IsLetter(moduleCode, 6)) && (char.IsNumber(moduleCode, 0)) && (char.IsNumber(moduleCode, 1)) && (char.IsNumber(moduleCode, 2)) && (char.IsNumber(moduleCode, 3)))
            {

                return true;
            }
            else
            {
                return false;
            }

        }

        /* ==============Get Module By Semester data access laer and send back to the presentation layer =========*/

        public static bool validateResult(String moduleCode)
        {
            if (moduleCode.Equals("A+") || moduleCode.Equals("A+") || moduleCode.Equals("A+") || moduleCode.Equals("A+") || moduleCode.Equals("A-") || moduleCode.Equals("B+") || moduleCode.Equals("B") || moduleCode.Equals("B-") || moduleCode.Equals("C+") ||
                moduleCode.Equals("C") || moduleCode.Equals("C-") || moduleCode.Equals("D") || moduleCode.Equals("I-wa") || moduleCode.Equals("I-ca"))
            {

                return true;
            }
            else
            {

                return false;
            }

        }
    }
}