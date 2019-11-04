using MLPayment.Data;
using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Business
{
    public class ChargeComponent
    {
        /// <summary>
        /// It generates a charge on an bill (which if it does not exist will be created for the current month)
        /// </summary>
        /// <param name="user">User to be charged</param>
        /// <param name="charge">Charge with the amount</param>
        /// <returns></returns>
        public Charge Add(User user, Charge charge)
        {
            var billDac = new BillDAC();
            var chargeDAC = new ChargeDAC();

            var billForCharge = billDac.GetBillByUserAndMonth(user, DateTime.Now);

            if (billForCharge == null)
            {
                billForCharge = new Bill() { IdUser = user.Id };
                billForCharge = billDac.Create(billForCharge);
            }

            var chargeResult = default(Charge);
            chargeResult = chargeDAC.Create(charge);



            return chargeResult;
        }

        /// <summary>
        /// Obains the charge that match with the id
        /// </summary>
        /// <param name="id">Charge id to be searched</param>
        /// <returns></returns>
        public Charge GetById(int id)
        {
            Charge result = default(Charge);

            var chargeDAC = new ChargeDAC();
            result = chargeDAC.ReadBy(id);
            return result;
        }

        /// <summary>
        /// Edit the charge that match with the current id
        /// </summary>
        /// <param name="charge">Data to be edited</param>
        public void Edit(Charge charge)
        {
            var chargeDAC = new ChargeDAC();
            chargeDAC.Update(charge);
        }

        /// <summary>
        /// Deletes the charge that match with the id
        /// </summary>
        /// <param name="Id">Charge id to be deleted</param>
        public void Delete(int Id)
        {
            var chargeDAC = new ChargeDAC();
            chargeDAC.Delete(Id);
        }
    }
}
