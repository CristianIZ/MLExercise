using MLPayment.Business;
using MLPayment.Services.Contracts.Charge.Request;
using MLPayment.Services.Contracts.Charge.Response;
using MLPayment.Services.Contracts.User.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace MLPayment.Services.Http
{
    [RoutePrefix("api/Charge")]
    public class ChargeServiceHttp : ApiController
    {
        /// <summary>
        /// Add a new user into the database and returns the complete User object
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost][Route("Add")]
        public AddChargeResponse Add(AddChargeRequest request)
        {
            try
            {
                var response = new AddChargeResponse();
                var bc = new ChargeComponent();
                response.Result = bc.Add(request.IdUser, request.Charge);
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
        public GetChargeResponse GetById(int id)
        {
            try
            {
                var response = new GetChargeResponse();
                var bc = new ChargeComponent();

                response.Charge = bc.GetById(id);

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

        /// <summary>
        /// Get request that responses a list of Charges
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        [Route("GetTop1000Charges")]
        public GetTop1000ChargesResponse GetTop1000Charges()
        {
            try
            {
                var response = new GetTop1000ChargesResponse();
                var bc = new ChargeComponent();

                response.Charges = bc.GetTop1000();

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
