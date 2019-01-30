<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadSuc.aspx.vb" Inherits="CadSuc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="lbl1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
            Text="Operação realizada com sucesso!"></asp:Label>
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Voltar ao início</asp:HyperLink>
    
    </div>
    </form>
</body>
</html>
