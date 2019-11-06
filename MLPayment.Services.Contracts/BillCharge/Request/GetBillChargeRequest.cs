using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.BillCharge.Request
{
    [DataContract]
    public class GetBillChargeRequest
    {
        [DataMember]
        public int IdBill { get; set; }

        [DataMember]
        public int IdCharge { get; set; }
    }
}
