using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using MLPayment.Business;
using MLPayment.Services.Contracts.BillCharge.Request;
using MLPayment.Services.Contracts.BillCharge.Response;

namespace MLPayment.Services.Http
{
    public class BillChargeServiceHttp : ApiController
    {
        /// <summary>
        /// Add a new user into the database and returns the complete User object
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Add")]
        public AddBillChargeResponse Add(AddBillChargeRequest request)
        {
            try
            {
                var response = new AddBillChargeResponse();
                var bc = new BillChargeComponent();
                response.Result = bc.Add(request.Bill, request.Charge);
                return response;
            }
            catch (Exception ex)
            {
                var httpError = new HttpResponseMessage()
                {
                    StatusCode = (HttpStatusCode)422, // UNPROCESSABLE ENTITY
                    ReasonPhrase = ex.Message
                };
                throw new HttpResponseException(httpError);
            }
        }


        /// <summary>
        /// Get request that responses the user with the selected Id
        /// </summary>
        /// <param name="id">User id to be reached</param>
        /// <returns></returns>
        [HttpGet]
        [Route("GetById")]
        public GetBillChargeResponse GetById(int idBill, int idCharge)
        {
            try
            {
                var response = new GetBillChargeResponse();
                var bc = new BillChargeComponent();

                response.Result = bc.GetById(idBill, idCharge);

                return response;
            }
            catch (Exception ex)
            {
                var httpError = new HttpResponseMessage()
                {
                    StatusCode = (HttpStatusCode)422,
                    ReasonPhrase = ex.Message
                };

                throw new HttpResponseException(httpError);
            }
        }
    }
}
