using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.Bill.Rsponse
{
    [DataContract]
    public class GetTop1000BillsResponse
    {
        [DataMember]
        public IList<entity.Bill> Bills { get; set; }
    }
}
