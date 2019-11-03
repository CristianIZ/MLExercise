using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Dispatcher;

namespace MLPayment.Hosts.Web
{
    /// <summary>
    /// Custom Controller Type Resolver class to load only controllers from Services.Http projects
    /// </summary>
    public class HttpServiceTypeResolver : DefaultHttpControllerTypeResolver
    {
        public HttpServiceTypeResolver()
            : base(IsControllerType)
        { }

        internal static bool IsControllerType(Type type)
        {
            if (type == null) throw new ArgumentNullException("type");

            bool result = type.IsClass && type.IsVisible && !type.IsAbstract &&
                          typeof(IHttpController).IsAssignableFrom(type) &&
                          type.Namespace.EndsWith(".Services.Http");

            return result;

        }
    }
}