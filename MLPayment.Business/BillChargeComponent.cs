using MLPayment.Data;
using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Business
{
    public class BillChargeComponent
    {
        /// <summary>
        /// Asociates a bill with a charge in table BillCharge
        /// </summary>
        /// <param name="bill"></param>
        /// <param name="charge"></param>
        /// <returns></returns>
        public BillCharge Add(Bill bill, Charge charge)
        {
            var billChargeDAC = new BillChargeDAC();

            var billBillCharge = new BillCharge()
            {
                IdBill = bill.Id,
                IdCharge = charge.Id
            };

            billBillCharge = billChargeDAC.Create(billBillCharge);

            return billBillCharge;
        }

        /// <summary>
        /// Obains the billCharge that match with the id
        /// </summary>
        /// <param name="id">BillCharge id to be searched</param>
        /// <returns></returns>
        public BillCharge GetById(int idBill, int idCharge)
        {
            BillCharge result = default(BillCharge);

            var billChargeDAC = new BillChargeDAC();
            result = billChargeDAC.ReadBy(idBill, idCharge);
            return result;
        }

        /// <summary>
        /// Edit the billCharge that match with the current idBill and idCharge
        /// </summary>
        /// <param name="billCharge">Data to be edited</param>
        public void Edit(BillCharge billCharge)
        {
            var billChargeDAC = new BillChargeDAC();
            billChargeDAC.Update(billCharge);
        }

        /// <summary>
        /// Deletes the billCharge that match with the idBill and idCharge
        /// </summary>
        /// <param name="Id">BillCharge id to be deleted</param>
        public void Delete(int IdBill, int idCharge)
        {
            var billChargeDAC = new BillChargeDAC();
            billChargeDAC.Delete(IdBill, idCharge);
        }
    }
}
