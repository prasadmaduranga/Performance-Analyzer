using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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
