<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Doações.aspx.vb" Inherits="Doações" %>

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
        Font-Size="Large" Text="Listagem de Doações"></asp:Label>
    <br class="style6" />
</p>
<p>
    <asp:GridView ID="GridDoacoes" runat="server" HorizontalAlign="Left" 
        AutoGenerateColumns="False" DataKeyNames="CodigoDoacao" 
        DataSourceID="DataDoacoes" AllowPaging="True" AllowSorting="True" 
        CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="25">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="CodigoDoacao" HeaderText="Cód. Doação" 
                ReadOnly="True" SortExpression="CodigoDoacao" InsertVisible="False" />
            <asp:BoundField DataField="CodigoDoador" HeaderText="Cód. Doador" 
                SortExpression="CodigoDoador" />
            <asp:BoundField DataField="QtdSangue" HeaderText="Qtde. Sangue (Litros)" 
                SortExpression="QtdSangue" />
            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" 
                DataFormatString="{0:dd/MM/yyyy}" />
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
    <asp:SqlDataSource ID="DataDoacoes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        SelectCommand="SELECT * FROM [Doacoes] ORDER BY [Data] DESC"></asp:SqlDataSource>
</p>
</asp:Content>

