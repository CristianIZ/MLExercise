using MLPayment.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Data
{
    public interface IRepository<TEntity> where TEntity : EntityBase
    {
        TEntity Create(TEntity entity);
        IList<TEntity> Read();
        TEntity ReadBy(int id);
        void Update(TEntity entity);
        void Delete(int id);
    }
}
