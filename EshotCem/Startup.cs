using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EshotCem.Startup))]
namespace EshotCem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
