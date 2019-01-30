<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PreDoacao.aspx.vb" Inherits="PreDoacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Ficha de Aprovação Pré-Doação"></asp:Label>
    <br />
    <br />
    Nome:
    <asp:Label ID="lblNome" runat="server" Font-Bold="True"></asp:Label>
    &nbsp;<br />
    Tipo Sanguíneo:
    <asp:Label ID="lblTipoSangue" runat="server" Font-Bold="True"></asp:Label>
    <br />
    <br />
    Peso:<asp:TextBox ID="txtPeso" runat="server" Width="35px"></asp:TextBox>
&nbsp;Kg&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="txtPeso" ErrorMessage="Campo obrigatório!" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br />
    Idade Atual:<asp:TextBox ID="txtIdade" runat="server" Width="37px"></asp:TextBox>
&nbsp;anos&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="txtIdade" ErrorMessage="Campo obrigatório!" 
        ForeColor="#CC0000"></asp:RequiredFieldValidator>
    <br />
    Aborto/Parto nos últimos 3 meses?<asp:DropDownList ID="ddAborto" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Gravidez?<asp:DropDownList ID="ddGravidez" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Amamentando?<asp:DropDownList ID="ddAmamen" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Se alimentou nas últimas duas horas?<asp:DropDownList ID="ddAlimentacao" 
        runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Tatuagem, piercing ou acupuntura no último ano?<asp:DropDownList ID="ddTatu" 
        runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Recebeu transfusão de sangue ou hemoderivados no último ano?<asp:DropDownList 
        ID="ddTransf" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Ingeriu bebidas alcoólicas nas últimas 24 horas?<asp:DropDownList ID="ddAlco" 
        runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Usuário de drogas?<asp:DropDownList ID="ddDrogas" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Portador de doenças infectocontagiosas?
    <asp:DropDownList ID="ddDoencas" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Gripe, resfriado ou diarréia nos últimos 7 dias?<asp:DropDownList ID="ddGripe" 
        runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    Ferimento não cicatrizado?<asp:DropDownList ID="ddFerimento" runat="server">
        <asp:ListItem>Não</asp:ListItem>
        <asp:ListItem>Sim</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:Button ID="btnEnviar" runat="server" Text="Enviar" />
    <br />
    <br />
    <strong>&nbsp; Outras condições que também podem impedir a doação serão 
    avaliadas na triagem clínica,&nbsp; antes da efetiva doação.</strong><br />
    <br />
</asp:Content>

