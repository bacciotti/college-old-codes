<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CertGerado.aspx.vb" Inherits="CertGerado" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style2
        {
            font-family: Arial, Helvetica, sans-serif;
        }
        .style3
        {
            width: 100%;
        }
        .style4
        {
            text-align: center;
        }
        .style5
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: xx-large;
        }
    </style>
</head>
<body style="font-family: Arial, Helvetica, sans-serif">
    <form id="form1" runat="server">
    <div>
    
<configuration>
    <system.web>
        <compilation debug="false" strict="false" explicit="true" targetFramework="4.0" />
    </system.web>

</configuration>
    
    </div>
    <table border="1" class="style3">
        <tr>
            <td>
    <div>
    
        <div class="style4">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/logo2.gif" Width="183px" />
            <br />
            <br />
            <span class="style5"><strong>CERTIFICADO</strong></span><br class="style2" />
            <br class="style2" />
            <span class="style2">Certificamos que </span>
            <asp:Label ID="lblNome" runat="server" CssClass="style2" Font-Bold="True" 
                Font-Names="Lucida Calligraphy" Font-Size="Large"></asp:Label>
            <span class="style2">&nbsp; participou do curso <em>&quot;Introdução ao Wordpress&quot;</em>, 
            promovido pelo site RG8.net Cursos e Treinamentos, realizado entre os dias 07 de 
            junho de 2012 e 17 de Julho de 2012, com carga horária de 20 horas.</span><br />
            <br />
            <br />
            <br />
            Ituiutaba,
            <asp:Label ID="lblData" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <br />
            <br />
        </div>
        <table class="style3">
            <tr>
                <td class="style4">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/RubricaT.jpg" />
                </td>
                <td class="style4">
                    <asp:Image ID="Image2" runat="server" Height="58px" ImageUrl="~/RubricaL.jpg" 
                        Width="294px" />
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Prof. Tiago Baciotti Moreira</td>
                <td class="style4">
                    Prof. Lucas Baciotti Moreira</td>
            </tr>
        </table>
    
    </div>
                <p style="text-align: center">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" 
                        Font-Size="Small" style="text-align: center" Text="www.rg8.net"></asp:Label>
                </p>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
