using MLPayment.Entities;
using MLPayment.Services.Contracts.Bill.Request;
using MLPayment.Services.Contracts.Bill.Rsponse;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.UI.Process
{
    public class BillProcess : ProcessComponent
    {
        public IList<Bill> GetTop1000()
        {
            var response = HttpGet<GetTop1000BillsResponse>("api/Bill/GetTop1000Bills", new Dictionary<string, object>(), MediaType.Json);
            return response.Bills;
        }

        public Bill GetById(int id)
        {
            var dic = new Dictionary<string, object>();
            dic.Add("Id", id);

            var response = HttpGet<GetBillResponse>("api/Bill/GetById", dic, MediaType.Json);
            return response.Result;
        }

        public Bill Add(int idUser, Bill bill)
        {
            var request = new AddBillRequest();
            request.idUser = idUser;
            request.Bill = bill;

            var response = HttpPost<AddBillRequest>("api/Bill/Add", request, MediaType.Json);
            return response.Bill;
        }
    }
}
