<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastroVoluntarios.aspx.vb" Inherits="CadastroPaciente" %>

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
    Font-Size="Large" Text="Cadastrar um possível doador" CssClass="style6"></asp:Label>
    <br />
    Entre com alguns dados pessoais da pessoa.<br />
    <br />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Bold="False" 
        Font-Names="Verdana" ForeColor="#CC0000" />
    <span class="style6">Nome Completo:</span><asp:TextBox ID="txtNomeCompleto" 
        runat="server" CssClass="style6" Width="547px" MaxLength="100"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtNomeCompleto" ErrorMessage="Campo requerido" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">Data de Nascimento (dd/mm/aaaa):</span><asp:TextBox 
        ID="txtDataNasc" runat="server" CssClass="style6" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtDataNasc" ErrorMessage="Campo requerido" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToValidate="txtDataNasc" ErrorMessage="Data inválida" 
        ForeColor="#CC0000" ValueToCompare="01/01/1900" Operator="GreaterThan"></asp:CompareValidator>
    <br class="style6" />
    <span class="style6">CPF:</span><asp:TextBox ID="txtCPF" runat="server" 
        CssClass="style6" MaxLength="14"></asp:TextBox>
    <br class="style6" />
    <span class="style6">RG:</span><asp:TextBox ID="txtRG" runat="server" 
        CssClass="style6" MaxLength="15"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="txtRG" ErrorMessage="Campo requerido" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">Endereço:</span><asp:TextBox ID="txtEndereco" 
        runat="server" CssClass="style6" Width="712px" MaxLength="100"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Cidade:</span><asp:TextBox ID="txtCidade" runat="server" 
        CssClass="style6" Width="311px" MaxLength="50"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Estado:</span><asp:TextBox ID="txtEstado" runat="server" 
        CssClass="style6" Width="27px" MaxLength="2"></asp:TextBox>
    <br class="style6" />
    <span class="style6">CEP (8 dígitos):</span><asp:TextBox ID="txtCEP" runat="server" 
        CssClass="style6" MaxLength="9"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="txtCEP" ErrorMessage="Campo requerido" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    &nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtCEP" ErrorMessage="Apenas números." ForeColor="#CC0000" 
        ValidationExpression="^[0-9]{8}$"></asp:RegularExpressionValidator>
    <br class="style6" />
    <span class="style6">Email:</span><asp:TextBox ID="txtEmail" runat="server" 
        CssClass="style6" Width="238px" MaxLength="30"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Celular:</span><asp:TextBox ID="txtCelular" runat="server" 
        CssClass="style6" MaxLength="10"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Telefone:</span><asp:TextBox ID="txtTelefone" 
        runat="server" CssClass="style6" MaxLength="10"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="txtTelefone" EnableViewState="False" 
        ErrorMessage="Campo requerido" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br class="style6" />
    <span class="style6">Tipo de Sangue:</span><asp:DropDownList ID="ddTipoSangue" 
        runat="server">
        <asp:ListItem>O+</asp:ListItem>
        <asp:ListItem>O-</asp:ListItem>
        <asp:ListItem>A+</asp:ListItem>
        <asp:ListItem>A-</asp:ListItem>
        <asp:ListItem>B+</asp:ListItem>
        <asp:ListItem>B-</asp:ListItem>
        <asp:ListItem>AB+</asp:ListItem>
        <asp:ListItem>AB-</asp:ListItem>
    </asp:DropDownList>
    <br class="style6" />
    <span class="style6">Patologias:</span><br class="style6" />
    <asp:TextBox ID="txtPatologias" runat="server" CssClass="style6" Width="772px" 
        MaxLength="255"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Exames Realizados (informar data):</span><br 
        class="style6" />
    <asp:TextBox ID="txtExames" runat="server" CssClass="style6" Width="766px" 
        MaxLength="255"></asp:TextBox>
    <br class="style6" />
    <span class="style6">Observações:</span><br class="style6" />
    <asp:TextBox ID="txtObs" runat="server" CssClass="style6" Width="767px" 
        MaxLength="255"></asp:TextBox>
    <br class="style6" />
    <br class="style6" />
    <asp:Button ID="btnEnviar" runat="server" CssClass="style6" Text="Enviar" />
    <span class="style6">&nbsp; </span>
    <asp:Button ID="btnLimpar" runat="server" CssClass="style6" Text="Limpar" />
    <br class="style6" />
</asp:Content>

