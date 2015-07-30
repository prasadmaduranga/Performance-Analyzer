using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PerformanceAnalyzer2.BusinessLogicLayer
{
    public class IndustryProfessional
    {


        public static object getIndustryProfessionalProfileData(object userID)
        {
            int userid = Convert.ToInt32(userID);
            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
            var data = dbcontext.spGetIndustryProfessionalData(userid);
            // data.ToList();
            return data.ToList();


        }
    }
}