using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MLPayment.UI.Web.Dtos
{
    public class ChargeDto
    {
        public int IdUser { get; set; }
        public int IdEvent { get; set; }
        public decimal Amount { get; set; }
    }
}