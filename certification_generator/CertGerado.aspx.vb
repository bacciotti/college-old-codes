
Partial Class CertGerado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblData.Text = Date.Today.ToLongDateString
        lblNome.Text = Page.Session("Nome")
    End Sub
End Class
