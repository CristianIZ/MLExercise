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
            // Get the Current bill for the user
            var billComponent = new BillComponent();
            var bill = billComponent.GetBillByUserAndMonth(user, DateTime.Now);
            
            if (bill == null)
            {
                bill = new Bill() { IdUser = user.Id };
                bill = billComponent.Add(user, bill);
            }

            // Add a charge for that bill
            var chargeResult = default(Charge);
            var chargeDAC = new ChargeDAC();
            chargeResult = chargeDAC.Create(charge);

            // Add a Bill Charge with te information
            var billChargeComponent = new BillChargeComponent();
            var billCharge = billChargeComponent.Add(bill, chargeResult);

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
