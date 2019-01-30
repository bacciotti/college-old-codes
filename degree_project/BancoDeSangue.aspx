<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="BancoDeSangue.aspx.vb" Inherits="BancoDeSangue" %>

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
    Font-Size="X-Large" Text="Banco de Sangue"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:GridView ID="gridBancoSangue" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsBancoSangue" AllowSorting="True" Font-Names="Calibri" 
        Font-Overline="False" Font-Underline="False" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="SANGUE" HeaderText="SANGUE" 
                SortExpression="SANGUE" />
            <asp:BoundField DataField="QUANTIDADE (bolsas)" 
                HeaderText="QUANTIDADE (bolsas)" ReadOnly="True" 
                SortExpression="QUANTIDADE (bolsas)" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsBancoSangue" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT Sangues.tipo as SANGUE, SUM(Movimentacoes.credito - Movimentacoes.debito) as 'QUANTIDADE (bolsas)'
FROM Sangues INNER JOIN Movimentacoes ON Sangues.id = Movimentacoes.sangue_id
WHERE Movimentacoes.status = 1
GROUP BY Sangues.tipo
"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="gridDoadoresSangue" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sqldsDoadoresSangue" AllowSorting="True" Font-Names="Calibri" 
        Font-Overline="False" Font-Underline="False" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="TIPO DE SANGUE" HeaderText="TIPO DE SANGUE" 
                SortExpression="TIPO DE SANGUE" />
            <asp:BoundField DataField="TOTAL DE DOADORES" HeaderText="TOTAL DE DOADORES" ReadOnly="True" 
                SortExpression="TOTAL DE DOADORES" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsDoadoresSangue" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT  S.tipo as 'TIPO DE SANGUE',Count(*) as 'TOTAL DE DOADORES'
FROM
Banco.dbo.Pessoas P, Banco.dbo.Sangues S
WHERE P.sangue_id=S.id
AND p.tipo_pessoa_id=1
GROUP BY s.tipo
"></asp:SqlDataSource>
    <br />
    </asp:Content>

