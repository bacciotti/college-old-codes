<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ConfCorrespMassa.aspx.vb" Inherits="ConfCorrespMassa" %>

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
    Font-Size="X-Large" Text="Correspondências em massa"></asp:Label>
    &nbsp;<span class="style14"><span class="style18"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label17" runat="server" Font-Names="Calibri" 
        
        Text="A geração de corespondência em massa poderá levar alguns minutos para ser concluída. " 
        Font-Size="Medium"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label18" runat="server" Font-Names="Calibri" 
        
        Text="Tem certeza que deseja continuar?" 
        Font-Size="Medium"></asp:Label>
    <br />
    <br />
    <asp:Button ID="btnCancelar" runat="server" 
        Text="NÃO. Não gerar correspondências em massa." Width="357px" />
    <br />
    <br />
    <asp:Button ID="btnContinuar" runat="server" 
        Text="SIM. Gerar correspondências em massa." />
</asp:Content>

