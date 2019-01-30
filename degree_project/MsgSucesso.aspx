<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MsgSucesso.aspx.vb" Inherits="MsgSucesso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" 
    ForeColor="Black">Sucesso!</asp:Label>
    <br />
    <asp:Label ID="lblSubTitulo" runat="server" Font-Names="Calibri">Operação concluída.</asp:Label>
    <br />
    <br />
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Dashboard.aspx">Retornar ao DashBoard</asp:HyperLink>
</asp:Content>

