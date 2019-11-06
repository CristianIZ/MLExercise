using MLPayment.Entities;
using MLPayment.UI.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MLPayment.UI.Web.Models
{
    public class ChargeModel
    {
        public static Charge MapCharge(ChargeDto charge)
        {
            return new Charge()
            {
                Amount = charge.Amount,
                IdEvent = charge.IdEvent
            };
        }
    }
}