<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ListagemRetiradas.aspx.vb" Inherits="ListagemRetiradas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Retiradas De Sangue"></asp:Label>
<br />
Data, quantidades retiradas e descrição das saídas de sangue<br />
<br />
<asp:Button ID="btnNvRetirada" runat="server" 
    Text="Efetuar Nova Retirada de Sangue" />
    <br />
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
    GridLines="None" AllowPaging="True" AllowSorting="True" PageSize="25">
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    <Columns>
        <asp:BoundField DataField="Data" DataFormatString="{0:dd/MM/yyyy}" 
            HeaderText="Data" SortExpression="Data" />
        <asp:BoundField DataField="TipoSangue" HeaderText="Tipo de Sangue" 
            SortExpression="TipoSangue" />
        <asp:BoundField DataField="Litros" HeaderText="Litros" 
            SortExpression="Litros" />
        <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
            SortExpression="Descricao" />
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConfigC %>" 
    ProviderName="<%$ ConnectionStrings:ConfigC.ProviderName %>" 
    SelectCommand="SELECT [Data], [TipoSangue], [Litros], [Descricao] FROM [Retiradas] ORDER BY [Data] DESC">
</asp:SqlDataSource>
</asp:Content>

