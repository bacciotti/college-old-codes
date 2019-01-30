<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ConfExclusaoPessoa.aspx.vb" Inherits="ConfExclusaoPessoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style18
        {
            width: 100%;
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Confirmar exclusão"></asp:Label>
    &nbsp;<span class="style14"><span class="style18"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label17" runat="server" Font-Names="Calibri" 
        
        Text="Tem certeza que deseja excluir o" 
        Font-Size="Medium"></asp:Label>
&nbsp;<asp:Label ID="lblTipoPessoa" runat="server" Font-Names="Calibri" 
        Font-Size="Medium" Font-Bold="True"></asp:Label>
&nbsp;<asp:Label ID="Label19" runat="server" Font-Names="Calibri" 
        
        Text="abaixo?" 
        Font-Size="Medium"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label20" runat="server" Font-Names="Calibri" 
        
        Text="ID:" 
        Font-Size="Medium"></asp:Label>
    &nbsp;<asp:Label ID="lblIdPessoa" runat="server" Font-Names="Calibri" 
        Font-Size="Medium" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label ID="Label21" runat="server" Font-Names="Calibri" 
        
        Text="Nome:" 
        Font-Size="Medium"></asp:Label>
    &nbsp;<asp:Label ID="lblNomePessoa" runat="server" Font-Names="Calibri" 
        Font-Size="Medium" Font-Bold="True"></asp:Label>
    <br />
    <asp:Label ID="Label22" runat="server" Font-Names="Calibri" 
        
        Text="CPF/CNPJ:" 
        Font-Size="Medium"></asp:Label>
    &nbsp;<asp:Label ID="lblCPFCNPJPessoa" runat="server" Font-Names="Calibri" 
        Font-Size="Medium" Font-Bold="True"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Button ID="btnCancelar" runat="server" Text="NÃO. Não excluir." 
        Width="152px" />
    <br />
    <br />
    <asp:Button ID="btnExcluir" runat="server" Text="SIM. Excluir agora." 
        Width="154px" />
    <br />
</asp:Content>

