using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MLPayment.Data;

namespace MLPayment.Business
{
    public class BillComponent
    {
        /// <summary>
        /// Merge the information in the user (id) and bill to add a new bill
        /// </summary>
        /// <param name="user"></param>
        /// <param name="bill"></param>
        /// <returns></returns>
        public Bill Add(User user, Bill bill)
        {
            var result = default(Bill);
            var billDAC = new BillDAC();

            bill.IdUser = user.Id;

            result = billDAC.Create(bill);
            return result;
        }

        /// <summary>
        /// Obains the bill that match with the id
        /// </summary>
        /// <param name="id">Bill id to be searched</param>
        /// <returns></returns>
        public Bill GetById(int id)
        {
            Bill result = default(Bill);

            var billDAC = new BillDAC();
            result = billDAC.ReadBy(id);
            return result;
        }

        /// <summary>
        /// Edit the bill that match with the current id
        /// </summary>
        /// <param name="bill">Data to be edited</param>
        public void Edit(Bill bill)
        {
            var billDAC = new BillDAC();
            billDAC.Update(bill);
        }

        /// <summary>
        /// Deletes the bill that match with the id
        /// </summary>
        /// <param name="Id">Bill id to be deleted</param>
        public void Delete(int Id)
        {
            var billDAC = new BillDAC();
            billDAC.Delete(Id);
        }

        /// <summary>
        /// Gets the bill of the selected user that matches with the current month
        /// </summary>
        /// <param name="user"></param>
        /// <param name="date"></param>
        /// <returns></returns>
        public Bill GetBillByUserAndMonth(User user, DateTime date)
        {
            var billDAC = new BillDAC();
            var result = billDAC.GetBillByUserAndMonth(user, date);

            return result;
        }
    }
}
