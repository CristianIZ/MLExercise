using MLPayment.Entities;
using MLPayment.Services.Contracts.User.Request;
using MLPayment.Services.Contracts.User.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.UI.Process
{
    public class UserProcess : ProcessComponent
    {
        public IList<User> GetTop1000()
        {
            var response = HttpGet<GetTop1000UsersResponse>("api/User/GetTop1000Users", new Dictionary<string, object>(), MediaType.Json);
            return response.Users;
        }

        public User GetById(int id)
        {
            var dic = new Dictionary<string, object>();
            dic.Add("Id", id);

            var response = HttpGet<GetUserResponse>("api/User/GetById", dic, MediaType.Json);
            return response.User;
        }

        public User Add(User user)
        {
            var request = new AddUserRequest();
            request.User = user;

            var response = HttpPost<AddUserRequest>("api/User/Add", request, MediaType.Json);
            return response.User;
        }

        public void Edit(User user)
        {
            var request = new EditUserRequest();
            request.User = user;
            var response = HttpPost<EditUserRequest>("api/User/Edit", request, MediaType.Json);
        }

        public void Delete(int id)
        {
            var request = new DeleteUserRequest();
            request.IdUser = id;
            var response = HttpPost<DeleteUserRequest>("api/User/Delete", request, MediaType.Json);
        }
    }
}
