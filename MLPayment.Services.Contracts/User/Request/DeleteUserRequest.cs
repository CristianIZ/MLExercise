using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using entity = MLPayment.Entities;
namespace MLPayment.Services.Contracts.User.Request
{
    [DataContract]
    public class DeleteUserRequest
    {
        [DataMember]
        public int IdUser { get; set; }
    }
}
