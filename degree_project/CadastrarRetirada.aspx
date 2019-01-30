<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastrarRetirada.aspx.vb" Inherits="CadastrarRetirada" %>

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
    Font-Size="X-Large" Text="Cadastrar nova retirada"></asp:Label>
    <span class="style14"><span class="style15">&nbsp;<a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Código do receptor:"></asp:Label>
    <asp:TextBox ID="txtCodDoReceptor" runat="server" ReadOnly="True"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Nome do receptor:"></asp:Label>
    <asp:TextBox ID="txtNomeReceptor" runat="server" ReadOnly="True" Width="414px"></asp:TextBox>
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Data:"></asp:Label>
&nbsp;<asp:TextBox ID="txtData" runat="server" ReadOnly="True" Width="91px"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Tipo de sangue:"></asp:Label>
&nbsp;<asp:DropDownList ID="ddlTipoSanguineo" runat="server" CausesValidation="True">
        <asp:ListItem>Selecione...</asp:ListItem>
        <asp:ListItem>A+</asp:ListItem>
        <asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem>
        <asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>O+</asp:ListItem>
        <asp:ListItem>O-</asp:ListItem>
        <asp:ListItem>AB+</asp:ListItem>
        <asp:ListItem>AB-</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="ddlTipoSanguineo" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        InitialValue="Selecione..." SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="*Quantidade de bolsas:"></asp:Label>
&nbsp;<asp:TextBox ID="txtQtdeBolsas" runat="server" TabIndex="1" Width="53px"></asp:TextBox>
&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="bolsa(s)"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtQtdeBolsas" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
        runat="server" ControlToValidate="txtQtdeBolsas" 
        ErrorMessage="Somente números inteiros." Font-Bold="True" Font-Names="Calibri" 
        ForeColor="#CC0000" ValidationExpression="^[0-9]+$" SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" TabIndex="2" Text="Enviar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
        TabIndex="3" Text="Cancelar" />
    <br />
    <br />
</asp:Content>

