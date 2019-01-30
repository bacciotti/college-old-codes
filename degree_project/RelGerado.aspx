<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelGerado.aspx.vb" Inherits="RelGerado" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Dashboard.aspx">Retornar ao DashBoard</asp:HyperLink>
    
        <br />
    
        <CR:CrystalReportViewer ID="rViewer1" runat="server" AutoDataBind="true" 
            HasExportButton="False" HasSearchButton="False" Height="50px" 
            SeparatePages="False" Width="350px" />
    
    </div>
    </form>
</body>
</html>
