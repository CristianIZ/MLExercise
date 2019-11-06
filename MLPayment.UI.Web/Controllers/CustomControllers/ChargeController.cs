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
    public class ChargeController : Controller
    {
        // GET: Charge
        public ActionResult Index()
        {
            var ep = new ChargeProcess();
            var lista = ep.GetTop1000();
            return View("Index", lista);
        }

        // GET: Charge/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Charge/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Charge/Create
        [HttpPost]
        public ActionResult Create(ChargeDto chargeDto)
        {
            try
            {
                var charge = ChargeModel.MapCharge(chargeDto);
                var ep = new ChargeProcess();
                var lista = ep.Add(chargeDto.IdUser, charge);

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Charge/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Charge/Edit/5
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

        // GET: Charge/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Charge/Delete/5
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
