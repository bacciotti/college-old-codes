
Partial Class MsgCadastroSucesso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblDataHora.Text = DateTime.Now
        lblNomeDoador.Text = Page.Session("sNomeDoador")
        lblTipoSangue.Text = Page.Session("sTipoSangueDoador")
        lblID.Text = Page.Session("sIdMovimentacao")
    End Sub
End Class
