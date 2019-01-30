
Partial Class MsgSucesso
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblTitulo.Text = Page.Session("sTituloMsg")
        lblSubTitulo.Text = Page.Session("sSubTituloMsg")
    End Sub
End Class
