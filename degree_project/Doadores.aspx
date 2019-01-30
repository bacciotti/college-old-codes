<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Doadores.aspx.vb" Inherits="Voluntarios" %>

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
    Font-Size="X-Large" Text="Doadores"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnCadastrarDoador" runat="server" 
        Text="Cadastrar novo doador" />
    <br />
    <br />
    <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Names="Calibri" 
        Font-Size="Small" Text="Busca por nome ou ID"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlTipoBusca" runat="server" AutoPostBack="True" 
        style="height: 22px">
        <asp:ListItem>Busca por nome</asp:ListItem>
        <asp:ListItem>Busca por ID</asp:ListItem>
    </asp:DropDownList>
&nbsp;<asp:TextBox ID="txtBusca" runat="server" Width="302px" 
        CausesValidation="True" MaxLength="50"></asp:TextBox>
&nbsp;
    <asp:Button ID="btnBusca" runat="server" Text="Buscar " Width="55px" />
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtBusca" Enabled="False" ErrorMessage="Valor inválido" 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        MaximumValue="999999999" MinimumValue="0" SetFocusOnError="True"></asp:RangeValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Doadores.aspx">Listagem completa</asp:HyperLink>
    <br />
    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" 
        Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" 
        style="text-align: center" Text="Nenhum resultado encontrado!" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gridDoadores" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="sqldsDoadores" style="text-align: center" 
        Font-Names="Calibri" ForeColor="Black" PageSize="20">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Detalhes" />
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NOME" HeaderText="NOME" 
                SortExpression="NOME" />
            <asp:BoundField DataField="SANGUE" HeaderText="SANGUE" 
                SortExpression="SANGUE" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" 
                SortExpression="CPF" />
            <asp:BoundField DataField="TELEFONE" 
                HeaderText="TELEFONE" SortExpression="TELEFONE" />
            <asp:BoundField DataField="NASCIMENTO" HeaderText="NASCIMENTO" 
                SortExpression="NASCIMENTO" DataFormatString="{0:dd/MM/yyyy}" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsDoadores" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        
        
        SelectCommand="SELECT Pessoas.id as ID,Pessoas.nome as NOME, Sangues.tipo as SANGUE, Pessoas.cpf as CPF, Pessoas.telefone1 as TELEFONE, Pessoas.data_nascimento  as NASCIMENTO FROM Pessoas, Sangues WHERE tipo_pessoa_id = 1 AND Sangues.id = Pessoas.sangue_id ORDER BY Pessoas.nome">
    </asp:SqlDataSource>
<br />
</asp:Content>

