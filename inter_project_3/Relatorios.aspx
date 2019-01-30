<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Relatorios.aspx.vb" Inherits="Relatorios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style6
    {
        font-family: Verdana;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Relatórios" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Listagem de Voluntários"></asp:Label>
<br />
Geração de alguns relatórios gerenciais<br />
    <br />
<br />
<asp:Button ID="btnRelDoacoes" runat="server" 
    Text="Gerar Relatório de Doações Realizadas" Width="300px" />
    <br />
<br />
<asp:Button ID="btnRelRetiradas" runat="server" 
    Text="Gerar Relatório de Retiradas Realizadas" Width="300px" />
<br />
    <span class="style6"><br />
</span>
</asp:Content>

