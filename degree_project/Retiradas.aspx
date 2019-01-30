<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Retiradas.aspx.vb" Inherits="Retiradas" %>

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
    Font-Size="X-Large" Text="Retiradas"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:GridView ID="gridRetiradas" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsRetiradas" AllowPaging="True" AllowSorting="True" 
        Font-Names="Calibri" ForeColor="Black" PageSize="20">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="DATA" HeaderText="DATA" SortExpression="DATA" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="SANGUE" HeaderText="SANGUE" 
                SortExpression="SANGUE" />
            <asp:BoundField DataField="QUANTIDADE" HeaderText="QUANTIDADE" 
                SortExpression="QUANTIDADE" />
            <asp:BoundField DataField="ID RECEPTOR" HeaderText="ID RECEPTOR" 
                SortExpression="ID RECEPTOR" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsRetiradas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT M.id as ID, M.data as DATA, S.tipo as SANGUE, M.debito as QUANTIDADE, M.pessoa_id as &quot;ID RECEPTOR&quot;
FROM Movimentacoes M, Sangues S
WHERE M.sangue_id = S.id
AND M.debito &gt; 0
ORDER BY data DESC"></asp:SqlDataSource>
<br />
</asp:Content>

