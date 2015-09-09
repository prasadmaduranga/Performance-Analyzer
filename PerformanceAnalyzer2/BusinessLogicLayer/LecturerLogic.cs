using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


/*===================================STUDENT PERFORMANCE ANALYZER=====================================

 * *Bussiness logic layer :contains all logical functionalities.Acts as a intermediary  between
                       Data access layer and presentation layer
 * * LecturerLogic.cs   : deal with all the functionalities related to user type 'Industry Professional' and cordinate  all 
 *  *                   communication between presentation layer and data access layer                             
  
 ====================================================================================================*/

namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class LecturerLogic
    {
         public static object getLecturerData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetLectureData(userid);

            // data.ToList();
            return data.ToList();


        }
    }
    }
