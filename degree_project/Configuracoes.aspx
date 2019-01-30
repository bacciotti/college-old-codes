<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Configuracoes.aspx.vb" Inherits="Configuracoes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style15
        {
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Configurações"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    &nbsp;<br />
    <asp:Label ID="Label8" runat="server" Font-Names="Calibri" 
        Text="Validar CPF/CNPJ?"></asp:Label>
    <br />
    <asp:Label ID="Label14" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" 
        Text="Marcando &quot;Sim&quot; não será permitida a digitação de CPFs ou CNPJs falsos ou errados."></asp:Label>
    <br />
    <asp:DropDownList ID="ddlValidarCPFCNPJ" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label9" runat="server" Font-Names="Calibri" 
        Text="Período mínimo entre doações:"></asp:Label>
    <br />
    <asp:Label ID="Label10" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Entre 60 e 90 dias"></asp:Label>
    <br />
    <asp:TextBox ID="txtDiasDoacoes" runat="server" Width="49px" TabIndex="1"></asp:TextBox>
&nbsp;<asp:Label ID="Label11" runat="server" Font-Names="Calibri" Text="dias"></asp:Label>
&nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtDiasDoacoes" 
        ErrorMessage="O valor deve estar entre 60 e 90 dias." Font-Bold="True" 
        Font-Names="Calibri" ForeColor="#CC0000" MaximumValue="90" MinimumValue="60" 
        SetFocusOnError="True"></asp:RangeValidator>
    <br />
    <br />
    <asp:Label ID="Label12" runat="server" Font-Names="Calibri" 
        Text="Caminho Relatórios:"></asp:Label>
    <br />
    <asp:Label ID="Label13" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Insira uma barra (\) no final do caminho"></asp:Label>
    <br />
    <asp:TextBox ID="txtCaminhoRel" runat="server" Width="405px" TabIndex="2"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" />
&nbsp; 
</asp:Content>

