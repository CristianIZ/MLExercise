using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MLPayment.UI.Web.Startup))]
namespace MLPayment.UI.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
