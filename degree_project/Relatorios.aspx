<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Relatorios.aspx.vb" Inherits="Relatorios" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style15
        {
            font-family: Calibri;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Relatórios"></asp:Label>
    <span class="style14"><span class="style15">&nbsp;<a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <br />
    <asp:DropDownList ID="ddlRelatorio" runat="server" AutoPostBack="True" 
        CausesValidation="True">
        <asp:ListItem>Selecione o relatório...</asp:ListItem>
        <asp:ListItem>Movimentações por período</asp:ListItem>
        <asp:ListItem>Doações por período</asp:ListItem>
        <asp:ListItem>Retiradas por período</asp:ListItem>
        <asp:ListItem>Quantidade de bolsas disponíveis</asp:ListItem>
        <asp:ListItem>Doadores cadastrados</asp:ListItem>
        <asp:ListItem>Receptores cadastrados</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="ddlRelatorio" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        InitialValue="Selecione o relatório..." SetFocusOnError="True"></asp:RequiredFieldValidator>
    <br />
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Font-Names="Calibri" 
        Text="Informe o período:"></asp:Label>
    &nbsp;<br />
    <asp:Label ID="Label15" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Formato:  dd/mm/aaaa"></asp:Label>
    <br />
    <asp:Label ID="Label9" runat="server" Font-Names="Calibri" Text="de"></asp:Label>
&nbsp;<asp:TextBox ID="txtDataInicio" runat="server" Enabled="False" TabIndex="1"></asp:TextBox>
&nbsp;<asp:Label ID="Label10" runat="server" Font-Names="Calibri" Text="até"></asp:Label>
&nbsp;<asp:TextBox ID="txtDataFim" runat="server" Enabled="False" TabIndex="2"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="txtDataInicio" ControlToValidate="txtDataFim" 
        ErrorMessage="Datas inválidas" Font-Bold="True" Font-Names="Calibri" 
        ForeColor="#CC0000" Operator="GreaterThanEqual" Type="Date" 
        SetFocusOnError="True"></asp:CompareValidator>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
        ControlToValidate="txtDataInicio" ErrorMessage="Formato inválido." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="\d{2}\/\d{2}\/\d{4}" SetFocusOnError="True"></asp:RegularExpressionValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
        ControlToValidate="txtDataFim" ErrorMessage="Formato inválido." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        ValidationExpression="\d{2}\/\d{2}\/\d{4}" SetFocusOnError="True"></asp:RegularExpressionValidator>
    <br />
    <br />
    <br />
    <asp:Button ID="btnGerarRelatorio" runat="server" style="text-align: center" 
        Text="Gerar Relatório" TabIndex="3" />
    <br />
    </asp:Content>

