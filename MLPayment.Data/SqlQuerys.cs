using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Data
{
    public class SqlQuerys
    {
        #region Users

        public const string InsertNewUser = " INSERT INTO [MLPayment].dbo.Users([Document] ,[DocumentType] ,[Name] ,[Gender] ,[Address] ,[AddressNumber] ,[Phone] ,[BirthDate] ,[DateIndex]) VALUES (@Document ,@DocumentType ,@Name ,@Gender ,@Address ,@AddressNumber ,@Phone ,@BirthDate ,@DateIndex)";
        public const string EditUser = "UPDATE [MLPayment].dbo.Users SET Document = @Document ,DocumentType = @DocumentType ,Name = @Name ,Gender = @Gender ,Address = @Address ,AddressNumber = @AddressNumber ,Phone = @Phone ,BirthDate = @BirthDate ,DateIndex = @DateIndex ,DateModification = @DateModification WHERE Id = @Id";
        public const string DeleteUser = "UPDATE [MLPayment].dbo.Users SET Valid = 0 WHERE Id = @Id";
        public const string GetUserById = "SELECT TOP 1000 * FROM [MLPayment].dbo.Users WHERE Id = @Id";
        public const string GetTop1000Users = "SELECT TOP 1000 * FROM [MLPayment].dbo.Users";
        #endregion
    }
}
