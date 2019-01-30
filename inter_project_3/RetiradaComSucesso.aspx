<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="RetiradaComSucesso.aspx.vb" Inherits="RetiradaComSucesso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Retirada efetuada com Sucesso!"></asp:Label>
    <br />Retorne ao
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Inicio.aspx">INÍCIO</asp:HyperLink>
</asp:Content>

