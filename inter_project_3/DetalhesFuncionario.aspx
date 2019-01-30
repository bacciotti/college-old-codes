<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesFuncionario.aspx.vb" Inherits="DetalhesFuncionario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Detalhes do Funcionário"></asp:Label>
    <br />
    <asp:DetailsView ID="DetailsFunc" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataKeyNames="CodigoFunc" DataSourceID="SqlDataSource1" 
        ForeColor="#333333" GridLines="None" Height="50px" Width="125px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CodigoFunc" HeaderText="Código" 
                InsertVisible="False" ReadOnly="True" SortExpression="CodigoFunc" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="DataNasc" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Nascimento" SortExpression="DataNasc" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
            <asp:BoundField DataField="RG" HeaderText="RG" SortExpression="RG" />
            <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                SortExpression="Endereco" />
            <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Celular" HeaderText="Celular" 
                SortExpression="Celular" />
            <asp:BoundField DataField="Telefone" HeaderText="Telefone" 
                SortExpression="Telefone" />
            <asp:BoundField DataField="Cargo" HeaderText="Cargo" SortExpression="Cargo" />
            <asp:BoundField DataField="NomeUsuario" HeaderText="Nome de Usuário" 
                SortExpression="NomeUsuario" />
            <asp:BoundField DataField="Senha" HeaderText="Senha" SortExpression="Senha" />
            <asp:CommandField CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" 
                ShowDeleteButton="True" ShowEditButton="True" UpdateText="Ok" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        DeleteCommand="DELETE FROM [Funcionarios] WHERE [CodigoFunc] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([DataNasc] = ?) OR ([DataNasc] IS NULL AND ? IS NULL)) AND (([CPF] = ?) OR ([CPF] IS NULL AND ? IS NULL)) AND (([RG] = ?) OR ([RG] IS NULL AND ? IS NULL)) AND (([Endereco] = ?) OR ([Endereco] IS NULL AND ? IS NULL)) AND (([CEP] = ?) OR ([CEP] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL)) AND (([Telefone] = ?) OR ([Telefone] IS NULL AND ? IS NULL)) AND (([Cargo] = ?) OR ([Cargo] IS NULL AND ? IS NULL)) AND (([NomeUsuario] = ?) OR ([NomeUsuario] IS NULL AND ? IS NULL)) AND (([Senha] = ?) OR ([Senha] IS NULL AND ? IS NULL))" 
        InsertCommand="INSERT INTO [Funcionarios] ([CodigoFunc], [Nome], [DataNasc], [CPF], [RG], [Endereco], [CEP], [Email], [Celular], [Telefone], [Cargo], [NomeUsuario], [Senha]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        SelectCommand="SELECT * FROM [Funcionarios] WHERE ([CodigoFunc] = ?)" 
        UpdateCommand="UPDATE [Funcionarios] SET [Nome] = ?, [DataNasc] = ?, [CPF] = ?, [RG] = ?, [Endereco] = ?, [CEP] = ?, [Email] = ?, [Celular] = ?, [Telefone] = ?, [Cargo] = ?, [NomeUsuario] = ?, [Senha] = ? WHERE [CodigoFunc] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([DataNasc] = ?) OR ([DataNasc] IS NULL AND ? IS NULL)) AND (([CPF] = ?) OR ([CPF] IS NULL AND ? IS NULL)) AND (([RG] = ?) OR ([RG] IS NULL AND ? IS NULL)) AND (([Endereco] = ?) OR ([Endereco] IS NULL AND ? IS NULL)) AND (([CEP] = ?) OR ([CEP] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL)) AND (([Telefone] = ?) OR ([Telefone] IS NULL AND ? IS NULL)) AND (([Cargo] = ?) OR ([Cargo] IS NULL AND ? IS NULL)) AND (([NomeUsuario] = ?) OR ([NomeUsuario] IS NULL AND ? IS NULL)) AND (([Senha] = ?) OR ([Senha] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CodigoFunc" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_DataNasc" Type="DateTime" />
            <asp:Parameter Name="original_DataNasc" Type="DateTime" />
            <asp:Parameter Name="original_CPF" Type="String" />
            <asp:Parameter Name="original_CPF" Type="String" />
            <asp:Parameter Name="original_RG" Type="String" />
            <asp:Parameter Name="original_RG" Type="String" />
            <asp:Parameter Name="original_Endereco" Type="String" />
            <asp:Parameter Name="original_Endereco" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_Senha" Type="String" />
            <asp:Parameter Name="original_Senha" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodigoFunc" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="DataNasc" Type="DateTime" />
            <asp:Parameter Name="CPF" Type="String" />
            <asp:Parameter Name="RG" Type="String" />
            <asp:Parameter Name="Endereco" Type="String" />
            <asp:Parameter Name="CEP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Telefone" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="Senha" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CodigoFunc" SessionField="CodigoFunc" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="DataNasc" Type="DateTime" />
            <asp:Parameter Name="CPF" Type="String" />
            <asp:Parameter Name="RG" Type="String" />
            <asp:Parameter Name="Endereco" Type="String" />
            <asp:Parameter Name="CEP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Telefone" Type="String" />
            <asp:Parameter Name="Cargo" Type="String" />
            <asp:Parameter Name="NomeUsuario" Type="String" />
            <asp:Parameter Name="Senha" Type="String" />
            <asp:Parameter Name="original_CodigoFunc" Type="Int32" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_Nome" Type="String" />
            <asp:Parameter Name="original_DataNasc" Type="DateTime" />
            <asp:Parameter Name="original_DataNasc" Type="DateTime" />
            <asp:Parameter Name="original_CPF" Type="String" />
            <asp:Parameter Name="original_CPF" Type="String" />
            <asp:Parameter Name="original_RG" Type="String" />
            <asp:Parameter Name="original_RG" Type="String" />
            <asp:Parameter Name="original_Endereco" Type="String" />
            <asp:Parameter Name="original_Endereco" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_Cargo" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_NomeUsuario" Type="String" />
            <asp:Parameter Name="original_Senha" Type="String" />
            <asp:Parameter Name="original_Senha" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    </asp:Content>

