<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="CadEstabelecimento.aspx.vb" Inherits="Estabelecimento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style6
        {
            font-family: Verdana;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Dados sobre o Estabelecimento"></asp:Label>
    <br />
    <span class="style6">
&nbsp;</span><asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" DataKeyNames="CodigoEstab" 
        DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField CancelText="Cancelar" DeleteText="Deletar" EditText="Editar" 
                SelectText="Detalhes" ShowEditButton="True" UpdateText="Ok" />
            <asp:BoundField DataField="NomeEst" HeaderText="Nome Fantasia" 
                SortExpression="NomeEst" />
            <asp:BoundField DataField="EnderecoEst" HeaderText="Endereço" 
                SortExpression="EnderecoEst" />
            <asp:BoundField DataField="CidadeEst" HeaderText="Cidade" 
                SortExpression="CidadeEst" />
            <asp:BoundField DataField="EstadoEst" HeaderText="Estado" 
                SortExpression="EstadoEst" />
            <asp:BoundField DataField="Tel1Est" HeaderText="Tel. 1" 
                SortExpression="Tel1Est" />
            <asp:BoundField DataField="Tel2Est" HeaderText="Tel. 2" 
                SortExpression="Tel2Est" />
            <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" SortExpression="CNPJ" />
            <asp:BoundField DataField="IE" HeaderText="IE" SortExpression="IE" />
            <asp:BoundField DataField="CEPEstab" HeaderText="CEP" 
                SortExpression="CEPEstab" />
            <asp:BoundField DataField="CodigoEstab" HeaderText="Cód." 
                InsertVisible="False" ReadOnly="True" SortExpression="CodigoEstab" 
                Visible="False" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        OldValuesParameterFormatString="original_{0}" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        SelectCommand="SELECT * FROM [Estabelecimento]" 
        ConflictDetection="CompareAllValues" 
        DeleteCommand="DELETE FROM [Estabelecimento] WHERE [CodigoEstab] = ? AND (([NomeEst] = ?) OR ([NomeEst] IS NULL AND ? IS NULL)) AND (([EnderecoEst] = ?) OR ([EnderecoEst] IS NULL AND ? IS NULL)) AND (([CidadeEst] = ?) OR ([CidadeEst] IS NULL AND ? IS NULL)) AND (([EstadoEst] = ?) OR ([EstadoEst] IS NULL AND ? IS NULL)) AND (([Tel1Est] = ?) OR ([Tel1Est] IS NULL AND ? IS NULL)) AND (([Tel2Est] = ?) OR ([Tel2Est] IS NULL AND ? IS NULL)) AND (([CNPJ] = ?) OR ([CNPJ] IS NULL AND ? IS NULL)) AND (([IE] = ?) OR ([IE] IS NULL AND ? IS NULL)) AND (([CEPEstab] = ?) OR ([CEPEstab] IS NULL AND ? IS NULL))" 
        InsertCommand="INSERT INTO [Estabelecimento] ([NomeEst], [EnderecoEst], [CidadeEst], [EstadoEst], [Tel1Est], [Tel2Est], [CNPJ], [IE], [CEPEstab], [CodigoEstab]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [Estabelecimento] SET [NomeEst] = ?, [EnderecoEst] = ?, [CidadeEst] = ?, [EstadoEst] = ?, [Tel1Est] = ?, [Tel2Est] = ?, [CNPJ] = ?, [IE] = ?, [CEPEstab] = ? WHERE [CodigoEstab] = ? AND (([NomeEst] = ?) OR ([NomeEst] IS NULL AND ? IS NULL)) AND (([EnderecoEst] = ?) OR ([EnderecoEst] IS NULL AND ? IS NULL)) AND (([CidadeEst] = ?) OR ([CidadeEst] IS NULL AND ? IS NULL)) AND (([EstadoEst] = ?) OR ([EstadoEst] IS NULL AND ? IS NULL)) AND (([Tel1Est] = ?) OR ([Tel1Est] IS NULL AND ? IS NULL)) AND (([Tel2Est] = ?) OR ([Tel2Est] IS NULL AND ? IS NULL)) AND (([CNPJ] = ?) OR ([CNPJ] IS NULL AND ? IS NULL)) AND (([IE] = ?) OR ([IE] IS NULL AND ? IS NULL)) AND (([CEPEstab] = ?) OR ([CEPEstab] IS NULL AND ? IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_CodigoEstab" Type="Int32" />
            <asp:Parameter Name="original_NomeEst" Type="String" />
            <asp:Parameter Name="original_NomeEst" Type="String" />
            <asp:Parameter Name="original_EnderecoEst" Type="String" />
            <asp:Parameter Name="original_EnderecoEst" Type="String" />
            <asp:Parameter Name="original_CidadeEst" Type="String" />
            <asp:Parameter Name="original_CidadeEst" Type="String" />
            <asp:Parameter Name="original_EstadoEst" Type="String" />
            <asp:Parameter Name="original_EstadoEst" Type="String" />
            <asp:Parameter Name="original_Tel1Est" Type="String" />
            <asp:Parameter Name="original_Tel1Est" Type="String" />
            <asp:Parameter Name="original_Tel2Est" Type="String" />
            <asp:Parameter Name="original_Tel2Est" Type="String" />
            <asp:Parameter Name="original_CNPJ" Type="String" />
            <asp:Parameter Name="original_CNPJ" Type="String" />
            <asp:Parameter Name="original_IE" Type="String" />
            <asp:Parameter Name="original_IE" Type="String" />
            <asp:Parameter Name="original_CEPEstab" Type="String" />
            <asp:Parameter Name="original_CEPEstab" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NomeEst" Type="String" />
            <asp:Parameter Name="EnderecoEst" Type="String" />
            <asp:Parameter Name="CidadeEst" Type="String" />
            <asp:Parameter Name="EstadoEst" Type="String" />
            <asp:Parameter Name="Tel1Est" Type="String" />
            <asp:Parameter Name="Tel2Est" Type="String" />
            <asp:Parameter Name="CNPJ" Type="String" />
            <asp:Parameter Name="IE" Type="String" />
            <asp:Parameter Name="CEPEstab" Type="String" />
            <asp:Parameter Name="CodigoEstab" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NomeEst" Type="String" />
            <asp:Parameter Name="EnderecoEst" Type="String" />
            <asp:Parameter Name="CidadeEst" Type="String" />
            <asp:Parameter Name="EstadoEst" Type="String" />
            <asp:Parameter Name="Tel1Est" Type="String" />
            <asp:Parameter Name="Tel2Est" Type="String" />
            <asp:Parameter Name="CNPJ" Type="String" />
            <asp:Parameter Name="IE" Type="String" />
            <asp:Parameter Name="CEPEstab" Type="String" />
            <asp:Parameter Name="original_CodigoEstab" Type="Int32" />
            <asp:Parameter Name="original_NomeEst" Type="String" />
            <asp:Parameter Name="original_NomeEst" Type="String" />
            <asp:Parameter Name="original_EnderecoEst" Type="String" />
            <asp:Parameter Name="original_EnderecoEst" Type="String" />
            <asp:Parameter Name="original_CidadeEst" Type="String" />
            <asp:Parameter Name="original_CidadeEst" Type="String" />
            <asp:Parameter Name="original_EstadoEst" Type="String" />
            <asp:Parameter Name="original_EstadoEst" Type="String" />
            <asp:Parameter Name="original_Tel1Est" Type="String" />
            <asp:Parameter Name="original_Tel1Est" Type="String" />
            <asp:Parameter Name="original_Tel2Est" Type="String" />
            <asp:Parameter Name="original_Tel2Est" Type="String" />
            <asp:Parameter Name="original_CNPJ" Type="String" />
            <asp:Parameter Name="original_CNPJ" Type="String" />
            <asp:Parameter Name="original_IE" Type="String" />
            <asp:Parameter Name="original_IE" Type="String" />
            <asp:Parameter Name="original_CEPEstab" Type="String" />
            <asp:Parameter Name="original_CEPEstab" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

