Imports System.Data.OleDb

Partial Class CadastroDoação
    Inherits System.Web.UI.Page

    Protected Sub btnLimpar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLimpar.Click
        LimparFormulario() 'Chamando o método que limpa os text's
    End Sub

    Private Sub LimparFormulario()
        txtCodigoDoador.Text = ""
        txtData.Text = ""
        txtNomeDoador.Text = ""
        txtQtdSangue.Text = ""
        txtTipoSangueDoador.Text = ""
    End Sub
    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        'Criando e instanciando um objeto da classe Doacao 
        'iniciar o processo de gravar no banco
        Dim D As Doacao
        D = New Doacao
        'Atribuindo os valores dos textbox aos atributos do objeto
        D.data = txtData.Text
        D.CodigoDoador = txtCodigoDoador.Text
        D.QtdeSangue = txtQtdSangue.Text
        D.TipoSangueDoador = txtTipoSangueDoador.Text
        D.QtdeSangue = txtQtdSangue.Text
        'chamando o Metodo que grava os dados no banco
        D.GravarDados()
        Response.Redirect("~/DoacaoRealizada.aspx")
        LimparFormulario()
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Sempre que se iniciar uma nova doação o campo DATA vai receber a 
        'data atual. Ele é SOMENTE LEITURA.
        txtData.Text = DateTime.Now.Date

        'Atribuindo os textbox SOMENTE LEITURA com as Sessoes definidas na pagina anterior. 
        txtCodigoDoador.Text = Page.Session("CodigoDoador")
        txtNomeDoador.Text = Page.Session("NomeDoador")
        txtTipoSangueDoador.Text = Page.Session("TipoSangueDoador")
    End Sub
End Class
