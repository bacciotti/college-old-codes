
Partial Class CadastrarRetirada
    Inherits System.Web.UI.Page

    Protected Sub btnEnviar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviar.Click
        Dim obj_Movimentacao_BLL As New MovimentacaoBLL
        Dim QtdeBolsas As Integer = txtQtdeBolsas.Text
        Dim obj_Receptor As New Receptor
        '------------------------------------------------------------------------------------------------
        'O "IdTipoSangue" e o Índice da DropDownList é o mesmo. É só assimilar um ao outro. Mais fácil, poupa código.
        'A+  = 1
        'A-  = 2
        'B+  = 3 
        'B-  = 4
        'O+  = 5 
        'O-  = 6
        'AB+ = 7
        'AB- = 8
        Dim IdTipoSangue As Integer = ddlTipoSanguineo.SelectedIndex
        '------------------------------------------------------------------------------------------------
        obj_Receptor = Page.Session("sObjReceptor")

        If obj_Movimentacao_BLL.PodeRetirar(IdTipoSangue, QtdeBolsas) Then
            Dim obj_Movimentacao As New Movimentacao
            '------------------------------------------------------------------------------------------------
            'Importantíssimo zerar pCredito aqui, pois o que vai diferenciar DÉBITO de CRÉDITO (Retirada de Doação) é 
            'é o fator [CREDITO > 0]  ou [DEBITO > 0]
            obj_Movimentacao.pCredito = 0
            '------------------------------------------------------------------------------------------------
            obj_Movimentacao.pData = Date.Today
            obj_Movimentacao.pDebito = txtQtdeBolsas.Text
            obj_Movimentacao.pPessoa_id = Page.Session("sCodReceptor")
            obj_Movimentacao.pSangue_id = IdTipoSangue

            If obj_Movimentacao_BLL.InsereRetirada(obj_Movimentacao) Then
                Page.Session("sIdMovimentacao") = obj_Movimentacao_BLL.RetornaIdMovimentacao(obj_Movimentacao)
                '------------------------------------------------------------------------------------------------------
                'Daqui para frente não vai usar mais a Session SCODRECEPTOR, por isso vou "matá-la", para não ter problema.
                'Lembrar de testar isso.
                Page.Session("sCodReceptor") = "0"
                Page.Session("sTipoSangueReceptor") = Trim(ddlTipoSanguineo.Text)
                '------------------------------------------------------------------------------------------------------
                Response.Redirect("~/ComprovanteRetirada.aspx")
            Else
                '-----------------------------------------------------------------------------------------------
                'Título e Subtítulo da página de Erro
                Page.Session("sTituloMsg") = "Algum erro ocorreu"
                Page.Session("sSubTituloMsg") = "Algum erro ocorreu na gravação dos dados. Tente novamente."
                Response.Redirect("~/MsgErro.aspx")
                '-----------------------------------------------------------------------------------------------
            End If
        Else
            '-----------------------------------------------------------------------------------------------
            'Título e Subtítulo da página de Erro
            Page.Session("sTituloMsg") = "Quantidade insuficiente"
            Page.Session("sSubTituloMsg") = "Não existe quantidade suficiente de bolsas para realizar essa retirada."
            Response.Redirect("~/MsgErro.aspx")
            '-----------------------------------------------------------------------------------------------
        End If


    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Botão padrão: Enviar
        Page.Form.DefaultButton = btnEnviar.UniqueID

        txtData.Text = Date.Today
        txtCodDoReceptor.Text = Page.Session("sCodReceptor")
        txtNomeReceptor.Text = Page.Session("sNomeReceptor")
        ddlTipoSanguineo.Focus()
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        Response.Redirect("~/Receptores.aspx")
    End Sub
End Class
