using System.Web.Http;
using System.Web.Routing;
using Benner.Tecnologia.Wes.Components.Rest;
using Microsoft.AspNet.WebApi.Extensions.Compression.Server;
using System.Net.Http.Extensions.Compression.Core.Compressors;

public static class WebApiConfig
{
    public static void Register(HttpConfiguration configuration, RouteCollection routes)
    {
        routes.MapHttpRoute(
            name: "DefaultApi",
            routeTemplate: "api/{controller}/{id}",
            defaults: new { id = RouteParameter.Optional }
        ).RouteHandler = new SessionStateRouteHandler();

        configuration.Formatters.Remove(configuration.Formatters.XmlFormatter);
        configuration.Formatters.Add(new CustomXmlFormatter());

        configuration.MessageHandlers.Insert(0, new ServerCompressionHandler(new GZipCompressor(), new DeflateCompressor()));
    }
}
