
Partial Class PagCorresp
    Inherits System.Web.UI.Page

    Protected Sub btnGerarCorrespMassa_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnGerarCorrespMassa.Click
        Response.Redirect("~/ConfCorrespMassa.aspx")
    End Sub

End Class
