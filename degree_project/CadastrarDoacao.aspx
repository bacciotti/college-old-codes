<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastrarDoacao.aspx.vb" Inherits="CadastrarDoacao" %>

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
    Font-Size="X-Large" Text="Cadastrar nova doação"></asp:Label>
    &nbsp;<span class="style14">&nbsp;<span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Código do doador:"></asp:Label>
    <asp:TextBox ID="txtCodDoador" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Nome do doador:"></asp:Label>
    <asp:TextBox ID="txtNomeDoador" runat="server" ReadOnly="True" Width="414px"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Data:"></asp:Label>
&nbsp;<asp:TextBox ID="txtData" runat="server" ReadOnly="True" Width="91px"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Tipo de sangue:"></asp:Label>
&nbsp;<asp:TextBox ID="txtTipoSangue" runat="server" ReadOnly="True" Width="41px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="*Quantidade de bolsas:"></asp:Label>
&nbsp;<asp:TextBox ID="txtQtdeBolsas" runat="server" Width="40px" ReadOnly="True">1</asp:TextBox>
&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="bolsa(s)"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtQtdeBolsas" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtQtdeBolsas" ErrorMessage="Quantidade inválida." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" MaximumValue="4" 
        MinimumValue="1" SetFocusOnError="True"></asp:RangeValidator>
    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" ControlToValidate="txtQtdeBolsas" 
        ErrorMessage="Somente números inteiros." Font-Bold="True" Font-Names="Calibri" 
        ForeColor="#CC0000" ValidationExpression="^[0-9]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" TabIndex="1" Text="Enviar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
        TabIndex="2" Text="Cancelar" />
    <br />
    <br />
</asp:Content>

