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
    
    public partial class Department
    {
        public Department()
        {
            this.Courses = new HashSet<Course>();
            this.Lecturers = new HashSet<Lecturer>();
            this.Students = new HashSet<Student>();
        }
    
        public int departmentID { get; set; }
        public Nullable<int> facultyID { get; set; }
        public string name { get; set; }
    
        public virtual ICollection<Course> Courses { get; set; }
        public virtual Faculty Faculty { get; set; }
        public virtual ICollection<Lecturer> Lecturers { get; set; }
        public virtual ICollection<Student> Students { get; set; }
    }
}