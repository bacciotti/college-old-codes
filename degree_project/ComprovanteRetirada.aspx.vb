
Partial Class MsgCadastroSucesso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblDataHora.Text = DateTime.Now
        lblNomeDoador.Text = Page.Session("sNomeReceptor")
        lblTipoSangue.Text = Page.Session("sTipoSangueReceptor")
        lblID.Text = Page.Session("sIdMovimentacao")
    End Sub
End Class
