Imports System.Data.OleDb

Partial Class Relatorios
    Inherits System.Web.UI.Page

    Protected Sub btnRelDoacoes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRelDoacoes.Click
        Response.Redirect("~/RelDoacoes.aspx")
    End Sub

    Protected Sub btnRelRetiradas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRelRetiradas.Click
        Response.Redirect("~/RelRetiradas.aspx")
    End Sub
End Class
