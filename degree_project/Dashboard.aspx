<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="Dashboard" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Dashboard"></asp:Label>
&nbsp;<br />
<br />
     <asp:Label ID="Label8" runat="server" Font-Names="Calibri" 
         Text="Doações de hoje:"></asp:Label>
&nbsp;<asp:Label ID="lblDoacoesDia" runat="server" Font-Bold="True" 
         Font-Names="Calibri"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink2" runat="server" Font-Names="Calibri" 
         NavigateUrl="~/Doacoes.aspx">Ver mais</asp:HyperLink>
     <br />
     <asp:Label ID="Label9" runat="server" Font-Names="Calibri" 
         Text="Retiradas de hoje:"></asp:Label>
&nbsp;<asp:Label ID="lblRetiradasDia" runat="server" Font-Bold="True" 
         Font-Names="Calibri"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" Font-Names="Calibri" 
         NavigateUrl="~/Retiradas.aspx">Ver mais</asp:HyperLink>
     <br />
     <asp:Label ID="Label10" runat="server" Font-Names="Calibri" 
         Text="Doadores cadastrados:"></asp:Label>
&nbsp;<asp:Label ID="lblTotDoadores" runat="server" Font-Bold="True" 
         Font-Names="Calibri"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink4" runat="server" Font-Names="Calibri" 
         NavigateUrl="~/Doadores.aspx">Ver mais</asp:HyperLink>
<br />
     <asp:Label ID="Label11" runat="server" Font-Names="Calibri" 
         Text="Receptores cadastrados:"></asp:Label>
&nbsp;<asp:Label ID="lblTotReceptores" runat="server" Font-Bold="True" 
         Font-Names="Calibri"></asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
         NavigateUrl="~/Receptores.aspx">Ver mais</asp:HyperLink>
     <br />
     <br />
     <asp:Label ID="Label12" runat="server" Font-Names="Calibri" 
         Text="O sangue com menor quantidade no banco é o tipo"></asp:Label>
&nbsp;<asp:Label ID="lblSangue" runat="server" Font-Bold="True" Font-Names="Calibri"></asp:Label>
&nbsp;<asp:Label ID="Label13" runat="server" Font-Names="Calibri" Text="com"></asp:Label>
&nbsp;<asp:Label ID="lblQtdeSangue" runat="server" Font-Bold="True" 
         Font-Names="Calibri"></asp:Label>
&nbsp;<asp:Label ID="lblSangue0" runat="server" Font-Names="Calibri">bolsas disponíveis para retirada.</asp:Label>
&nbsp;<asp:HyperLink ID="HyperLink5" runat="server" Font-Names="Calibri" 
         NavigateUrl="~/BancoDeSangue.aspx">Ver mais</asp:HyperLink>
     <br />
     <br />
     <CR:CrystalReportViewer ID="viewerDash" runat="server" AutoDataBind="True" 
         DisplayStatusbar="False" DisplayToolbar="False" EnableDrillDown="False" 
         EnableTheming="False" GroupTreeImagesFolderUrl="" HasDrilldownTabs="False" 
         HasSearchButton="False" HasToggleGroupTreeButton="False" 
         HasToggleParameterPanelButton="False" HasZoomFactorList="False" Height="543px" 
         SeparatePages="False" ToolbarImagesFolderUrl="" ToolPanelView="None" 
         ToolPanelWidth="200px" Width="652px" />
</asp:Content>

