using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using MLPayment.Business;
using MLPayment.Services.Contracts.Bill.Request;
using MLPayment.Services.Contracts.Bill.Rsponse;
using MLPayment.Services.Http;

namespace MLPayment.Services.Http
{
    [RoutePrefix("api/Bill")]
    public class BillServiceHttp : ApiController
    {
        /// <summary>
        /// Add a new user into the database and returns the complete User object
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Add")]
        public AddBillResponse Add(AddBillRequest request)
        {
            try
            {
                var response = new AddBillResponse();
                var bc = new BillComponent();
                response.Result = bc.Add(request.User, request.Bill);
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
        public GetBillResponse GetById(int id)
        {
            try
            {
                var response = new GetBillResponse();
                var bc = new BillComponent();

                response.Result = bc.GetById(id);

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
