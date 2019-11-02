using Microsoft.Practices.EnterpriseLibrary.Data;
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
    public class UserDAC : DataAccessComponent, IRepository<User>
    {
        public User Create(User user)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.InsertNewUser))
            {
                db.AddInParameter(cmd, "@Document", DbType.AnsiString, user.Document);
                db.AddInParameter(cmd, "@DocumentType", DbType.Int32, user.DocumentType);
                db.AddInParameter(cmd, "@Name", DbType.AnsiString, user.Name);
                db.AddInParameter(cmd, "@Gender", DbType.Int32, user.Gender);
                db.AddInParameter(cmd, "@Address", DbType.AnsiString, user.Address);
                db.AddInParameter(cmd, "@AddressNumber", DbType.Int32, user.AddressNumber);
                db.AddInParameter(cmd, "@Phone", DbType.AnsiString, user.Phone);
                db.AddInParameter(cmd, "@BirthDate", DbType.Int32, user.BirthDate);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, user.DateIndex);
                user.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }
            return user;
        }

        public void Delete(int id)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.DeleteUser))
            {
                db.AddInParameter(cmd, "@Valid", DbType.Byte, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        public List<User> Read()
        {
            var result = new List<User>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.GetTop1000Users))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        User user = LoadEspecie(dr);
                        result.Add(user);
                    }
                }
            }
            return result;
        }

        public User ReadBy(int id)
        {
            User user = null;

            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.GetUserById))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, id);
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    if (dr.Read())
                    {
                        user = LoadEspecie(dr);
                    }
                }
            }
            return user;
        }

        public void Update(User user)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.EditUser))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, user.Id);
                db.AddInParameter(cmd, "@Document", DbType.AnsiString, user.Document);
                db.AddInParameter(cmd, "@DocumentType", DbType.Int32, user.DocumentType);
                db.AddInParameter(cmd, "@Name", DbType.AnsiString, user.Name);
                db.AddInParameter(cmd, "@Gender", DbType.Int32, user.Gender);
                db.AddInParameter(cmd, "@Address", DbType.AnsiString, user.Address);
                db.AddInParameter(cmd, "@AddressNumber", DbType.Int32, user.AddressNumber);
                db.AddInParameter(cmd, "@Phone", DbType.AnsiString, user.Phone);
                db.AddInParameter(cmd, "@BirthDate", DbType.Int32, user.BirthDate);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, user.DateIndex);
                db.ExecuteNonQuery(cmd);
            }
        }

        private User LoadEspecie(IDataReader dr)
        {
            User user = new User();
            user.Id = GetDataValue<int>(dr, "Id");
            user.Document = GetDataValue<string>(dr, "Document");
            user.DocumentType = GetDataValue<int>(dr, "DocumentType");
            user.Name = GetDataValue<string>(dr, "Name");
            user.Gender = GetDataValue<int>(dr, "Gender");
            user.Address = GetDataValue<string>(dr, "Address");
            user.AddressNumber = GetDataValue<int>(dr, "AddressNumber");
            user.Phone = GetDataValue<string>(dr, "Phone");
            user.BirthDate = GetDataValue<int>(dr, "BirthDate");
            user.DateIndex = GetDataValue<int>(dr, "DateIndex");
            user.DateCreation = GetDataValue<DateTime>(dr, "DateCreation");
            user.DateModification = GetDataValue<DateTime?>(dr, "DateModification");
            user.Valid = GetDataValue<bool>(dr, "Valid");
            return user;
        }
    }
}
