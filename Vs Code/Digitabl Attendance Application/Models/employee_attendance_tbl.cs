//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Digitabl_Attendance_Application.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class employee_attendance_tbl
    {
        public int Id { get; set; }
        public System.DateTime WorkDate { get; set; }
        public Nullable<System.DateTime> TimeIn { get; set; }
        public Nullable<System.DateTime> TimeOut { get; set; }
        public Nullable<decimal> TotalHours { get; set; }
        public int EmployeeId { get; set; }
        public Nullable<System.DateTime> FirstTimeIn { get; set; }
        public Nullable<System.DateTime> FirstTimeOut { get; set; }
        public Nullable<System.DateTime> SecondTimeIn { get; set; }
        public Nullable<System.DateTime> SecondTimeOut { get; set; }
    }
}