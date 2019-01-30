<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="RetiradaDeSangue.aspx.vb" Inherits="RetiradaDeSangue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Verdana" 
        Font-Size="Large" Text="Retirada de Sangue"></asp:Label>
<br />
Retirada de alguma quantidade do banco de sangue.<br />
<br />
Tipo de Sangue:<asp:DropDownList ID="ddTipoSangue" runat="server">
    <asp:ListItem>A+</asp:ListItem>
    <asp:ListItem>A-</asp:ListItem>
    <asp:ListItem>B+</asp:ListItem>
    <asp:ListItem>B-</asp:ListItem>
    <asp:ListItem>O+</asp:ListItem>
    <asp:ListItem>O-</asp:ListItem>
    <asp:ListItem>AB+</asp:ListItem>
    <asp:ListItem>AB-</asp:ListItem>
</asp:DropDownList>
<br />
Litros:<asp:TextBox ID="txtLitros" runat="server" Width="31px"></asp:TextBox>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
    ControlToValidate="txtLitros" ErrorMessage="Campo obrigatório" 
    ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br />
Descrição:<br />
<asp:TextBox ID="txtDescr" runat="server" Width="728px"></asp:TextBox>
<br />
Data:<br />
<asp:TextBox ID="txtData" runat="server" ReadOnly="True"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
    ControlToValidate="txtDescr" ErrorMessage="Campo obrigatório" 
    ForeColor="#CC0000"></asp:RequiredFieldValidator>
<br />
<br />
<asp:Button ID="btnRetirada" runat="server" Text="Efetuar Retirada" />
</asp:Content>

