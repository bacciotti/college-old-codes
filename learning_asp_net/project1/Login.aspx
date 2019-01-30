<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Imagens/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
            Text="Login"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Você está logado como:"></asp:Label>
&nbsp;<asp:Label ID="lblusername" runat="server" style="font-weight: 700"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Usuário:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtUsuario" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Senha:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtSenha" runat="server"></asp:TextBox>
        <br />
        <asp:CheckBox ID="chkLembrar" runat="server" Text="Lembrar dados" />
        <br />
        <asp:Label ID="lblMensagem" runat="server"></asp:Label>
        <br />
        <asp:Button ID="lblEntrar" runat="server" Text="Entrar" />
    
    </div>
    </form>
</body>
</html>
