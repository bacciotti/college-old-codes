
Partial Class DoacaoRealizada
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblData.Text = DateTime.Now 'Informa a data e hora atuais
    End Sub
End Class
