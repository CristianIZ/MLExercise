using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;

namespace MLPayment.Services.Contracts.User.Response
{
    [DataContract]
    public class GetTop1000UsersResponse
    {
        [DataMember]
        public IList<entity.User> Users { get; set; }
    }
}
