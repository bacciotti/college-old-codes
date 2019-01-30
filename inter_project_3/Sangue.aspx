<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Sangue.aspx.vb" Inherits="Sangue" %>

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
        Font-Size="Large" Text="Banco de Sangue"></asp:Label>
    <br />
    Quantidade de litros existentes no banco para cada tipo de sangue.<br class="style6" />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataKeyNames="TipoSangue" DataSourceID="DataSangue" 
    ForeColor="#333333" GridLines="None" HorizontalAlign="Left" 
        AllowSorting="True">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="TipoSangue" HeaderText="Tipo" ReadOnly="True" 
            SortExpression="TipoSangue" />
        <asp:BoundField DataField="Quantidade" HeaderText="Qtde. (litros)" 
            SortExpression="Quantidade" />
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" HorizontalAlign="Left" AllowPaging="True" 
        AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="TipoSangue" HeaderText="Tipo" 
                SortExpression="TipoSangue" />
            <asp:BoundField DataField="Expr1001" HeaderText="Nº de voluntários" 
                SortExpression="Expr1001" />
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
        ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
        SelectCommand="Select TipoSangue,Count(Nome) from Voluntarios group by TipoSangue">
    </asp:SqlDataSource>
<asp:SqlDataSource ID="DataSangue" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
    ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
    SelectCommand="SELECT * FROM [Sangues]"></asp:SqlDataSource>
</asp:Content>

