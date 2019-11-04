using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Entities
{
    public class Bill : EntityBase
    {
        [DataMember]
        [DisplayName("Id")]
        public int Id { get; set; }

        [DataMember]
        [DisplayName("IdUser")]
        public int IdUser { get; set; }

        [DataMember]
        [DisplayName("BillNumber")]
        public int BillNumber { get; set; }

        [DataMember]
        [DisplayName("DateIndex")]
        public int DateIndex { get; set; }

        [DataMember]
        [DisplayName("DateCreation")]
        public DateTime DateCreation { get; set; }

        [DataMember]
        [DisplayName("DateModification")]
        public DateTime? DateModification { get; set; }

        [DataMember]
        [DisplayName("Valid")]
        public bool Valid { get; set; }
    }
}
