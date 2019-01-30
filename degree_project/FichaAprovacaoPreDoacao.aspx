<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="FichaAprovacaoPreDoacao.aspx.vb" Inherits="FichaAprovacaoPreDoacao" %>

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
    Font-Size="X-Large" Text="Ficha de aprovação pré-doação"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Nome do doador:"></asp:Label>
&nbsp;<asp:TextBox ID="txtNomeDoador" runat="server" ReadOnly="True" Width="414px"></asp:TextBox>
    <br />
    <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Tipo de sangue:"></asp:Label>
&nbsp;<asp:TextBox ID="txtTipoSangue" runat="server" ReadOnly="True" Width="41px"></asp:TextBox>
    <br />
    <asp:Label ID="Label7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="Idade:"></asp:Label>
&nbsp;<asp:TextBox ID="txtIdadeDoador" runat="server" Width="41px"></asp:TextBox>
    &nbsp;<asp:Label ID="Label8" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="anos"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblMensagem" runat="server" Font-Bold="True" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="Responder as perguntas abaixo para que a doação possa ser efetuada"></asp:Label>
    <br />
    <asp:Label ID="lblPergunta11" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Small" 
        
        Text="A ficha de aprovação pré-doação não será aprovada se: 1) O doador tiver menos de 50 quilogramas. 2) Ele houver doado há menos de 60 a 90 dias. 3) For menor de 16 anos. 4) Tiver alguma resposta &quot;Sim&quot; para qualquer uma das perguntas abaixo."></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblPergunta" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="Qual é o peso atual do doador?"></asp:Label>
    <br />
    <asp:TextBox ID="txtPesoDoador" runat="server" Width="48px"></asp:TextBox>
&nbsp;<asp:Label ID="lblPergunta10" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="quilos"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtPesoDoador" ErrorMessage="Preenchimento obrigatório." 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Label ID="lblPergunta0" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador fez aborto ou parto nos últimos TRÊS meses?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta0" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta1" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="A doadora está grávida?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta1" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta2" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" Text="A doadora está amamentando?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta2" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta3" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador fez tatuagem, piercing ou acupuntura no último ano?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta3" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta4" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador recebeu transfusão de sangue no último ano?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta4" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta5" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador ingeriu bebidas alcoólicas nas últimas 24 horas?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta5" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta6" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador é usuário de drogas?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta6" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta7" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador é portador de doenças infectocontagiosas?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta7" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta8" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador teve gripe, resfriado ou diarréia nos últimos SETE dias?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta8" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="lblPergunta9" runat="server" Font-Bold="False" Font-Italic="False" 
        Font-Names="Calibri" Font-Size="Medium" 
        Text="O doador possui algum ferimento não cicatrizado?"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlResposta9" runat="server">
        <asp:ListItem>Sim</asp:ListItem>
        <asp:ListItem>Não</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" TabIndex="3" Text="Enviar" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCancelar" runat="server" CausesValidation="False" 
        TabIndex="2" Text="Cancelar" style="height: 26px" />
    <br />
</asp:Content>

