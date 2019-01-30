<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastroFuncionario.aspx.vb" Inherits="CadastroFuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        font-family: Verdana;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
    Font-Size="Large" Text="Cadastrar Funcionário"></asp:Label>
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False" 
        Font-Names="Verdana" ForeColor="#CC0000" />
    <span class="style6">Nome Completo:</span><asp:TextBox ID="txtNomeCompletoFunc" 
        runat="server" CssClass="style6" Width="450px" MaxLength="100"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtNomeCompletoFunc" ErrorMessage="Campo requerido" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">Data de Nascimento (dd/mm/aaaa):</span><asp:TextBox 
        ID="txtDataNascFunc" runat="server" CssClass="style6" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtDataNascFunc" ErrorMessage="Campo requerido" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToValidate="txtDataNascFunc" ErrorMessage="Formato: dd/mm/aaaa" 
        ForeColor="#CC0000" ValueToCompare="01/01/1900" Operator="GreaterThan"></asp:CompareValidator>
    <br class="style6" />
    <span class="style6">CPF:</span><asp:TextBox ID="txtCPFFunc" runat="server" 
        CssClass="style6" MaxLength="14"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="txtCPFFunc" ErrorMessage="Campo requerido" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">RG:</span><asp:TextBox ID="txtRGFunc" runat="server" 
        CssClass="style6" MaxLength="15"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Endereço:</span><asp:TextBox ID="txtEnderecoFunc" 
        runat="server" CssClass="style6" Width="507px" MaxLength="100"></asp:TextBox>
    <br class="style6" />
    <span class="style6">CEP (8 dígitos):</span><asp:TextBox ID="txtCEPFunc" runat="server" 
        CssClass="style6" MaxLength="9"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtCEPFunc" ErrorMessage="Campo requerido" 
    ForeColor="#CC0000"></asp:RequiredFieldValidator>
    &nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtCEPFunc" ErrorMessage="Apenas números." 
        ForeColor="#CC0000" ValidationExpression="^[0-9]{8}$"></asp:RegularExpressionValidator>
    <br class="style6" />
    <span class="style6">Email:</span><asp:TextBox ID="txtEmailFunc" runat="server" 
        CssClass="style6" Width="238px" MaxLength="30"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Celular:</span><asp:TextBox ID="txtCelularFunc" 
        runat="server" CssClass="style6" MaxLength="10"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Telefone:</span><asp:TextBox ID="txtTelefoneFunc" 
        runat="server" CssClass="style6" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="txtTelefoneFunc" EnableViewState="False" 
        ErrorMessage="Campo requerido" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">Cargo:</span><asp:TextBox ID="txtCargoFunc" runat="server" 
        MaxLength="30"></asp:TextBox>
    <br />
<span class="style6">Nome de Usuário:</span><asp:TextBox ID="txtNomeUsuario" 
    runat="server" MaxLength="15"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
    ControlToValidate="txtNomeUsuario" ErrorMessage="Campo requerido" 
    ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br class="style6" />
<span class="style6">Senha:</span><asp:TextBox ID="txtSenha" runat="server" 
    TextMode="Password" MaxLength="6"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
    ControlToValidate="txtNomeUsuario" ErrorMessage="Campo requerido" 
    ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <asp:Button ID="btnEnviar" runat="server" CssClass="style6" Text="Enviar" />
    <span class="style6">&nbsp; </span>
    <asp:Button ID="btnLimpar" runat="server" CssClass="style6" Text="Limpar" />
    <br class="style6" />
</asp:Content>

