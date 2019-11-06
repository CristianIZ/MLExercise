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
    public class BillChargeDAC : DataAccessComponent
    {
        public BillCharge Create(BillCharge billCharge)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);

            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.AddNewBill))
            {
                db.AddInParameter(cmd, "@IdBill", DbType.AnsiString, billCharge.IdBill);
                db.AddInParameter(cmd, "@IdCharge", DbType.AnsiString, billCharge.IdCharge);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, DateFormatHelper.DateToIntFormat(DateTime.Now));
                Convert.ToInt32(db.ExecuteNonQuery(cmd));
            }

            return billCharge;
        }

        public void Delete(int idBill, int idCharge)
        {
            throw new NotImplementedException();
        }

        public List<BillCharge> Read()
        {
            throw new NotImplementedException();
        }

        public BillCharge ReadBy(int idBill, int idCharge)
        {
            BillCharge billCharge = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.GetBillById))
            {
                db.AddInParameter(cmd, "@IdBill", DbType.Int32, idBill);
                db.AddInParameter(cmd, "@IdCharge", DbType.Int32, idCharge);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        billCharge = LoadBillCharge(dr);
                    }
                }
            }
            return billCharge;
        }

        public void Update(BillCharge entity)
        {
            throw new NotImplementedException();
        }

        private BillCharge LoadBillCharge(IDataReader dr)
        {
            var bill = new BillCharge();
            bill.IdBill = GetDataValue<int>(dr, "Id");
            bill.IdCharge = GetDataValue<int>(dr, "IdUser");
            bill.DateIndex = GetDataValue<int>(dr, "DateIndex");
            bill.DateCreation = GetDataValue<DateTime>(dr, "DateCreation");
            bill.DateModification = GetDataValue<DateTime?>(dr, "DateModification");
            bill.Valid = GetDataValue<bool>(dr, "Valid");
            return bill;
        }
    }
}
