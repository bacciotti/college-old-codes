<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesDoador.aspx.vb" Inherits="DetalhesDoador" %>

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
    Font-Size="X-Large" Text="Detalhes do Doador"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnEditarDoador" runat="server" Text="Editar dados" 
        height="26px" width="109px" />
    &nbsp;&nbsp;
    <asp:Button ID="btnNovaDoacao" runat="server" Text="Nova doação " height="26px" 
        width="109px" />
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnGerarCorrespondencia" runat="server" 
        Text="Gerar correspondência" height="26px" width="138px" />
    <br />
    <br />
    <asp:Button ID="btnExcluirDoador" runat="server" Text="Excluir doador" 
        Visible="False" height="26px" width="109px" />
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="sqldsDetalhesDoador" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
            <asp:BoundField DataField="SANGUE" HeaderText="SANGUE" 
                SortExpression="SANGUE" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
            <asp:BoundField DataField="NASCIMENTO" HeaderText="NASCIMENTO" 
                SortExpression="NASCIMENTO" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="TELEFONE" HeaderText="TELEFONE" 
                SortExpression="TELEFONE" />
            <asp:BoundField DataField="TELEFONE1" HeaderText="TELEFONE1" 
                SortExpression="TELEFONE1" />
            <asp:BoundField DataField="ENDEREÇO" HeaderText="ENDEREÇO" 
                SortExpression="ENDEREÇO" />
            <asp:BoundField DataField="CIDADE" HeaderText="CIDADE" 
                SortExpression="CIDADE" />
            <asp:BoundField DataField="UF" HeaderText="UF" 
                SortExpression="UF" />
            <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="OBS" HeaderText="OBS" 
                SortExpression="OBS" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sqldsDetalhesDoador" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        SelectCommand="SELECT Pessoas.nome as NOME,  Sangues.tipo as SANGUE,  Pessoas.cpf as CPF, Pessoas.data_nascimento as NASCIMENTO, Pessoas.telefone1 as TELEFONE, Pessoas.telefone2 as TELEFONE, Pessoas.endereco as ENDEREÇO, Pessoas.cidade as CIDADE, Pessoas.estado as UF, Pessoas.cep as CEP, Pessoas.email as EMAIL, Pessoas.observacao as OBS FROM Pessoas, Sangues WHERE Pessoas.tipo_pessoa_id = '1' AND Pessoas.sangue_id = Sangues.id AND Pessoas.id = @sCodDoador">
        <SelectParameters>
            <asp:SessionParameter Name="sCodDoador" SessionField="sCodDoador" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Label ID="lblTituloPagina0" runat="server" Font-Bold="True" Font-Names="Calibri" 
    Font-Size="X-Large" Text="Histórico de Doações"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="gridHistoricoDoacoes" runat="server" 
        AutoGenerateColumns="False" DataSourceID="sqldsHistoricoDoacoes" 
        AllowPaging="True" AllowSorting="True" Font-Names="Calibri" ForeColor="Black">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="DATA" HeaderText="DATA" SortExpression="DATA" 
                DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="QUANTIDADE" HeaderText="QUANTIDADE" 
                SortExpression="QUANTIDADE" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="sqldsHistoricoDoacoes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" SelectCommand="SELECT id as ID, data as DATA, credito as QUANTIDADE
FROM Movimentacoes
WHERE pessoa_id = @sCodDoador
ORDER BY data DESC">
        <SelectParameters>
            <asp:SessionParameter Name="sCodDoador" SessionField="sCodDoador" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

