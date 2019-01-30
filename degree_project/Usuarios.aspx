<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Usuarios.aspx.vb" Inherits="Usuarios" %>

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
    Font-Size="X-Large" Text="Usuários"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnCadastrarUsuario" runat="server" 
        Text="Cadastrar novo usuário" />
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
&nbsp;<asp:TextBox ID="txtBusca" runat="server" Width="394px"></asp:TextBox>
    <asp:Button ID="btnBusca" runat="server" Text="Buscar" Width="71px" />
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="txtBusca" Enabled="False" ErrorMessage="Valor inválido" 
        Font-Bold="True" Font-Names="Calibri" ForeColor="#CC0000" 
        MaximumValue="999999999" MinimumValue="0" SetFocusOnError="True"></asp:RangeValidator>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        NavigateUrl="~/Usuarios.aspx">Listagem completa</asp:HyperLink>
    <br />
    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" 
        Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" 
        style="text-align: center" Text="Nenhum resultado encontrado!" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gridUsuarios" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsUsuarios" AllowPaging="True" AllowSorting="True" 
        Font-Names="Calibri" ForeColor="Black" PageSize="20">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Detalhes" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
            <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" 
                SortExpression="USUARIO" />
            <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsUsuarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        
        SelectCommand="SELECT id as ID,nome as NOME, nome_usuario as USUARIO, cargo as CARGO
FROM Pessoas
WHERE tipo_pessoa_id = 3 
ORDER BY nome">
    </asp:SqlDataSource>
<br />
<br />
</asp:Content>

