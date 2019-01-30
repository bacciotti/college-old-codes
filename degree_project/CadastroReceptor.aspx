<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastroReceptor.aspx.vb" Inherits="CadastroReceptor" %>

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
    Font-Size="X-Large" Text="Cadastrar receptor"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <asp:Label ID="Label17" runat="server" Font-Names="Calibri" 
        
        Text="Campos marcados com um asterisco (*) são de preenchimento obrigatório" 
        Font-Size="Small"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="*Nome completo:"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtNomeCompleto" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="txtNomeCompleto" runat="server" MaxLength="255" Width="500px" 
        TabIndex="1"></asp:TextBox>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="*CNPJ:"></asp:Label>
&nbsp;
    <br />
    <asp:Label ID="Label14" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Formato: ##.###.###/####-##"></asp:Label>
    <br />
    <asp:TextBox ID="txtCNPJ" runat="server" Width="150px" TabIndex="1"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="txtCNPJ" ErrorMessage="Formato inválido." Font-Bold="True" 
        Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="\d{2,3}.\d{3}.\d{3}/\d{4}-\d{2}" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtCNPJ" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Endereço:"></asp:Label>
    <br />
    <asp:TextBox ID="txtEndereco" runat="server" MaxLength="255" Width="500px" 
        TabIndex="2"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Cidade:"></asp:Label>
    <br />
    <asp:TextBox ID="txtCidade" runat="server" MaxLength="255" Width="250px" 
        TabIndex="3"></asp:TextBox>
    <br />
    <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="*Estado:"></asp:Label>
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
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="ddlEstado" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        InitialValue="Selecione..." SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="Label20" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="CEP:"></asp:Label>
    <br />
    <asp:Label ID="Label21" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Somente números"></asp:Label>
    <br />
    <asp:TextBox ID="txtCep" runat="server" MaxLength="10" Width="150px" 
        TabIndex="5"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
        ControlToValidate="txtCep" ErrorMessage="Formato inválido." Font-Bold="True" 
        Font-Names="Calibri" ForeColor="#CC0000" ValidationExpression="\d+" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Celular:"></asp:Label>
    <br />
    <asp:Label ID="Label18" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Formato:  ##-########"></asp:Label>
    <br />
    <asp:TextBox ID="txtCelular" runat="server" Width="150px" TabIndex="6"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
        ControlToValidate="txtCelular" ErrorMessage="Formato inválido." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="^\(?\d{2}\)?[\s-]?\d{4}-?\d{4}$" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label9" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Telefone:"></asp:Label>
    <br />
    <asp:Label ID="Label19" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Formato:  ##-########"></asp:Label>
    <br />
    <asp:TextBox ID="txtTelefone" runat="server" Width="150px" TabIndex="7"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
        ControlToValidate="txtTelefone" ErrorMessage="Formato inválido." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="^\(?\d{2}\)?[\s-]?\d{4}-?\d{4}$" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="Label13" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="E-mail:"></asp:Label>
    <br />
    <asp:Label ID="Label16" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Formato: exemplo@exemplo.com.br"></asp:Label>
    <br />
    <asp:TextBox ID="txtEmail" runat="server" Width="150px" TabIndex="8"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
        ControlToValidate="txtEmail" ErrorMessage="Formato inválido." Font-Bold="True" 
        Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <br />
    <asp:Label ID="Label12" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Observação:"></asp:Label>
    <br />
    <asp:TextBox ID="txtObservacao" runat="server" MaxLength="255" Width="500px" 
        TabIndex="9"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" style="height: 26px" 
        TabIndex="10" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnLimpar" runat="server" style="text-align: center" 
        Text="Limpar" CausesValidation="False" TabIndex="11" />
    <br />
    <br />
</asp:Content>

