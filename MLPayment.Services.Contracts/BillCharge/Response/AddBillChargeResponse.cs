using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.BillCharge.Response
{
    [DataContract]
    public class AddBillChargeResponse
    {
        [DataMember]
        public entity.BillCharge Result { get; set; }
    }
}
