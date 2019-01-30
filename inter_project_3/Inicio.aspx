<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Inicio.aspx.vb" Inherits="Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="MsoNormal">
        <span lang="PT-BR">
        <asp:Label ID="lblNomeEstab" runat="server" Font-Size="X-Large" 
            style="font-weight: 700"></asp:Label>
        <br />
        </span>
        <asp:Label ID="lblData" runat="server"></asp:Label>
    </p>
    <p class="MsoNormal">
        <span lang="PT-BR">Olá,&nbsp;</span></p>
    <p class="MsoNormal">
        <span lang="PT-BR">Utilize o menu ao lado para navegar pelo site.</span></p>
    <p class="MsoNormal">
        <span lang="PT-BR">Caso tenha alguma dúvida, acesse nossa página de
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Ajuda.aspx">ajuda</asp:HyperLink>
        .</span></p>
    <p class="MsoNormal">
        <span lang="PT-BR"><strong><span class="style6">Resumo</span><br />
        </strong>O sangue tipo
        <asp:Label ID="lblTipoSang" runat="server" style="font-weight: 700"></asp:Label>
&nbsp;está em falta!
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Sangue.aspx">Veja outros</asp:HyperLink>
        <br />
        Número de doações feitas hoje:</span>&nbsp;<asp:Label ID="lblDoacoes" 
            runat="server" style="font-weight: 700"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Doações.aspx">Veja mais</asp:HyperLink>
    </p>
    <p class="MsoNormal">
        &nbsp;</p>
    <p class="MsoNormal">
        &nbsp;</p>
</asp:Content>

