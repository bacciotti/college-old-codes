<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesReceptor.aspx.vb" Inherits="DetalhesDoador" %>

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
    Font-Size="X-Large" Text="Detalhes do Receptor"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnEditarReceptor" runat="server" Text="Editar dados" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNovaRetirada" runat="server" 
        Text="Nova retirada de sangue" />
    &nbsp;&nbsp;
    <asp:Button ID="btnExcluirReceptor" runat="server" Text="Excluir receptor" 
        Visible="False" />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="sqldsDetalhesReceptor" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" SortExpression="CNPJ" />
            <asp:BoundField DataField="TELEFONE1" HeaderText="TELEFONE1" 
                SortExpression="TELEFONE1" />
            <asp:BoundField DataField="TELEFONE2" HeaderText="TELEFONE2" 
                SortExpression="TELEFONE2" />
            <asp:BoundField DataField="ENDEREÇO" HeaderText="ENDEREÇO" 
                SortExpression="ENDEREÇO" />
            <asp:BoundField DataField="CIDADE" HeaderText="CIDADE" 
                SortExpression="CIDADE" />
            <asp:BoundField DataField="ESTADO" HeaderText="ESTADO" 
                SortExpression="ESTADO" />
            <asp:BoundField DataField="CEP" HeaderText="CEP" 
                SortExpression="CEP" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="OBS" HeaderText="OBS" SortExpression="OBS" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sqldsDetalhesReceptor" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        SelectCommand="SELECT nome as NOME,  cnpj as CNPJ, telefone1 as TELEFONE1, telefone2 as TELEFONE2,endereco as ENDEREÇO, cidade as CIDADE, estado as ESTADO, cep as CEP, email as EMAIL,observacao as OBS
FROM Pessoas
WHERE tipo_pessoa_id = '2' 
AND Pessoas.id = @sCodReceptor">
        <SelectParameters>
            <asp:SessionParameter Name="sCodReceptor" SessionField="sCodReceptor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblTituloPagina0" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Histórico de Retiradas"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gridHistoricoRetiradas" runat="server" 
        AutoGenerateColumns="False" DataSourceID="sqldsHistoricoRetiradas" 
        AllowPaging="True" AllowSorting="True" Font-Names="Calibri" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" 
                InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="DATA" HeaderText="DATA" SortExpression="DATA" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="QUANTIDADE" HeaderText="QUANTIDADE" 
                SortExpression="QUANTIDADE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsHistoricoRetiradas" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT id as ID, data as DATA, debito as QUANTIDADE
FROM Movimentacoes
WHERE pessoa_id = @sCodReceptor
AND debito &gt; 0
ORDER BY data DESC">
        <SelectParameters>
            <asp:SessionParameter Name="sCodReceptor" SessionField="sCodReceptor" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

