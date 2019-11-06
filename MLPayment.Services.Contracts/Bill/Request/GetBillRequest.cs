using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.Bill.Request
{
    [DataContract]
    public class GetBillRequest
    {
        [DataMember]
        public int Id { get; set; }
    }
}
