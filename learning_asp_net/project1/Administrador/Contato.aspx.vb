
Partial Class Administrador_Contato
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (User.Identity.IsAuthenticated) And (Request.QueryString("ReturnUrl") <> vbNull) Then
            Response.Redirect("~/AcessoNegado.aspx")
        End If
    End Sub
End Class
