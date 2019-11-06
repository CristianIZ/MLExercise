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

        public const string AddNewUser = "INSERT INTO [MLPayment].dbo.Users([Document] ,[DocumentType] ,[Name] ,[Gender] ,[Address] ,[AddressNumber] ,[Phone] ,[BirthDate] ,[DateIndex]) VALUES (@Document ,@DocumentType ,@Name ,@Gender ,@Address ,@AddressNumber ,@Phone ,@BirthDate ,@DateIndex)";
        public const string EditUser = "UPDATE [MLPayment].dbo.Users SET Document = @Document ,DocumentType = @DocumentType ,Name = @Name ,Gender = @Gender ,Address = @Address ,AddressNumber = @AddressNumber ,Phone = @Phone ,BirthDate = @BirthDate ,DateIndex = @DateIndex ,DateModification = GETDATE() WHERE Id = @Id";
        public const string DeleteUser = "UPDATE [MLPayment].dbo.Users SET Valid = 0 WHERE Id = @Id";
        public const string GetUserById = "SELECT TOP 1000 * FROM [MLPayment].dbo.Users WHERE Id = @Id";
        public const string GetTop1000Users = "SELECT TOP 1000 * FROM [MLPayment].dbo.Users";
        #endregion

        #region Charges
        public const string AddNewCharge = "Charges_ADD";
        public const string GetChargeById = "Charges_GetById";
        #endregion

        #region Bills
        public const string AddNewBill = "Bills_ADD";
        public const string GetBillById = "Bills_GetById";
        public const string GetBillByIdUserAndMonth = "SELECT * FROM Bills WHERE IdUser = 2 AND DateIndex BETWEEN @MinDate AND @MaxDate";
        public const string GetTop1000Bills = "SELECT TOP 1000 * FROM [MLPayment].dbo.Bills";
        #endregion

        #region Charges & Bills
        public const string GetTop1000Charges = "SELECT TOP 1000 * FROM [MLPayment].dbo.Charges";
        public const string AddNewBillCharge = "BillsCharges_ADD";
        public const string GetChargeBillById = "BillsCharges_GetByBills";
        #endregion
    }
}
