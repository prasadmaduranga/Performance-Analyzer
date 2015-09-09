using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/*===================================STUDENT PERFORMANCE ANALYZER=====================================

 * *Bussiness logic layer :contains all logical functionalities.Acts as a intermediary  between
                       Data access layer and presentation layer
 * * IndustryProfessionalLogic.cs   : deal with all the functionalities related to user type 'Industry Professional' and cordinate  all 
 *  *                   communication between presentation layer and data access layer                             
  
 ====================================================================================================*/

namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class IndustryProfessional
    {

        /* ===== Get Semester  Informationfrom data access laer and send back to the presentation layer =========*/
        public static object getIndustryProfessionalProfileData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetIndustryProfessionalData(userid);
            // data.ToList();
            return data.ToList();


        }

        /* ===== Get Semester  Informationfrom data access laer and send back to the presentation layer =========*/
        public static int getsMaxCourseID()
        {
            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            int i = dataContext.spGetMaxCourseID().FirstOrDefault() ?? -1;

            return i;

        }


        /* ===== Get Semester  Informationfrom data access laer and send back to the presentation layer =========*/
        public static object getsSemesterInformation()
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(getMaxCourseID());
            return semList.ToList();

        }


        /* ===== Get Semester Information data access laer and send back to the presentation layer =========*/

        public static object getsSemesterInformation(int courseID)
        {

            PerformanceAnalyzerDataContext dataContext = new PerformanceAnalyzerDataContext();
            var semList = dataContext.spGetSemeterInfoNew(courseID);
            return semList.ToList();

        }


        /* Insert new course into the database via data access layer   */
        public static void insertsBasicCourseInfo(object userID, string name, string batch, string universityID, String facultyID, String departmentID, int semesterCount, int studentCount, int yearCount)
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
        public static void getsSemesterInfo(object courseID)
        {
            int courseid = Convert.ToInt32(courseID.ToString());




        }

    }
}