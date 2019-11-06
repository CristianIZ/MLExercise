using MLPayment.Entities;
using MLPayment.Services.Contracts.Charge.Request;
using MLPayment.Services.Contracts.Charge.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.UI.Process
{
    public class ChargeProcess : ProcessComponent
    {
        public IList<Charge> GetTop1000()
        {
            var response = HttpGet<GetTop1000ChargesResponse>("api/Charge/GetTop1000Charges", new Dictionary<string, object>(), MediaType.Json);
            return response.Charges;
        }

        public Charge GetById(int id)
        {
            var dic = new Dictionary<string, object>();
            dic.Add("Id", id);

            var response = HttpGet<GetChargeResponse>("api/Charge/GetById", dic, MediaType.Json);
            return response.Charge;
        }

        public Charge Add(int idUser, Charge charge)
        {
            var request = new AddChargeRequest();
            request.IdUser = idUser;
            request.Charge = charge;

            var response = HttpPost<AddChargeRequest>("api/Charge/Add", request, MediaType.Json);
            return response.Charge;
        }
    }
}
