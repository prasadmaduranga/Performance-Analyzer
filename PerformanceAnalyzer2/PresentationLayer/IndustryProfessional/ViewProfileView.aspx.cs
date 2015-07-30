﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PerformanceAnalyzer2.BusinessLogicLayer;

namespace PerformanceAnalyzer2.PresentationLayer.IndustryProfessional
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userID"] = 5;
            DetailsView1.DataSource = PerformanceAnalyzer2.BusinessLogicLayer.IndustryProfessional.getIndustryProfessionalProfileData(Session["userID"]);
            DetailsView1.DataBind();
        }
    }
}