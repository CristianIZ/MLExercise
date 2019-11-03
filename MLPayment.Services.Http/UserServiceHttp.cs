using MLPayment.Business;
using MLPayment.Entities;
using MLPayment.Services.Contracts.User.Request;
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
    [RoutePrefix("api/User")]
    public class UserServiceHttp : ApiController
    {
        /// <summary>
        /// Add a new user into the database and returns the complete User object
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        [Route("Add")]
        public AddUserResponse Add(AddUserRequest request)
        {
            try
            {
                var response = new AddUserResponse();
                var bc = new UsersComponent();
                response.Result = bc.Add(request.User);
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
        /// Search a list of 1000 users
        /// </summary>
        /// <returns></returns>
        [HttpGet][Route("GetTop1000Users")]
        public GetTop1000UsersResponse GetTop1000()
        {
            try
            {
                var response = new GetTop1000UsersResponse();
                var bc = new UsersComponent();
                response.Users = bc.GetTop1000();

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

        [HttpPost][Route("Edit")]
        public EditUserResponse Edit(EditUserRequest request)
        {
            try
            {
                var response = new EditUserResponse();
                var bc = new UsersComponent();
                bc.Edit(request.User);

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

        [HttpPost][Route("Delete")]
        public DeleteUserResponse Delete(int id)
        {
            try
            {
                var response = new DeleteUserResponse();
                var bc = new UsersComponent();
                bc.Delete(id);

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

        [HttpGet]
        [Route("GetById")]
        public GetUserResponse GetById(int id)
        {
            try
            {
                var response = new GetUserResponse();
                var bc = new UsersComponent();

                response.User = bc.GetById(id);

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
