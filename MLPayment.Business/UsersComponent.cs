using MLPayment.Data;
using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Business
{
    public class UsersComponent
    {
        /// <summary>
        /// Insert a new user into the table and returns the complete User object
        /// </summary>
        /// <param name="user">User to be added</param>
        /// <returns></returns>
        public User Add(User user)
        {
            User result = default(User);
            var userDAC = new UserDAC();

            result = userDAC.Create(user);
            return result;
        }

        /// <summary>
        /// Obtains a list of user for a quick view
        /// </summary>
        /// <returns></returns>
        public List<User> GetTop1000()
        {
            List<User> result = default(List<User>);

            var userDAC = new UserDAC();
            result = userDAC.Read();
            return result;
        }

        /// <summary>
        /// Obains the user that match with the id
        /// </summary>
        /// <param name="id">User id to be searched</param>
        /// <returns></returns>
        public User GetById(int id)
        {
            User result = default(User);

            var userDAC = new UserDAC();
            result = userDAC.ReadBy(id);
            return result;
        }

        /// <summary>
        /// Edit the user that match with the current id
        /// </summary>
        /// <param name="user">Data to be edited</param>
        public void Edit(User user)
        {
            var userDAC = new UserDAC();
            userDAC.Update(user);
        }

        /// <summary>
        /// Deletes the user that match with the id
        /// </summary>
        /// <param name="Id">User id to be deleted</param>
        public void Delete(int Id)
        {
            var userDAC = new UserDAC();
            userDAC.Delete(Id);
        }
    }
}
