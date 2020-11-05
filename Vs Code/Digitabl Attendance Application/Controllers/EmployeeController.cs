using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Digitabl_Attendance_Application.Models;

namespace Digitabl_Attendance_Application.Controllers
{
    public class EmployeeController : Controller
    {
        private DigitalAttendanceSystemEntities db = new DigitalAttendanceSystemEntities();

        // GET: Employee
        public ActionResult Index()
        {
            return View(db.employee_attendance_tbl.ToList());
        }

        // GET: Employee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            employee_attendance_tbl employee_attendance_tbl = db.employee_attendance_tbl.Find(id);
            if (employee_attendance_tbl == null)
            {
                return HttpNotFound();
            }
            return View(employee_attendance_tbl);
        }

        // GET: Employee/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Employee/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,WorkDate,TimeIn,TimeOut,TotalHours,EmployeeId")] employee_attendance_tbl employee_attendance_tbl)
        {
            if (ModelState.IsValid)
            {
                db.employee_attendance_tbl.Add(employee_attendance_tbl);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(employee_attendance_tbl);
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            employee_attendance_tbl employee_attendance_tbl = db.employee_attendance_tbl.Find(id);
            if (employee_attendance_tbl == null)
            {
                return HttpNotFound();
            }
            return View(employee_attendance_tbl);
        }

        // POST: Employee/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,WorkDate,TimeIn,TimeOut,TotalHours,EmployeeId")] employee_attendance_tbl employee_attendance_tbl)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee_attendance_tbl).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(employee_attendance_tbl);
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            employee_attendance_tbl employee_attendance_tbl = db.employee_attendance_tbl.Find(id);
            if (employee_attendance_tbl == null)
            {
                return HttpNotFound();
            }
            return View(employee_attendance_tbl);
        }

        // POST: Employee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            employee_attendance_tbl employee_attendance_tbl = db.employee_attendance_tbl.Find(id);
            db.employee_attendance_tbl.Remove(employee_attendance_tbl);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
