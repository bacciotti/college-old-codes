<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="MsgErro.aspx.vb" Inherits="MsgErro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style14
        {
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTitulo" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" 
    ForeColor="#CC0000">Erro</asp:Label>
    <br />
    <asp:Label ID="lblSubTitulo" runat="server" Font-Names="Calibri">Tente novamente.</asp:Label>
    <br />
    <br />
      <span class="style14">&nbsp;<a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span><br 
        class="style14" />
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Dashboard.aspx">Retornar ao DashBoard</asp:HyperLink>
</asp:Content>

