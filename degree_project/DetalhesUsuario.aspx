<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesUsuario.aspx.vb" Inherits="DetalhesDoador" %>

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
    Font-Size="X-Large" Text="Detalhes do Usuário"></asp:Label>
    &nbsp;<span class="style14"><span class="style15"><a href="javascript:history.go(-1)">Retornar à Página Anterior</a></span></span><br />
    <br />
    <asp:Button ID="btnEditarUsuario" runat="server" Text="Editar dados" 
        style="height: 26px" />
    &nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnExcluirUsuario" runat="server" Text="Excluir usuário" 
        Visible="False" />
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="sqldsDetalhesUsuario" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="NOME" HeaderText="NOME" SortExpression="NOME" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
            <asp:BoundField DataField="USUÁRIO" HeaderText="USUÁRIO" 
                SortExpression="USUÁRIO" />
            <asp:BoundField DataField="CARGO" HeaderText="CARGO" SortExpression="CARGO" />
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
    <asp:SqlDataSource ID="sqldsDetalhesUsuario" runat="server" 
        ConnectionString="<%$ ConnectionStrings:StrConBD %>" 
        
        
        
        SelectCommand="SELECT Pessoas.nome as NOME,  Pessoas.cpf as CPF, Pessoas.nome_usuario as USUÁRIO, Pessoas.cargo as CARGO, Pessoas.data_nascimento as NASCIMENTO, Pessoas.telefone1 as TELEFONE, Pessoas.telefone2 as TELEFONE, Pessoas.endereco as ENDEREÇO, Pessoas.cidade as CIDADE, Pessoas.estado as UF, Pessoas.cep as CEP, Pessoas.email as EMAIL, Pessoas.observacao as OBS FROM Pessoas WHERE Pessoas.tipo_pessoa_id = '3' AND Pessoas.id = @sCodUsuario">
        <SelectParameters>
            <asp:SessionParameter Name="sCodUsuario" SessionField="sCodUsuario" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

