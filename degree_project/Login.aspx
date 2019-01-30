<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            background-color: #FFFFFF;
        }
        .style3
        {
            text-align: left;
        }
        .style4
        {
            width: 50%;
            border-style: solid;
            border-width: 1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
    </div>
    <br />
&nbsp;&nbsp;&nbsp;
    <table align="center" class="style4">
        <tr>
            <td style="background-color: #CCCCFF">
                <asp:Label ID="Label2" runat="server" Font-Names="Calibri" Font-Size="XX-Large" 
                    Text="Bem vindo!"></asp:Label>
                <br />
                <asp:Label ID="Label1" runat="server" Font-Names="Calibri" 
                    Text="Digite seu nome de usuário e senha para acessar o sistema"></asp:Label>
                <br />
    
        <asp:Login ID="Login1" runat="server" 
                        FailureText="Sua tentativa de login falhou. Por favor tente novamente." 
                        Font-Names="Calibri" LoginButtonText="Entrar" PasswordLabelText="Senha:" 
                        PasswordRequiredErrorMessage="Digite sua senha." RememberMeText="Lembrar-me" 
                        TitleText="" UserNameLabelText="Usuário:" 
                        UserNameRequiredErrorMessage="Digite seu usuário." 
                    style="text-align: right">
        </asp:Login>
    
                    <asp:Label ID="Label3" runat="server" Font-Names="Calibri" 
                    Text="©Bloodsoft"></asp:Label>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
