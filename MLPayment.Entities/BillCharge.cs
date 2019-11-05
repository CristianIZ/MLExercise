using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Entities
{
    public class BillCharge : EntityBase
    {
        public int IdBill { get; set; }
        public int IdCharge { get; set; }
        public int DateIndex { get; set; }
        public DateTime DateCreation { get; set; }
        public DateTime? DateModification { get; set; }
        public bool Valid { get; set; }
    }
}
