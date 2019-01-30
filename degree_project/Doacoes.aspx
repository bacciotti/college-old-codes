<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Doacoes.aspx.vb" Inherits="Doacoes" %>

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
    Font-Size="X-Large" Text="Doações"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:GridView ID="gridDoacoes" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsDoacoes" AllowPaging="True" AllowSorting="True" 
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
            <asp:BoundField DataField="ID DOADOR" HeaderText="ID DOADOR" 
                SortExpression="ID DOADOR" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsDoacoes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT M.id as ID, M.data as DATA, S.tipo as SANGUE, M.credito as QUANTIDADE, M.pessoa_id as &quot;ID DOADOR&quot;
FROM Movimentacoes M, Sangues S
WHERE M.sangue_id = S.id
AND M.status =1
AND M.credito &gt; 0
ORDER BY data DESC"></asp:SqlDataSource>
    <br />
    <asp:Label ID="lblTituloPagina0" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Doações não validadas"></asp:Label>
    <asp:HyperLink ID="HyperLink1" runat="server" Font-Names="Calibri" 
        Font-Size="Small" Target="_blank" NavigateUrl="~/Ajuda/Validardoao.html">[?]</asp:HyperLink>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblMsgDoacaoNaoValidada" runat="server" Font-Names="Calibri" 
        
        Text="Não existem doações não validadas." 
        Font-Size="Large" Visible="False"></asp:Label>
    <br />
    <asp:GridView ID="gridDoacoesNaoValidadas" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsDoacoesNaoValidadas" AllowPaging="True" 
        AllowSorting="True" Font-Names="Calibri" ForeColor="Black">
        <Columns>
            <asp:CommandField ShowSelectButton="True" SelectText="Validar doação" />
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="DATA" HeaderText="DATA" SortExpression="DATA" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="SANGUE" HeaderText="SANGUE" 
                SortExpression="SANGUE" />
            <asp:BoundField DataField="QUANTIDADE" HeaderText="QUANTIDADE" 
                SortExpression="QUANTIDADE" />
            <asp:BoundField DataField="ID DOADOR" HeaderText="ID DOADOR" 
                SortExpression="ID DOADOR" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsDoacoesNaoValidadas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT M.id as ID, M.data as DATA, S.tipo as SANGUE, M.credito as QUANTIDADE, M.pessoa_id as &quot;ID DOADOR&quot;
FROM Movimentacoes M, Sangues S
WHERE M.sangue_id = S.id 
AND M.status = 0
AND M.credito &gt;0
ORDER BY data DESC"></asp:SqlDataSource>
<br />
<br />
</asp:Content>

