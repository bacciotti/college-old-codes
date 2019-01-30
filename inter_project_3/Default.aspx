<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" BorderStyle="None" 
    DisplayRememberMe="False" PasswordLabelText="Senha:" 
    PasswordRequiredErrorMessage="Senha requerida" UserNameLabelText="Usuário:" 
    UserNameRequiredErrorMessage="Usuário requerido" Width="259px" 
        FailureText="Algum erro ocorreu. Tente novamente.">
</asp:Login>
</asp:Content>

