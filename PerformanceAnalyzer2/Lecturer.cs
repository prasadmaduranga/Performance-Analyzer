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
    
    public partial class Lecturer : Member
    {
        public Nullable<int> universityID { get; set; }
        public Nullable<int> facultyID { get; set; }
        public Nullable<int> departmentID { get; set; }
        public string description { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual Faculty Faculty { get; set; }
        public virtual University University { get; set; }
    }
}
