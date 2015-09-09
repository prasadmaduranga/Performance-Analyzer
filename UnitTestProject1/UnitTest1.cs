using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PerformanceAnalyzer2;
using System.Data;
using System.Data.SqlClient;
using System.Data.Entity;

using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace UnitTestProject1
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
       
        public void getColourForResultTest()
        {
           

            float gpa = (float)4.2;
            string colorActual;
            string colorExpected = "#66FF33";

            colorActual = PerformanceAnalyzer2.BusinessLogicLayer.StudentLogic.getColourForResult(gpa);

            Assert.AreEqual(colorExpected, colorActual);



        }

        [TestMethod]
        [Timeout(20)]
        public void TestResultForGPA()
        {


            float gpa = (float)4.2;
            string Actual;
            string Expected = "A+";

            Actual = PerformanceAnalyzer2.BusinessLogicLayer.StudentLogic.getResultForGPA(gpa);

            Assert.AreEqual(Expected, Actual);



        }

      

        [TestMethod]
        public void testAdminUserNameForUserID()
        {


            PerformanceAnalyzerDataContext dbcontext = new PerformanceAnalyzerDataContext();
           // spGetAdminData_Result admininfo = new spGetAdminData_Result();
          var   rdr = dbcontext.spGetAdminData(1);

         // spResultByUser_Result obj1 = rdr.ToList<spResultByUser_Result>().FirstOrDefault();
          spGetAdminData_Result admininfo = rdr.ToList<spGetAdminData_Result>().FirstOrDefault();

         // Assert.AreEqual("wad Kanchana", admininfo.userName);

       //  bool equility = ("wad Kanchana" == admininfo.userName);
          Assert.AreEqual("wad Kanchana" , admininfo.userName);


        }


        [TestMethod]
        public void testStudentUserNameForUserID()
        {

            spGetStudentData_Result obj=((List<spGetStudentData_Result>)PerformanceAnalyzer2.BusinessLogicLayer.StudentLogic.getStudentProfileData(6)).FirstOrDefault();
            Console.WriteLine(obj.userName + "");
            string expectedName = "WAD kanchana";
            Assert.AreEqual(expectedName, obj.userName);
           
        }

        [TestMethod]
        public void test1ValidateModuleCode()
        {
            string val = "CS2032";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateModuleCode(val);
          //  bool expected = true;

            Assert.IsTrue(actual);

        }
        [TestMethod]
        public void test2ValidateModuleCode()
        {
            string val = "C12032";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateModuleCode(val);
            //  bool expected = true;

            Assert.IsTrue(actual);

        }
        [TestMethod]
        public void test1ValidateIndex()
        {
            string val = "120357T";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateIndex(val);
            //  bool expected = true;

            Assert.IsTrue(actual);

        }
        [TestMethod]
        public void test2ValidateIndex()
        {
            string val = "120357";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateIndex(val);
            //  bool expected = true;

            Assert.IsTrue(actual);

        }
        [TestMethod]
        public void test1ValidateResult()
        {
            string val = "A+";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateResult(val);
            //  bool expected = true;

            Assert.IsTrue(actual);

        }
        [TestMethod]
        public void test2Validateresult()
        {
            string val = "F+";
            bool actual = PerformanceAnalyzer2.BusinessLogicLayer.AdminLogic.validateResult(val);
            //  bool expected = true;

            Assert.IsTrue(actual);

        }




    }
}
