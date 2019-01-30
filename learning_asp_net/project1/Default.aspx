<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" 
            Text="Início"></asp:Label>
        <br />
        <asp:Label ID="lblMsgGerente" runat="server" Text="Bom dia sr. Gerente!" 
            Visible="False"></asp:Label>
        <br />
        <asp:Button ID="btnNovousuairo" runat="server" Text="Cadastrar novo usuário" 
            Width="179px" />
        <br />
        <br />
        <asp:GridView ID="GridUsuarios" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
            GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" SelectText="Alterar" />
                <asp:BoundField DataField="id" HeaderText="ID" 
                    SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="usuario" HeaderText="Usuário" 
                    SortExpression="usuario" />
                <asp:BoundField DataField="papel" HeaderText="Papel" SortExpression="papel" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:estudandoConnectionString %>" 
            SelectCommand="SELECT [id], [usuario], [papel] FROM [Usuarios]">
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
