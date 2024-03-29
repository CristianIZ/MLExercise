﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Entities
{
    public class BillCharge : EntityBase
    {
        [DataMember]
        [DisplayName("IdBill")]
        public int IdBill { get; set; }

        [DataMember]
        [DisplayName("IdCharge")]
        public int IdCharge { get; set; }
    }
}
