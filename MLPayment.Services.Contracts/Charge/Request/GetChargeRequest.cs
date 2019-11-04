using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.Charge.Request
{
    [DataContract]
    public class GetChargeRequest
    {
        [DataMember]
        public int IdCharge { get; set; }
    }
}
