<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ConfEstab.aspx.vb" Inherits="ConfEstab" %>

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
    Font-Size="X-Large" Text="Configurações de Estabelecimento"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Nome do estabelecimento:"></asp:Label>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtNomeEstab" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtNomeEstab" runat="server" Width="471px"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Endereço:"></asp:Label>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtEndEstab" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtEndEstab" runat="server" Width="466px" TabIndex="1"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label20" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="CEP:"></asp:Label>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="txtCep" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label21" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Somente números"></asp:Label>
    <br />
    <asp:TextBox ID="txtCep" runat="server" MaxLength="10" Width="150px" 
        TabIndex="2"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
        ControlToValidate="txtCep" ErrorMessage="Formato inválido." Font-Bold="True" 
        Font-Names="Calibri" ForeColor="#CC0000" ValidationExpression="\d+" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Cidade:"></asp:Label>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtCidadeEstab" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtCidadeEstab" runat="server" Width="226px" TabIndex="3"></asp:TextBox>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Estado:"></asp:Label>
    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="ddlEstado" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:DropDownList ID="ddlEstado" runat="server" CausesValidation="True" 
        TabIndex="4">
        <asp:ListItem>Selecione...</asp:ListItem>
        <asp:ListItem>AC</asp:ListItem>
        <asp:ListItem>AL</asp:ListItem>
        <asp:ListItem>AP</asp:ListItem>
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>BA</asp:ListItem>
        <asp:ListItem>CE</asp:ListItem>
        <asp:ListItem>DF</asp:ListItem>
        <asp:ListItem>ES</asp:ListItem>
        <asp:ListItem>GO</asp:ListItem>
        <asp:ListItem>MA</asp:ListItem>
        <asp:ListItem>MT</asp:ListItem>
        <asp:ListItem>MS</asp:ListItem>
        <asp:ListItem>MG</asp:ListItem>
        <asp:ListItem>PA</asp:ListItem>
        <asp:ListItem>PB</asp:ListItem>
        <asp:ListItem>PR</asp:ListItem>
        <asp:ListItem>PE</asp:ListItem>
        <asp:ListItem>PI</asp:ListItem>
        <asp:ListItem>RJ</asp:ListItem>
        <asp:ListItem>RN</asp:ListItem>
        <asp:ListItem>RS</asp:ListItem>
        <asp:ListItem>RO</asp:ListItem>
        <asp:ListItem>RR</asp:ListItem>
        <asp:ListItem>SC</asp:ListItem>
        <asp:ListItem>SP</asp:ListItem>
        <asp:ListItem>SE</asp:ListItem>
        <asp:ListItem>TO</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" 
        onclick="btnEnviar_Click" style="height: 26px" TabIndex="5" />
&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>

