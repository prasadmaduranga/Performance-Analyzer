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
    
    public partial class Course
    {
        public Course()
        {
            this.AcedemicYears = new HashSet<AcedemicYear>();
            this.Students = new HashSet<Student>();
            this.Members = new HashSet<Member>();
        }
    
        public int courseID { get; set; }
        public string name { get; set; }
        public string batch { get; set; }
        public Nullable<int> universityID { get; set; }
        public Nullable<int> facultyID { get; set; }
        public Nullable<int> departmentID { get; set; }
        public Nullable<int> adminID { get; set; }
    
        public virtual ICollection<AcedemicYear> AcedemicYears { get; set; }
        public virtual CourseAdmin CourseAdmin { get; set; }
        public virtual Department Department { get; set; }
        public virtual Faculty Faculty { get; set; }
        public virtual University University { get; set; }
        public virtual ICollection<Student> Students { get; set; }
        public virtual ICollection<Member> Members { get; set; }
    }
}
