
Partial Class FichaAprovacaoPreDoacao
    Inherits System.Web.UI.Page

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Doadores.aspx")
    End Sub

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim obj_FichaPreDoacao As New FichaPreDoacao
        Dim obj_Pessoa_BLL As New PessoaBLL
		'--------------------------------------------------------------------------------------------
		'-- Define os atributos do objeto FichaPreDoacao e insere no banco.
		'--------------------------------------------------------------------------------------------

        obj_FichaPreDoacao.pPeso_doador = txtPesoDoador.Text
        obj_FichaPreDoacao.pAborto_parto = ddlResposta0.SelectedIndex
        obj_FichaPreDoacao.pAmamentando = ddlResposta2.SelectedIndex
        obj_FichaPreDoacao.pBebidas_alcoolicas = ddlResposta5.SelectedIndex
        obj_FichaPreDoacao.pDoencas_infectocontagiosas = ddlResposta7.SelectedIndex
        obj_FichaPreDoacao.pFerimento = ddlResposta9.SelectedIndex
        obj_FichaPreDoacao.pGravida = ddlResposta1.SelectedIndex
        obj_FichaPreDoacao.pGripe_resfriado_diarreia = ddlResposta8.SelectedIndex
        obj_FichaPreDoacao.pTatuagem_piercing_acupuntura = ddlResposta3.SelectedIndex
        obj_FichaPreDoacao.pTransfusao = ddlResposta4.SelectedIndex
        obj_FichaPreDoacao.pUsuario_drogas = ddlResposta6.SelectedIndex

        If txtIdadeDoador.Text > 16 And
            txtPesoDoador.Text > 50 And
            ddlResposta0.SelectedIndex = 1 And
            ddlResposta1.SelectedIndex = 1 And
            ddlResposta2.SelectedIndex = 1 And
            ddlResposta3.SelectedIndex = 1 And
            ddlResposta4.SelectedIndex = 1 And
            ddlResposta5.SelectedIndex = 1 And
            ddlResposta6.SelectedIndex = 1 And
            ddlResposta7.SelectedIndex = 1 And
            ddlResposta8.SelectedIndex = 1 And
            ddlResposta9.SelectedIndex = 1 Then
            obj_FichaPreDoacao.pAprovada = 1
            Page.Session("sRetornoFuncaoGrava") = obj_Pessoa_BLL.GravaFichaPreDoacao(obj_FichaPreDoacao)
            Response.Redirect("~/CadastrarDoacao.aspx")
        Else
            obj_FichaPreDoacao.pAprovada = 0
            Page.Session("sRetornoFuncaoGrava") = obj_Pessoa_BLL.GravaFichaPreDoacao(obj_FichaPreDoacao)
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Doação não permitida"
            Page.Session("sSubTituloMsg") = "Desculpe, sua doação foi recusada por você não obter os requisitos mínimos. Obrigado pela iniciativa."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtIdadeDoador.Text = Page.Session("sIdadeDoador")
        txtNomeDoador.Text = Page.Session("sNomeDoador")
        txtTipoSangue.Text = Page.Session("sTipoSangueDoador")
        txtPesoDoador.Focus()
    End Sub
End Class
