
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Dim obj_Pessoa_BLL As New PessoaBLL
        Dim Resposta As Integer = obj_Pessoa_BLL.AutenticaUsuario(Login1.UserName, Login1.Password)

        Login1.Focus()

        If Resposta = 0 Then
            'Usuario nao cadastrado
            e.Authenticated = False
        ElseIf Resposta = 1 Then
            'Autenticadao OK!
            '--------------------------------------------------------------------------------------------
            'Testa se o usuário é Administrador (flag 2) ou Usuário Normal (Flag 1) e atribui à Session
            'sUserRole, a qual será usada POR TODO O SOFTWARE.
            If obj_Pessoa_BLL.UsuarioAdmin(Login1.UserName) Then
                Page.Session("sUserRole") = 2
            Else
                Page.Session("sUserRole") = 1
            End If
            '--------------------------------------------------------------------------------------------
            e.Authenticated = True
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, True)
        ElseIf Resposta = 2 Then
            'Usuario/senha invalidos
            e.Authenticated = False
        End If
    End Sub
End Class
