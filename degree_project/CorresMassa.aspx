<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CorresMassa.aspx.vb" Inherits="CorresMassa" %><%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

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
    
        <CR:CrystalReportViewer ID="cViewerCorrespM" runat="server" 
            AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ToolbarImagesFolderUrl="" 
            ToolPanelView="None" ToolPanelWidth="200px" Width="1104px" />
    
    </div>
    </form>
</body>
</html>
