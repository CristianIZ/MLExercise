using Microsoft.Practices.EnterpriseLibrary.Data;
using MLPayment.Data.Helpers;
using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Data
{
    public class BillDAC : DataAccessComponent, IRepository<Bill>
    {
        public Bill Create(Bill bill)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);

            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.AddNewBill))
            {
                db.AddInParameter(cmd, "@IdUser", DbType.AnsiString, bill.IdUser);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, DateFormatHelper.DateToIntFormat(DateTime.Now));
                bill.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }

            return bill;
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public List<Bill> Read()
        {
            throw new NotImplementedException();
        }

        /// <summary>
        /// Get the bill for the user in that specific month
        /// </summary>
        /// <param name="user">User to be searched</param>
        /// <param name="date">Date to be searched</param>
        /// <returns></returns>
        public Bill GetBillByUserAndMonth(User user, DateTime date)
        {
            Bill charge = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.GetBillById))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, user.Id);
                db.AddInParameter(cmd, "@MaxDate", DbType.Int32, DateFormatHelper.FirstDayMonth(date));
                db.AddInParameter(cmd, "@Mindate", DbType.Int32, DateFormatHelper.LastDayMonth(date));
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        charge = LoadBill(dr);
                    }
                }
            }
            return charge;
        }

        public Bill ReadBy(int id)
        {
            Bill charge = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.GetBillById))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        charge = LoadBill(dr);
                    }
                }
            }
            return charge;
        }

        public void Update(Bill entity)
        {
            throw new NotImplementedException();
        }

        private Bill LoadBill(IDataReader dr)
        {
            var bill = new Bill();
            bill.Id = GetDataValue<int>(dr, "Id");
            bill.IdUser = GetDataValue<int>(dr, "IdUser");
            bill.BillNumber = GetDataValue<int>(dr, "BillNumber");
            bill.DateIndex = GetDataValue<int>(dr, "DateIndex");
            bill.DateCreation = GetDataValue<DateTime>(dr, "DateCreation");
            bill.DateModification = GetDataValue<DateTime?>(dr, "DateModification");
            bill.Valid = GetDataValue<bool>(dr, "Valid");
            return bill;
        }
    }
}
