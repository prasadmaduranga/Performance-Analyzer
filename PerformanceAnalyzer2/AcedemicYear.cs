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
    
    public partial class AcedemicYear
    {
        public AcedemicYear()
        {
            this.Semesters = new HashSet<Semester>();
        }
    
        public int yearID { get; set; }
        public Nullable<int> courseID { get; set; }
        public Nullable<int> yearNumber { get; set; }
    
        public virtual Course Course { get; set; }
        public virtual ICollection<Semester> Semesters { get; set; }
    }
}