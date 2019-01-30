<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="DetalhesVoluntario.aspx.vb" Inherits="DetalhesDoador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Detalhes do Voluntário e Histórico de Doações"></asp:Label>
&nbsp;&nbsp;&nbsp;<br />
    <asp:Button ID="btnNovaDoacao" runat="server" Text="Nova Doação de Sangue" 
        Width="200px" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCorresp" runat="server" style="text-align: center" 
        Text="Gerar Correspondência" Width="200px" />
    <br />
    <br />
    <strong>Detalhes do Voluntário</strong><br />
    <asp:DetailsView ID="DetailsDoador" runat="server" 
        AutoGenerateRows="False" CellPadding="4" DataKeyNames="CodigoDoador" 
        DataSourceID="DataDetDoador" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="233px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="CodigoDoador" HeaderText="Código" 
                InsertVisible="False" ReadOnly="True" SortExpression="CodigoDoador" />
            <asp:BoundField DataField="Nome" HeaderText="Nome" SortExpression="Nome" />
            <asp:BoundField DataField="DataNasc" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Nascimento" SortExpression="DataNasc" />
            <asp:BoundField DataField="CPF" HeaderText="CPF" SortExpression="CPF" />
            <asp:BoundField DataField="RG" HeaderText="RG" SortExpression="RG" />
            <asp:BoundField DataField="Endereco" HeaderText="Endereço" 
                SortExpression="Endereco" />
            <asp:BoundField DataField="Cidade" HeaderText="Cidade" 
                SortExpression="Cidade" />
            <asp:BoundField DataField="Estado" HeaderText="Estado" 
                SortExpression="Estado" />
            <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Celular" HeaderText="Celular" 
                SortExpression="Celular" />
            <asp:BoundField DataField="Telefone" HeaderText="Telefone" 
                SortExpression="Telefone" />
            <asp:BoundField DataField="TipoSangue" HeaderText="Tipo de Sangue" 
                SortExpression="TipoSangue" />
            <asp:BoundField DataField="Patologias" HeaderText="Patologias" 
                SortExpression="Patologias" />
            <asp:BoundField DataField="Exames" HeaderText="Exames" 
                SortExpression="Exames" />
            <asp:BoundField DataField="Obs" HeaderText="Obs" SortExpression="Obs" />
            <asp:CheckBoxField DataField="Doador" HeaderText="Doador" ReadOnly="True" 
                SortExpression="Doador" />
            <asp:CommandField CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" 
                ShowEditButton="True" UpdateText="Ok" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <strong>Histórico de Doações</strong><br />
    <asp:GridView ID="GridHistorico" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Left" PageSize="40" 
        DataKeyNames="CodigoDoacao" Width="286px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="Data" SortExpression="Data" />
            <asp:BoundField DataField="QtdSangue" HeaderText="Quantidade de Sangue (litros)" 
                SortExpression="QtdSangue" />
            <asp:BoundField DataField="CodigoDoacao" 
                HeaderText="CodigoDoacao" SortExpression="CodigoDoacao" 
                InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="CodigoDoador" HeaderText="CodigoDoador" 
                SortExpression="CodigoDoador" Visible="False" />
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
    &nbsp;&nbsp;&nbsp;
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        
        SelectCommand="SELECT * FROM [Doacoes] WHERE ([CodigoDoador] = ?) ORDER BY [Data] DESC">
        <SelectParameters>
            <asp:SessionParameter Name="CodigoDoador" SessionField="CodigoDoador" 
                Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DataDetDoador" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        SelectCommand="SELECT * FROM [Voluntarios] WHERE ([CodigoDoador] = ?)" 
    ConflictDetection="CompareAllValues" 
    DeleteCommand="DELETE FROM [Voluntarios] WHERE [CodigoDoador] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([DataNasc] = ?) OR ([DataNasc] IS NULL AND ? IS NULL)) AND (([CPF] = ?) OR ([CPF] IS NULL AND ? IS NULL)) AND (([RG] = ?) OR ([RG] IS NULL AND ? IS NULL)) AND (([Endereco] = ?) OR ([Endereco] IS NULL AND ? IS NULL)) AND (([Cidade] = ?) OR ([Cidade] IS NULL AND ? IS NULL)) AND (([Estado] = ?) OR ([Estado] IS NULL AND ? IS NULL)) AND (([CEP] = ?) OR ([CEP] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL)) AND (([Telefone] = ?) OR ([Telefone] IS NULL AND ? IS NULL)) AND (([TipoSangue] = ?) OR ([TipoSangue] IS NULL AND ? IS NULL)) AND (([Patologias] = ?) OR ([Patologias] IS NULL AND ? IS NULL)) AND (([Exames] = ?) OR ([Exames] IS NULL AND ? IS NULL)) AND (([Obs] = ?) OR ([Obs] IS NULL AND ? IS NULL)) AND [Doador] = ?" 
    InsertCommand="INSERT INTO [Voluntarios] ([CodigoDoador], [Nome], [DataNasc], [CPF], [RG], [Endereco], [Cidade], [Estado], [CEP], [Email], [Celular], [Telefone], [TipoSangue], [Patologias], [Exames], [Obs], [Doador]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
    UpdateCommand="UPDATE [Voluntarios] SET [Nome] = ?, [DataNasc] = ?, [CPF] = ?, [RG] = ?, [Endereco] = ?, [Cidade] = ?, [Estado] = ?, [CEP] = ?, [Email] = ?, [Celular] = ?, [Telefone] = ?, [TipoSangue] = ?, [Patologias] = ?, [Exames] = ?, [Obs] = ?, [Doador] = ? WHERE [CodigoDoador] = ? AND (([Nome] = ?) OR ([Nome] IS NULL AND ? IS NULL)) AND (([DataNasc] = ?) OR ([DataNasc] IS NULL AND ? IS NULL)) AND (([CPF] = ?) OR ([CPF] IS NULL AND ? IS NULL)) AND (([RG] = ?) OR ([RG] IS NULL AND ? IS NULL)) AND (([Endereco] = ?) OR ([Endereco] IS NULL AND ? IS NULL)) AND (([Cidade] = ?) OR ([Cidade] IS NULL AND ? IS NULL)) AND (([Estado] = ?) OR ([Estado] IS NULL AND ? IS NULL)) AND (([CEP] = ?) OR ([CEP] IS NULL AND ? IS NULL)) AND (([Email] = ?) OR ([Email] IS NULL AND ? IS NULL)) AND (([Celular] = ?) OR ([Celular] IS NULL AND ? IS NULL)) AND (([Telefone] = ?) OR ([Telefone] IS NULL AND ? IS NULL)) AND (([TipoSangue] = ?) OR ([TipoSangue] IS NULL AND ? IS NULL)) AND (([Patologias] = ?) OR ([Patologias] IS NULL AND ? IS NULL)) AND (([Exames] = ?) OR ([Exames] IS NULL AND ? IS NULL)) AND (([Obs] = ?) OR ([Obs] IS NULL AND ? IS NULL)) AND [Doador] = ?">
        <DeleteParameters>
            <asp:Parameter Name="original_CodigoDoador" Type="Int32" />
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
            <asp:Parameter Name="original_Cidade" Type="String" />
            <asp:Parameter Name="original_Cidade" Type="String" />
            <asp:Parameter Name="original_Estado" Type="String" />
            <asp:Parameter Name="original_Estado" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_TipoSangue" Type="String" />
            <asp:Parameter Name="original_TipoSangue" Type="String" />
            <asp:Parameter Name="original_Patologias" Type="String" />
            <asp:Parameter Name="original_Patologias" Type="String" />
            <asp:Parameter Name="original_Exames" Type="String" />
            <asp:Parameter Name="original_Exames" Type="String" />
            <asp:Parameter Name="original_Obs" Type="String" />
            <asp:Parameter Name="original_Obs" Type="String" />
            <asp:Parameter Name="original_Doador" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CodigoDoador" Type="Int32" />
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="DataNasc" Type="DateTime" />
            <asp:Parameter Name="CPF" Type="String" />
            <asp:Parameter Name="RG" Type="String" />
            <asp:Parameter Name="Endereco" Type="String" />
            <asp:Parameter Name="Cidade" Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="CEP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Telefone" Type="String" />
            <asp:Parameter Name="TipoSangue" Type="String" />
            <asp:Parameter Name="Patologias" Type="String" />
            <asp:Parameter Name="Exames" Type="String" />
            <asp:Parameter Name="Obs" Type="String" />
            <asp:Parameter Name="Doador" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="CodigoDoador" SessionField="CodigoDoador" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Nome" Type="String" />
            <asp:Parameter Name="DataNasc" Type="DateTime" />
            <asp:Parameter Name="CPF" Type="String" />
            <asp:Parameter Name="RG" Type="String" />
            <asp:Parameter Name="Endereco" Type="String" />
            <asp:Parameter Name="Cidade" Type="String" />
            <asp:Parameter Name="Estado" Type="String" />
            <asp:Parameter Name="CEP" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Celular" Type="String" />
            <asp:Parameter Name="Telefone" Type="String" />
            <asp:Parameter Name="TipoSangue" Type="String" />
            <asp:Parameter Name="Patologias" Type="String" />
            <asp:Parameter Name="Exames" Type="String" />
            <asp:Parameter Name="Obs" Type="String" />
            <asp:Parameter Name="Doador" Type="Boolean" />
            <asp:Parameter Name="original_CodigoDoador" Type="Int32" />
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
            <asp:Parameter Name="original_Cidade" Type="String" />
            <asp:Parameter Name="original_Cidade" Type="String" />
            <asp:Parameter Name="original_Estado" Type="String" />
            <asp:Parameter Name="original_Estado" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_CEP" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Celular" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_Telefone" Type="String" />
            <asp:Parameter Name="original_TipoSangue" Type="String" />
            <asp:Parameter Name="original_TipoSangue" Type="String" />
            <asp:Parameter Name="original_Patologias" Type="String" />
            <asp:Parameter Name="original_Patologias" Type="String" />
            <asp:Parameter Name="original_Exames" Type="String" />
            <asp:Parameter Name="original_Exames" Type="String" />
            <asp:Parameter Name="original_Obs" Type="String" />
            <asp:Parameter Name="original_Obs" Type="String" />
            <asp:Parameter Name="original_Doador" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
</asp:Content>

