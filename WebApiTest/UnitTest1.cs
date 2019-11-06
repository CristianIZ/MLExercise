using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MLPayment.Entities;
using MLPayment.Services.Contracts.User.Request;
using MLPayment.Services.Http;

namespace WebApiTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            var addtest = new UserServiceHttp();

            var user = new User()
            {
                Document = "27820063",
                DocumentType = 1,
                Name = "Jameson",
                Gender = Enums.Gender.Female,
                Address = "P.O. Box 515, 2880 Sit Street",
                AddressNumber = 851,
                Phone = "(04) 9459 4148",
                BirthDate = 10,
                DateIndex = 17,
                DateCreation = DateTime.Now,
                DateModification = null
            };

            addtest.Add(new AddUserRequest() { User = user });

            Assert.AreNotEqual(user.Id, 0);

        }

        [TestMethod]
        public void GetTest()
        {
            var getTest = new UserServiceHttp();

            var response = getTest.GetTop1000();

            Assert.AreNotEqual(response.Users.Count, 0);
        }
    }
}
