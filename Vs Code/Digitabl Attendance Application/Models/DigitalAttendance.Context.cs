﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DigitalAttendanceSystemEntities : DbContext
    {
        public DigitalAttendanceSystemEntities()
            : base("name=DigitalAttendanceSystemEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<department_tbl> department_tbl { get; set; }
        public virtual DbSet<employee_attendance_tbl> employee_attendance_tbl { get; set; }
        public virtual DbSet<employee_tbl> employee_tbl { get; set; }
    }
}