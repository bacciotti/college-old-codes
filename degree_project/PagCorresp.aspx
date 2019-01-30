<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="PagCorresp.aspx.vb" Inherits="PagCorresp" %>

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
    Font-Size="X-Large" Text="Correspondências"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnGerarCorrespMassa" runat="server" 
        Text="Gerar correspondências em massa" />
    <br />
    <br />
    <asp:GridView ID="gridCorresp" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" 
        DataSourceID="sqldsCorresp" style="text-align: center" 
        Font-Names="Calibri" ForeColor="Black" PageSize="20">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="DATA" HeaderText="DATA" 
                SortExpression="DATA" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsCorresp" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        
        SelectCommand="SELECT C.id as ID, C.data as DATA, P.nome as NOME
FROM  Correspondencias C, Pessoas P
WHERE C.pessoa_id = P.id
ORDER BY data DESC">
    </asp:SqlDataSource>
</asp:Content>

