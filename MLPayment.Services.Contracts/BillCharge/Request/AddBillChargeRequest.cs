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
    public class AddBillChargeRequest
    {
        [DataMember]
        public entity.BillCharge BillCharge { get; set; }
    }
}
