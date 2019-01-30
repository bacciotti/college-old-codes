<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadastroDoacao.aspx.vb" Inherits="CadastroDoação" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        font-family: Verdana;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Nova Doação de Sangue"></asp:Label>
        <br />
        A doação foi autorizada, entre com os dados abaixo.<br class="style6" />
</p>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ForeColor="#CC0000" />
    <p>
        <span class="style6">Código do Doador:<asp:TextBox ID="txtCodigoDoador" runat="server" 
        MaxLength="10" ReadOnly="True"></asp:TextBox>
    </span>
    <br class="style6" />
    <span class="style6">Nome do Doador:</span><asp:TextBox ID="txtNomeDoador" runat="server" 
        Width="446px" MaxLength="100" ReadOnly="True"></asp:TextBox>
        <br />
        <span class="style6">Data:</span><asp:TextBox ID="txtData" runat="server" 
            MaxLength="10" Width="85px" ReadOnly="True"></asp:TextBox>
&nbsp;
    <br class="style6" />
    <span class="style6">Tipo de Sangue:<asp:TextBox ID="txtTipoSangueDoador" 
        runat="server" MaxLength="3" Width="37px" ReadOnly="True"></asp:TextBox>
    <br />
    Quantidade de Sangue (entre 0,300 e 0,450 litros):<asp:TextBox ID="txtQtdSangue" 
        runat="server" MaxLength="4" Width="49px"></asp:TextBox>
    &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="txtQtdSangue" ErrorMessage="Valor Inválido!" 
            Font-Size="Small" ForeColor="#CC0000" MaximumValue="0,400" MinimumValue="0,300" 
            SetFocusOnError="True" Type="Double"></asp:RangeValidator>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" style="height: 26px" />
&nbsp;
    <asp:Button ID="btnLimpar" runat="server" Text="Limpar" />
    <br />
    </span>
</p>
</asp:Content>

