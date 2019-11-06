using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Entities
{
    public class Charge : EntityBase
    {
        [DataMember]
        [DisplayName("Id")]
        public int Id { get; set; }

        [DataMember]
        [DisplayName("IdEvent")]
        public int IdEvent { get; set; }

        [DataMember]
        [DisplayName("Amount")]
        public decimal Amount { get; set; }
    }
}
