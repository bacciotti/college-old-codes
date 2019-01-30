
Partial Class ListagemRetiradas
    Inherits System.Web.UI.Page

    Protected Sub btnNvRetirada_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNvRetirada.Click
        Response.Redirect("~/RetiradaDeSangue.aspx")
    End Sub
End Class
