//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PerformanceAnalyzer2
{
    using System;
    using System.Collections.Generic;
    
    public partial class Enrollment
    {
        public int userID { get; set; }
        public string moduleCode { get; set; }
        public string result { get; set; }
        public Nullable<System.DateTime> dateOfResult { get; set; }
    
        public virtual Module Module { get; set; }
        public virtual ResultMapping ResultMapping { get; set; }
        public virtual Member Member { get; set; }
    }
}
