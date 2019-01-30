<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ListagemVoluntarios.aspx.vb" Inherits="ListagemGeral" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style6
    {
        font-family: Verdana;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Listagem de Voluntários"></asp:Label>
        <br />
        Doadores e possíveis doadores<br />
    <br class="style6" />
    <span class="style6">Buscar Voluntários (por nome):</span><asp:TextBox ID="txtBuscarVol" 
        runat="server" Width="282px"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
</p>
    <p>
    <asp:GridView ID="GridDoadores" runat="server" HorizontalAlign="Left" 
        AutoGenerateColumns="False" DataKeyNames="CodigoDoador" 
        DataSourceID="DataDoadores" AllowPaging="True" AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="25">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField SelectText="Detalhes" ShowSelectButton="True" />
            <asp:BoundField DataField="CodigoDoador" HeaderText="Código" 
                ReadOnly="True" SortExpression="CodigoDoador" InsertVisible="False" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="DataNasc" HeaderText="Nascimento" 
                SortExpression="DataNasc" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                SortExpression="Cidade" />
            <asp:BoundField DataField="Telefone" HeaderText="Telefone" 
                SortExpression="Telefone" />
            <asp:BoundField DataField="TipoSangue" HeaderText="Tipo Sanguíneo" 
                SortExpression="TipoSangue" />
            <asp:CheckBoxField DataField="Doador" HeaderText="Doador" 
                SortExpression="Doador" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
</p>
    <p>
    <asp:SqlDataSource ID="DataDoadores" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        
        
        
            SelectCommand="SELECT [CodigoDoador], [Nome], [DataNasc], [Cidade], [Telefone], [TipoSangue], [Doador] FROM [Voluntarios] ORDER BY [Nome]" 
            OldValuesParameterFormatString="original_{0}">
        </asp:SqlDataSource>
</p>
</asp:Content>

