
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub lblEntrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lblEntrar.Click
        Dim objUsr As Usuario
        objUsr = Usuario.ValidarUsuario(txtUsuario.Text)

        If Not (objUsr Is Nothing) Then
            If objUsr.senha = txtSenha.Text Then
                Dim ticket As FormsAuthenticationTicket
                ticket = New FormsAuthenticationTicket(1, txtUsuario.Text, DateTime.Now, DateTime.Now.AddMinutes(30), chkLembrar.Checked, objUsr.papel, FormsAuthentication.FormsCookiePath)
                Dim ticketCriptografado As String
                ticketCriptografado = FormsAuthentication.Encrypt(ticket)
                Dim cookie As HttpCookie
                cookie = New HttpCookie(FormsAuthentication.FormsCookieName, ticketCriptografado)
                If ticket.IsPersistent Then
                    cookie.Expires = ticket.Expiration
                End If
                Response.Cookies.Add(cookie)
                Dim urlRetorno As String
                If Not (Request.QueryString("ReturnURL") Is Nothing) Then
                    urlRetorno = CStr(Request.QueryString("ReturnURL"))
                Else
                    urlRetorno = "~"
                End If
                Response.Redirect(urlRetorno)
            Else
                lblMensagem.Text = "Senha invalida!"
            End If
        Else
            lblMensagem.Text = "Usuário não cadastrado!"
        End If
    End Sub
End Class
