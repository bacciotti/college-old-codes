<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CadUsu.aspx.vb" Inherits="CadUsu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-size: xx-large;
        }
        .style2
        {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">
    
        <asp:Label ID="lblTitulo" runat="server"></asp:Label>
        <strong>
        <br />
        <br />
        </strong><span class="style2">
        <asp:Label ID="Label1" runat="server" Text="Usuário:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtUsuario" runat="server" height="22px" MaxLength="15" 
            width="128px"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Senha:"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtSenha" runat="server" MaxLength="6"></asp:TextBox>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Papel:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; </span>
        <asp:DropDownList ID="ddlPapel" runat="server" height="22px" width="128px">
            <asp:ListItem>Gerente</asp:ListItem>
            <asp:ListItem>Administrador</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="btnEnviar" runat="server" height="26px" Text="Enviar" 
            width="82px" />
&nbsp;<asp:Button ID="btnCancelar" runat="server" height="26px" Text="Cancelar" 
            width="82px" />
    
    &nbsp;</div>
    </form>
</body>
</html>
