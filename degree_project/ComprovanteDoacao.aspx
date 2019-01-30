<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ComprovanteDoacao.aspx.vb" Inherits="MsgCadastroSucesso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="A doação de sangue foi realizada com sucesso!" 
    ForeColor="Black"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Calibri" 
        Text="Identificador:"></asp:Label>
&nbsp;<asp:Label ID="lblID" runat="server" Font-Names="Calibri" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Calibri" 
        Text="Data e hora:"></asp:Label>
&nbsp;<asp:Label ID="lblDataHora" runat="server" Font-Names="Calibri" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Calibri" 
        Text="Tipo de sangue:"></asp:Label>
&nbsp;<asp:Label ID="lblTipoSangue" runat="server" Font-Names="Calibri" 
        Text="Label"></asp:Label>
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Calibri" 
        Text="Nome do doador:"></asp:Label>
&nbsp;<asp:Label ID="lblNomeDoador" runat="server" Font-Names="Calibri" 
        Text="Label"></asp:Label>
    <br />
    <br />
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Font-Names="Calibri" 
        Text="Obrigado! Este gesto vai ajudar a salvar vidas."></asp:Label>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image3" runat="server" Height="62px" ImageAlign="Middle" 
        ImageUrl="~/img/logo2.jpg" Width="313px" />
    <br />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Dashboard.aspx">Retornar ao DashBoard</asp:HyperLink>
</asp:Content>

