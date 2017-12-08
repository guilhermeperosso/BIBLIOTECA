<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Benner.Tecnologia.Bas.AppServer.WebService" %>

<%@ Page Language="c#" AutoEventWireup="false" EnableTheming="false" Theme="" StylesheetTheme="" %>

<%
	try
	{
        string poolName = Benner.Tecnologia.Common.BennerContext.Administration.DefaultSystemInstanceName;
        var poolService = new PoolService();
        // Esta p�gina faz dois tipos de testes:
        // 1. TESTE R�PIDO: Apenas para ver se a pool est� com problemas. Este teste sempre ser� executado.
        // 2. TESTE COMPLETO: Por padr�o � executado a cada 30 segundos se a pool apresentou problemas. Ou for�ado via ?testmode=full.

        // Observa��o importante:
        //   A status.aspx s� ir� retornar retornar erro caso algum usu�rio j� tenha recebido algum erro antes.
        //   Isto garante velocidade no teste permitindo o uso indiscrimidado da status.aspx por WebRouters.

        // Observa��o importante 2:
        //  Para for�ar um teste completo na pool mesmo que nenhum usu�rio tenha recebido algum erro 
        //  basta adicionar ?force na Request da status.aspx. Este teste � mais lento e deve ser executado
        //  por ferramentas de monitoramento com peridiocidade de no m�nimo 1 minuto.     

        bool itsFullTestTime = Application["ET"] != null && ((DateTime)Application["ET"]).AddSeconds(30) <= DateTime.Now;
        bool forceFullTest = (Request["testmode"] ?? string.Empty).Equals("full", StringComparison.OrdinalIgnoreCase);

        if (itsFullTestTime || forceFullTest) 
        {
            // Teste completo (incluindo ping no Provider, Banco, BServer)
            // Este teste tenta reiniciar a pool caso ela tenha problemas
            Application["ET"] = null;
            poolService.TestPool(poolName);
        }
        else
        {
            // Teste r�pido para ver se a pool n�o est� com erros.
            // Este teste n�o tenta reiniciar a pool.
            poolService.GetPoolInfo(poolName);
            Application["ET"] = null;
        }
	} 
	catch
	{
		if (Application["ET"] == null)
			Application["ET"] = DateTime.Now;
			
		Response.StatusCode = 500;
	}
	finally
	{
        HttpContext.Current.Session.Abandon();
        HttpContext.Current.Session.RemoveAll();
        HttpContext.Current.Session.Clear();		
	}		
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
    <title>WES Status</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
    <meta name="ProgId" content="VisualStudio.HTML">
    <meta name="Originator" content="Microsoft Visual Studio .NET 7.1">
</head>
<body>
    <h1><%=Response.Status%></h1>
</body>
</html>
