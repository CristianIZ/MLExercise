using MLPayment.Entities;
using MLPayment.UI.Web.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MLPayment.UI.Web.Models
{
    public class BillModel
    {
        public static Bill MapBill(BillDto billDto)
        {
            return new Bill()
            {
                BillNumber = billDto.BillNumber,
                IdUser = billDto.IdUser
            };
        }
    }
}