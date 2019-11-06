using MLPayment.UI.Process;
using MLPayment.UI.Web.Dtos;
using MLPayment.UI.Web.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MLPayment.UI.Web.Controllers
{
    public class BillController : Controller
    {
        // GET: Bill
        public ActionResult Index()
        {
            var ep = new BillProcess();
            var lista = ep.GetTop1000();
            return View("Index", lista);
        }

        // GET: Bill/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Bill/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Bill/Create
        [HttpPost]
        public ActionResult Create(BillDto billDto)
        {
            try
            {
                var bill = BillModel.MapBill(billDto);
                var ep = new BillProcess();
                var lista = ep.Add(billDto.IdUser, bill);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Bill/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Bill/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Bill/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Bill/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
