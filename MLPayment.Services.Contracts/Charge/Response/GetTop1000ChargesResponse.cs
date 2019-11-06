using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.Charge.Response
{
    [DataContract]
    public class GetTop1000ChargesResponse
    {
        [DataMember]
        public IList<entity.Charge> Charges { get; set; }
    }
}
