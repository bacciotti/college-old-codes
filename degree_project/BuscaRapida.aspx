<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BuscaRapida.aspx.vb" Inherits="BuscaRapida" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style17
    {
        width: 100%;
        font-family: Calibri;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblTituloPagina" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Busca rápida"></asp:Label>
    &nbsp;<span class="style14"><span class="style17"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
<br />
    <asp:Label ID="lblResultado" runat="server" Font-Bold="True" 
        Font-Names="Calibri" Font-Size="Large" ForeColor="#CC0000" 
        style="text-align: center" Text="Nenhum resultado encontrado!" Visible="False"></asp:Label>
    <asp:GridView ID="gridBuscaRapida" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="sqldsBuscaRapida" style="text-align: center" 
        Font-Names="Calibri" ForeColor="Black" PageSize="20">
        <Columns>
            <asp:CommandField SelectText="Detalhes" ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NOME" HeaderText="NOME" 
                SortExpression="NOME" />
            <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsBuscaRapida" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        
        
        SelectCommand="SELECT P.id as ID,P.nome as NOME,  T.tipo as TIPO 
FROM Pessoas P, Tipo_pessoas T
WHERE P.tipo_pessoa_id = T.id
ORDER BY P.nome">
    </asp:SqlDataSource>
</asp:Content>

