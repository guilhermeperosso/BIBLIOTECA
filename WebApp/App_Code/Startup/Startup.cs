using System.Web.Hosting;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Routing;
using Benner.Tecnologia.Wes.Components.Mvc;

[assembly: WebActivatorEx.PostApplicationStartMethod(typeof(Startup), "Start")]

/// <summary>
/// Summary description for Startup
/// </summary>
public class Startup
{
    public static void Start()
    {
        HostingEnvironment.RegisterVirtualPathProvider(new EntityViewPathProvider());
        AreaRegistration.RegisterAllAreas();
        WebApiConfig.Register(GlobalConfiguration.Configuration, RouteTable.Routes);
        FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
        RouteConfig.RegisterRoutes(RouteTable.Routes);
    }
}