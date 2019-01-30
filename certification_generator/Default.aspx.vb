
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Page.Session("Nome") = Trim(txtNome.Text)
        Response.Redirect("~/CertGerado.aspx")
    End Sub
End Class
