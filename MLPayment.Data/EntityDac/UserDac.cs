using Microsoft.Practices.EnterpriseLibrary.Data;
using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MLPayment.Data.Helpers;
using static MLPayment.Entities.Enums;

namespace MLPayment.Data
{
    public class UserDAC : DataAccessComponent, IRepository<User>
    {
        /// <summary>
        /// Add a new user and returns the complete User object
        /// </summary>
        /// <param name="user">User to insert</param>
        /// <returns></returns>
        public User Create(User user)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.AddNewUser))
            {
                db.AddInParameter(cmd, "@Document", DbType.AnsiString, user.Document);
                db.AddInParameter(cmd, "@DocumentType", DbType.Int32, user.DocumentType);
                db.AddInParameter(cmd, "@Name", DbType.AnsiString, user.Name);
                db.AddInParameter(cmd, "@Gender", DbType.Int32, (int)user.Gender);
                db.AddInParameter(cmd, "@Address", DbType.AnsiString, user.Address);
                db.AddInParameter(cmd, "@AddressNumber", DbType.Int32, user.AddressNumber);
                db.AddInParameter(cmd, "@Phone", DbType.AnsiString, user.Phone);
                db.AddInParameter(cmd, "@BirthDate", DbType.Int32, user.BirthDate);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, DateFormatHelper.DateToIntFormat(DateTime.Now));
                user.Id = Convert.ToInt32(db.ExecuteScalar(cmd));
            }
            return user;
        }

        /// <summary>
        /// Delete the user with the given id
        /// </summary>
        /// <param name="id">User id to delete</param>
        public void Delete(int id)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.DeleteUser))
            {
                db.AddInParameter(cmd, "@Valid", DbType.Byte, id);
                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// Search a list of top 1000 users
        /// </summary>
        /// <returns></returns>
        public IList<User> Read()
        {
            var result = new List<User>();
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.GetTop1000Users))
            {
                using (IDataReader dr = db.ExecuteReader(cmd))
                {
                    while (dr.Read())
                    {
                        User user = LoadUser(dr);
                        result.Add(user);
                    }
                }
            }
            return result;
        }

        /// <summary>
        /// Search for the user with the given id
        /// </summary>
        /// <param name="id">User id to search</param>
        /// <returns></returns>
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
                        user = LoadUser(dr);
                    }
                }
            }
            return user;
        }

        /// <summary>
        /// Update the user based on the user id
        /// </summary>
        /// <param name="user"></param>
        public void Update(User user)
        {
            var db = DatabaseFactory.CreateDatabase(CONNECTION_NAME);
            using (DbCommand cmd = db.GetSqlStringCommand(SqlQuerys.EditUser))
            {
                db.AddInParameter(cmd, "@Id", DbType.Int32, user.Id);
                db.AddInParameter(cmd, "@Document", DbType.AnsiString, user.Document);
                db.AddInParameter(cmd, "@DocumentType", DbType.Int32, user.DocumentType);
                db.AddInParameter(cmd, "@Name", DbType.AnsiString, user.Name);
                db.AddInParameter(cmd, "@Gender", DbType.Int32, (int)user.Gender);
                db.AddInParameter(cmd, "@Address", DbType.AnsiString, user.Address);
                db.AddInParameter(cmd, "@AddressNumber", DbType.Int32, user.AddressNumber);
                db.AddInParameter(cmd, "@Phone", DbType.AnsiString, user.Phone);
                db.AddInParameter(cmd, "@BirthDate", DbType.Int32, user.BirthDate);
                db.AddInParameter(cmd, "@DateIndex", DbType.Int32, user.DateIndex);
                db.ExecuteNonQuery(cmd);
            }
        }

        /// <summary>
        /// Map an user
        /// </summary>
        /// <param name="dr"></param>
        /// <returns></returns>
        private User LoadUser(IDataReader dr)
        {
            User user = new User();
            user.Id = GetDataValue<int>(dr, "Id");
            user.Document = GetDataValue<string>(dr, "Document");
            user.DocumentType = GetDataValue<int>(dr, "DocumentType");
            user.Name = GetDataValue<string>(dr, "Name");
            user.Gender = (Gender)GetDataValue<int>(dr, "Gender");
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
