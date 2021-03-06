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
    
    public partial class Member
    {
        public Member()
        {
            this.Enrollments = new HashSet<Enrollment>();
            this.Messages = new HashSet<Message>();
            this.Messages1 = new HashSet<Message>();
            this.TelephoneNumbers = new HashSet<TelephoneNumber>();
        }
    
        public int userID { get; set; }
        public string userName { get; set; }
        public string email { get; set; }
        public string linkedin { get; set; }
        public string imageURL { get; set; }
        public Nullable<System.DateTime> lastLoginDate { get; set; }
        public Nullable<System.DateTime> lastMessageView { get; set; }
        public string password { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
    
        public virtual ICollection<Enrollment> Enrollments { get; set; }
        public virtual ICollection<Message> Messages { get; set; }
        public virtual ICollection<Message> Messages1 { get; set; }
        public virtual ICollection<TelephoneNumber> TelephoneNumbers { get; set; }
    }
}
