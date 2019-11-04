using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using static MLPayment.Entities.Enums;

namespace MLPayment.Entities
{
    public class User : EntityBase
    {
        [DataMember]
        [DisplayName("Id")]
        public int Id { get; set; }

        [DataMember]
        [DisplayName("Document")]
        public string Document { get; set; }

        [DataMember]
        [DisplayName("DocumentType")]
        public int DocumentType { get; set; }

        [DataMember]
        [DisplayName("Name")]
        public string Name { get; set; }

        [DataMember]
        [DisplayName("Gender")]
        public Gender Gender { get; set; }

        [DataMember]
        [DisplayName("Address")]
        public string Address { get; set; }

        [DataMember]
        [DisplayName("AddressNumber")]
        public int AddressNumber { get; set; }

        [DataMember]
        [DisplayName("Phone")]
        public string Phone { get; set; }

        [DataMember]
        [DisplayName("BirthDate")]
        public int BirthDate { get; set; }

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
        [DisplayName("Enabled")]
        public bool Valid { get; set; }
    }
}
