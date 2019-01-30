<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ListagemFuncionarios.aspx.vb" Inherits="ListagemFuncionarios" %>

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
        Font-Size="Large" Text="Listagem de Funcionários"></asp:Label>
        <br />
        <span class="style6">Buscar Funcionário (pelo nome):</span><asp:TextBox 
        ID="txtBuscarFuncionario" runat="server" Width="282px"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
        <br />
</p>
<p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
        DataKeyNames="CodigoFunc" DataSourceID="DataFuncionarios" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Left" PageSize="25">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField SelectText="Detalhes" ShowSelectButton="True" />
            <asp:BoundField DataField="CodigoFunc" HeaderText="Código" 
                SortExpression="CodigoFunc" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" 
                SortExpression="Nome" />
            <asp:BoundField DataField="NomeUsuario" HeaderText="Nome de Usuário" 
                SortExpression="NomeUsuario" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" 
                SortExpression="Cargo" />
            <asp:BoundField DataField="Celular" HeaderText="Celular" 
                SortExpression="Celular" />
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
    <asp:SqlDataSource ID="DataFuncionarios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        
        
        SelectCommand="SELECT [CodigoFunc], [Nome], [NomeUsuario], [Cargo], [Celular] FROM [Funcionarios]" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Funcionarios] WHERE [CodigoFunc] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([NomeUsuario] = ?) OR ([NomeUsuario] IS NULL AND ? IS NULL)) AND (([Cargo] = ?) OR ([Cargo] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL))" 
        InsertCommand="INSERT INTO [Funcionarios] ([CodigoFunc], [Nome], [NomeUsuario], [Cargo], [Celular]) VALUES (?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Funcionarios] SET [Nome] = ?, [NomeUsuario] = ?, [Cargo] = ?, [Celular] = ? WHERE [CodigoFunc] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([NomeUsuario] = ?) OR ([NomeUsuario] IS NULL AND ? IS NULL)) AND (([Cargo] = ?) OR ([Cargo] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CodigoFunc" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodigoFunc" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="original_CodigoFunc" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</p>
</asp:Content>

