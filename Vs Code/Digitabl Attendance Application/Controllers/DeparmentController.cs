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
    public class DeparmentController : Controller
    {
        private DigitalAttendanceSystemEntities db = new DigitalAttendanceSystemEntities();

        // GET: Deparment
        public ActionResult Index()
        {
            return View(db.department_tbl.ToList());
        }

        // GET: Deparment/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            department_tbl department_tbl = db.department_tbl.Find(id);
            if (department_tbl == null)
            {
                return HttpNotFound();
            }
            return View(department_tbl);
        }

        // GET: Deparment/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Deparment/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "DepartmentId,DepartmentName")] department_tbl department_tbl)
        {
            if (ModelState.IsValid)
            {
                db.department_tbl.Add(department_tbl);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(department_tbl);
        }

        // GET: Deparment/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            department_tbl department_tbl = db.department_tbl.Find(id);
            if (department_tbl == null)
            {
                return HttpNotFound();
            }
            return View(department_tbl);
        }

        // POST: Deparment/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "DepartmentId,DepartmentName")] department_tbl department_tbl)
        {
            if (ModelState.IsValid)
            {
                db.Entry(department_tbl).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(department_tbl);
        }

        // GET: Deparment/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            department_tbl department_tbl = db.department_tbl.Find(id);
            if (department_tbl == null)
            {
                return HttpNotFound();
            }
            return View(department_tbl);
        }

        // POST: Deparment/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            department_tbl department_tbl = db.department_tbl.Find(id);
            db.department_tbl.Remove(department_tbl);
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
