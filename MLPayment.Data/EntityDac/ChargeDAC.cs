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
    public class ChargeDAC : DataAccessComponent, IRepository<Charge>
    {
        public Charge Create(Charge charge)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);

            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.AddNewCharge))
            {
                db.AddInParameter(cmd, "@EventId", DbType.AnsiString, charge.IdEvent);
                db.AddInParameter(cmd, "@Amount", DbType.Int32, charge.Amount);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, DateFormatHelper.DateToIntFormat(DateTime.Now));
                charge.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }
            return charge;
        }

        public void Delete(int id)
        {
            throw new NotImplementedException();
        }

        public IList<Charge> Read()
        {
            var result = new List<Charge>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.GetTop1000Charges))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        Charge charge = LoadCharge(dr);
                        result.Add(charge);
                    }
                }
            }
            return result;
        }

        public Charge ReadBy(int id)
        {
            Charge charge = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetStoredProcCommand(SqlQuerys.GetChargeById))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        charge = LoadCharge(dr);
                    }
                }
            }
            return charge;
        }

        public void Update(Charge entity)
        {
            throw new NotImplementedException();
        }

        private Charge LoadCharge(IDataReader dr)
        {
            var charge = new Charge();
            charge.Id = GetDataValue<int>(dr, "Id");
            charge.IdEvent = GetDataValue<int>(dr, "IdEvent");
            charge.Amount = GetDataValue<decimal>(dr, "Amount");
            charge.DateIndex = GetDataValue<int>(dr, "DateIndex");
            charge.DateCreation = GetDataValue<DateTime>(dr, "DateCreation");
            charge.DateModification = GetDataValue<DateTime?>(dr, "DateModification");
            charge.Valid = GetDataValue<bool>(dr, "Valid");
            return charge;
        }
    }
}
