
Partial Class CadastrarDoacao
    Inherits System.Web.UI.Page

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Doadores.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID

        txtCodDoador.Text = Page.Session("sCodDoador")
        txtNomeDoador.Text = Page.Session("sNomeDoador")
        txtTipoSangue.Text = Page.Session("sTipoSangueDoador")
        txtData.Text = Date.Today
        txtQtdeBolsas.Focus()
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim obj_Movimentacao_BLL As New MovimentacaoBLL
        Dim obj_Movimentacao As New Movimentacao
        Dim Obj_Doador As New Doador

        Obj_Doador = Page.Session("sObjDoador")
        obj_Movimentacao.pCredito = txtQtdeBolsas.Text
        obj_Movimentacao.pData = Date.Today
        obj_Movimentacao.pDebito = 0
        obj_Movimentacao.pPessoa_id = Page.Session("sCodDoador")
        obj_Movimentacao.pSangue_id = Obj_Doador.pSangue_id

        If obj_Movimentacao_BLL.InsereDoacao(obj_Movimentacao) Then
            Page.Session("sIdMovimentacao") = obj_Movimentacao_BLL.RetornaIdMovimentacao(obj_Movimentacao)
            '------------------------------------------------------------------------------------------------------
            'Daqui para frente não vai usar mais a sessão "SCodDoador", por isso vou "matá-la", para não ter problema.
            'Lembrar de testar isso.
            Page.Session("sCodDoador") = "0"
            '------------------------------------------------------------------------------------------------------
            Response.Redirect("~/ComprovanteDoacao.aspx")
        Else
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Algum erro ocorreu"
            Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If
    End Sub
End Class

