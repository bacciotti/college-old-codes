
Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub btnNovousuairo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovousuairo.Click
        Page.Session("Flag") = 1
        Response.Redirect("~/CadUsu.aspx")
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridUsuarios.SelectedIndexChanged
        Page.Session("Flag") = 0
        Page.Session("CodUser") = GridUsuarios.SelectedRow.Cells(1).Text
        Page.Session("NomeUser") = GridUsuarios.SelectedRow.Cells(2).Text
        Response.Redirect("~/CadUsu.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If User.IsInRole("Gerente") Then
            lblMsgGerente.Visible = True
        End If
    End Sub
End Class
